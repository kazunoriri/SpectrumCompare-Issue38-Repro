# Verification record — 2026-11-07

## Direct observations with the final diagnostic devices

The environment is listed in README. All Live observations used stopped transport and GUI operations. Write counts from a simulated host were not used as Undo counts.

| Scope | Result / evidence |
| --- | --- |
| Numeric normal input | Live ON lane outputs 2. / one atom; one added Undo row. `evidence/01-numeric-control.png`. |
| Numeric assign | Live OFF lane outputs 0. 2. / two atoms; ON outputs 0. / one atom. Assign/bang add no history row in the observed sequence. `evidence/01-numeric-assign.png`. |
| Blob runtime | Normal beta reads beta; assign alpha reads assign alpha. `evidence/02-blob-runtime.png`. |
| Blob ALS contents | Normal state `["beta"]`; Assign state `["baseline"]`. Extracted from the Live-saved ALS. |
| Blob actual reload | After switching Sets and reopening the path-sanitized Primitive ALS, bang reads beta / baseline. `evidence/02-blob-reopened.png`. |
| Shared seed | Live-saved source/mirror mismatch detailed in README. Both tracks load at 8192 / 0%. `evidence/03-seed.png`. |
| Shared Smooth edit | Only A Smooth edited to 50%; both instances become 8192 / 50%. One new history row. `evidence/03-edit.png`. |
| Shared Undo | One Undo changes both instances to 4096 / 0%, including the unrelated FFT. `evidence/03-undo-origin.png`, `03-undo-peer.png`. |
| Shared Redo | One Redo changes both instances to 8192 / 50%. `evidence/03-redo-origin.png`, `03-redo-peer.png`. |

Test 3 reproduces the **cross-setting Undo symptom in a reduced two-instance experiment**. It does not establish the exact internal host mechanism, reproduce every original five-device failure, or prove that the requirements are impossible.

The public folder was also copied to a different directory and both cleaned ALS files were opened there. With absolute FileRef paths blank, both Shared devices loaded at 8192 / 0%; the Smooth edit followed by one Undo again produced 4096 / 0% on both tracks. The Primitive Set also loaded its two devices, with numeric ON = 2 and Blob readbacks beta / baseline. This verifies the supplied relative layout and repeats the reduced symptom. No test edits were saved over the seed state.

## Public-copy cleanup and revalidation

Only a separate publication workspace was modified. In each copied ALS, the unused library groove was selected in Live's Groove Pool, deleted, and the Set saved using Live. The complete decompressed XML, including GroovePool, was then inspected: **zero Groove objects, MidiNoteEvent records, AudioClip/MidiClip objects, and SampleRef objects** remain in either Set.

The original source/AMXD files were not changed. The cleaned Sets retain the two-track device placements, relative file references, saved source values, mirrors, and routing. XML comparison accounted for the removed GroovePool content and ordinary Live serialization changes: regenerated local IDs, device file timestamps, and equivalent numeric JSON formatting. No other differences remained after these normalizations. Absolute FileRef fallback paths introduced by Live saving were blanked in the unloaded public copies; the relative paths were preserved, then both Sets were reopened and tested.

The primary test was repeated after this cleanup. Both tracks started at 8192 / 0%, changed to 8192 / 50% after only Shared A Smooth was edited, and changed to **4096 / 0% after one Undo**. One Redo returned both to 8192 / 50%. The matching `03-*` evidence images are from the cleaned copies, including both tracks before editing and after the edit. The same Undo symptom was repeated from the relocated cleaned copy. This confirms symptom reproduction, not the host's internal cause.

Preparation backups, including the older groove-containing versions, were excluded from the publication folder and ZIP. The package checker now rejects groove/note/clip/sample content across the entire ALS, rather than checking only track clips.

## Preparation failure, excluded artifacts

An early ALS assembled from a different device's XML template crashed Live while loading on 2026-11-07 at approximately 06:34 JST. The OS report records EXC_BAD_ACCESS / SIGSEGV at address 0x30 on thread 0. The cause is not established. Raw diagnostics and the rejected generated ALS were preserved privately outside this folder; the crash is not attributed to `assign` or presented as the issue reproduction.

The two shipped Sets were subsequently prepared by loading an empty Set, **inserting the diagnostic AMXDs through Live**, saving through Live, and reopening. No rejected generated device-containing ALS is included. Initial patch preflights also corrected parameter attribute placement, mirror visibility, and presentation height before the final runs recorded above. Preliminary outputs from those configurations are not final test evidence.

## Remaining limits

- Numeric assign-to-ALS persistence and its effect on a subsequent Undo baseline were not separately established; the numeric value already fails the direct readback check.
- Blob assign is a scope/contract probe, not a documented symbol overload. The optional longer Blob input is untested.
- `pattrstorage` silent persistence, insertion transaction grouping, callback ordering/identity, five-instance alternating-origin sequences, deletion/duplication, and old product Set migration remain unverified here.
- The original product insertion increments 1/3/5 were historical observations in Issue #42, not measured again with these minimal devices.
- Normal-input numeric Undo/Redo, automated functional checks, and an exhaustive Max Console error review are not claimed. The native shared Undo/Redo and persistence checks above are the measured scope.
- Public delivery and anonymous download verification are recorded separately in SHARING.md; authenticated repository access is not evidence of anonymous accessibility.

The package checker verifies source/AMXD equality, parameter definitions, patchline endpoints, relative ALS references, expected saved seed values, and absence of local absolute paths in textual/decoded artifacts. That check is structural evidence, distinct from the GUI results above.

From this folder, `node build-amxd.cjs --check` verifies byte-for-byte reproducibility, and `node check-package.cjs` checks the package. `node check-package.cjs --manifest` refreshes MANIFEST.json after an authorized change. The optional build helper emits editable audio-effect AMXDs from the corresponding maxpat JSON; no Freeze/collective packaging or external resources are needed. Rebuild only with the diagnostic devices unloaded, then update the test Sets and rerun native checks before claiming new results.
