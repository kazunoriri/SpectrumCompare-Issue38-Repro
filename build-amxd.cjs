// Optional authoring helper. Runtime needs no Node or external files.
// Run only with the diagnostic devices unloaded: node build-amxd.cjs
// Verify without writing: node build-amxd.cjs --check
const fs = require('node:fs');
const path = require('node:path');
const assert = require('node:assert/strict');
for (const name of ['01-numeric-assign', '02-blob-persistence', '03-shared-source-mirror']) {
  const source = fs.readFileSync(path.join(__dirname, name + '.maxpat'));
  const patch = JSON.parse(source).patcher;
  assert.deepEqual(patch.dependency_cache, []);
  // Editable ampf/audio-effect + meta + ptch form used by the native-tested devices.
  // This is not a claim that Max's Freeze command was used.
  const payload = Buffer.concat([source, Buffer.from([0])]);
  const header = Buffer.from('616d706604000000616161616d65746104000000000000007074636800000000', 'hex');
  header.writeUInt32LE(payload.length, 28);
  const result = Buffer.concat([header, payload]);
  const target = path.join(__dirname, name + '.amxd');
  if (process.argv.includes('--check')) assert.deepEqual(fs.readFileSync(target), result);
  else fs.writeFileSync(target, result);
}
console.log(process.argv.includes('--check') ? 'All 3 AMXDs match their source bytes.' : 'Built 3 editable AMXDs. Run check-package.cjs and repeat native checks after source changes.');
