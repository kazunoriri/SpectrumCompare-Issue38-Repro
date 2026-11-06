// Usage: node check-package.cjs [--manifest]
// Read-only checks; --manifest additionally writes hashes for all package files.
// Does not run Max/Live, create runtime evidence, or assert functional PASS.
const fs = require('node:fs');
const path = require('node:path');
const zlib = require('node:zlib');
const crypto = require('node:crypto');
const assert = require('node:assert/strict');
const root = __dirname;
const names = ['01-numeric-assign', '02-blob-persistence', '03-shared-source-mirror'];
const sha = b => crypto.createHash('sha256').update(b).digest('hex');
const patches = {};
for (const name of names) {
  const source = fs.readFileSync(path.join(root, name + '.maxpat'));
  const amxd = fs.readFileSync(path.join(root, name + '.amxd'));
  assert.equal(amxd.subarray(0, 12).toString('hex'), '616d70660400000061616161');
  assert.equal(amxd.subarray(24, 28).toString(), 'ptch');
  assert.equal(amxd.readUInt32LE(28), amxd.length - 32);
  assert.equal(amxd.at(-1), 0);
  assert.deepEqual(JSON.parse(amxd.subarray(32, -1)), JSON.parse(source));
  const p = patches[name] = JSON.parse(source).patcher;
  assert.deepEqual(p.dependency_cache, []);
  const boxes = Object.fromEntries(p.boxes.map(({box}) => [box.id, box]));
  assert.equal(Object.keys(boxes).length, p.boxes.length, 'duplicate box ID');
  const ports = b => {
    if (b.maxclass === 'comment') return [0, 0];
    if (b.maxclass === 'message' || b.maxclass === 'number') return [2, 1];
    if (b.maxclass === 'live.menu') return [1, 3];
    const t = b.text;
    if (/^pattr /.test(t)) return [1, 3];
    if (/^t /.test(t)) return [1, t.split(' ').length - 1];
    if (/^gate /.test(t)) return [2, 1];
    if (/^print |^s /.test(t)) return [1, 0];
    if (/^r /.test(t) || t === 'live.thisdevice') return [0, 1];
    if (t === 'plugin~') return [1, 2];
    if (t === 'plugout~') return [2, 0];
    if (t === 'zl len') return [2, 2];
    if (/^prepend /.test(t)) return [1, 1];
    throw Error('Unexpected object: ' + t);
  };
  const seen = new Set();
  for (const {patchline: l} of p.lines) {
    const [a, ao] = l.source, [b, bi] = l.destination;
    assert.ok(boxes[a] && boxes[b]);
    assert.ok(ao >= 0 && ao < ports(boxes[a])[1]);
    assert.ok(bi >= 0 && bi < ports(boxes[b])[0]);
    const key = JSON.stringify([l.source, l.destination]);
    assert.ok(!seen.has(key), 'duplicate patchline'); seen.add(key);
  }
  for (const b of Object.values(boxes).filter(b => b.saved_attribute_attributes)) {
    assert.ok(p.parameters[b.id], 'parameter omitted from mapping');
    if (b.text?.startsWith('pattr ')) {
      assert.equal(b.saved_object_attributes.parameter_enable, 1);
      assert.ok(!Object.hasOwn(b, 'parameter_enable'), 'pattr registration on box, not object');
    }
  }
  if (name.startsWith('01')) {
    assert.equal(boxes['OFF-p'].saved_object_attributes.parameter_enable, 0);
    assert.equal(boxes['ON-p'].saved_object_attributes.type, 'float32');
    assert.equal(boxes['ON-p'].saved_attribute_attributes.valueof.parameter_type, 0);
    assert.equal(boxes['ON-p'].saved_attribute_attributes.valueof.parameter_invisible, 1);
  }
  if (name.startsWith('03')) for (const key of ['fft', 'smooth']) {
    const v = boxes[key + '-mirror'].saved_attribute_attributes.valueof;
    assert.equal(v.parameter_invisible, 3, 'mirror must be Visible (stored), not Hidden');
    assert.equal(v.parameter_visible_undoable, 0);
    assert.equal(boxes[key + '-gate'].text, 'gate 1 0');
    assert.equal(boxes[key + '-receive'].text, 't b i b');
    assert.ok(seen.has(JSON.stringify([[key + '-receive', 2], [key + '-close', 0]])));
    assert.ok(seen.has(JSON.stringify([[key + '-receive', 1], [key + '-apply', 0]])));
    assert.ok(seen.has(JSON.stringify([[key + '-receive', 0], [key + '-open', 0]])));
  }
}
const saved = {};
for (const name of ['Primitive-tests', 'Shared-tests']) {
  const folder = path.join(root, 'Live-tests Project');
  const xml = zlib.gunzipSync(fs.readFileSync(path.join(folder, name + '.als'))).toString();
  assert.equal((xml.match(/<AudioTrack\b/g) || []).length, 2);
  assert.equal((xml.match(/<MxDeviceAudioEffect\b/g) || []).length, 2);
  assert.equal((xml.match(/<AudioClip\b|<MidiClip\b|<MidiNoteEvent\b|<Groove\b|<SampleRef\b/g) || []).length, 0,
    'unexpected clip, note, groove, or sample content anywhere in ALS');
  assert.ok(/<Grooves\s*\/>/.test(xml), 'Groove Pool must be empty');
  for (const m of xml.matchAll(/<RelativePath Value="([^"]+)"/g)) {
    const target = path.resolve(folder, m[1]);
    assert.ok(target.startsWith(root + path.sep), 'reference escapes package');
    assert.ok(fs.existsSync(target), 'missing device');
  }
  const blobs = [...xml.matchAll(/<Blob>([\s\S]*?)<\/Blob>/g)].map(m =>
    JSON.parse(Buffer.from(m[1].replace(/\s/g, ''), 'hex').toString().replace(/\0+$/, '')));
  saved[name] = blobs;
  if (name === 'Primitive-tests') {
    assert.deepEqual(blobs, [{'Numeric ON': [2]}, {'Assign state': ['baseline'], 'Normal state': ['beta']}]);
  } else {
    assert.deepEqual(blobs, [{'fft source': [0], 'smooth source': [0]}, {'fft source': [1], 'smooth source': [0]}]);
    const mirrors = [...xml.matchAll(/<MxDRemoteableEnumParameter\b[\s\S]*?<\/MxDRemoteableEnumParameter>/g)].map(m => {
      assert.ok(m[0].includes('<IsUndoable Value="false" />'));
      assert.ok(m[0].includes('<IsStored Value="true" />'));
      return {name: /<Name Value="([^"]*)"/.exec(m[0])[1], value: Number(/<Remoteable Value="([^"]*)"/.exec(m[0])[1])};
    });
    assert.deepEqual(mirrors, [{name:'fft mirror',value:1},{name:'smooth mirror',value:0},{name:'fft mirror',value:1},{name:'smooth mirror',value:0}]);
  }
}
function files(dir) {
  return fs.readdirSync(dir, {withFileTypes:true}).filter(e => e.name !== '.git').flatMap(e => e.isDirectory() ? files(path.join(dir,e.name)) : [path.join(dir,e.name)]);
}
const manifest = {};
for (const f of files(root)) {
  const rel = path.relative(root, f);
  assert.ok(!/(^|\/)(Backup|\.DS_Store)(\/|$)/.test(rel), 'preparation artifact');
  const b = fs.readFileSync(f);
  let text = f.endsWith('.als') ? zlib.gunzipSync(b).toString() : b.toString();
  // PNG pixels are not text, but include their metadata in the same path check.
  assert.ok(!/\/Users\/|\/private\/tmp\/|[A-Z]:\\Users\\/.test(text), 'private local path in ' + rel);
  if (!f.endsWith('.png')) {
    for (const m of text.matchAll(/<Blob>([\s\S]*?)<\/Blob>/g)) {
      assert.ok(!/\/Users\/|\/private\/tmp\//.test(Buffer.from(m[1].replace(/\s/g,''),'hex').toString()));
    }
  }
  if (rel !== 'MANIFEST.json') manifest[rel] = {bytes:b.length, sha256:sha(b)};
}
if (process.argv.includes('--manifest')) fs.writeFileSync(path.join(root,'MANIFEST.json'), JSON.stringify({
  scope:'File integrity and structure only; native observations are recorded in RESULTS.md.',
  saved_als_source_values:saved,
  files:manifest
}, null, 2) + '\n');
console.log('PASS: 3 source/AMXD pairs, patch structure, 2 prepared ALS files, saved seeds, relative references, and local-path scan. No runtime PASS inferred.');
