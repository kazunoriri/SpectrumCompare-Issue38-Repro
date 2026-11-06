# Minimal Max / Max for Live reproduction: saved state and Undo

Prepared 2026-11-07. Start with **Test 3** for the cross-setting Undo problem, or **Test 1** for the numeric `pattr assign` discrepancy. These are diagnostic patches, not a proposed product fix. No SpectrumCompare code, FFT processing, third-party externals, scripts, samples, or permanent manager device is needed at runtime.

**Smallest reproduction of Issue #38:** download the [complete ZIP](https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/releases/download/repro-20261107/SpectrumCompare-Issue38-Repro.zip), extract it, and open `Live-tests Project/Shared-tests.als`. Follow **Test 3** below. Its only runtime dependency is the supplied `03-shared-source-mirror.amxd`, used twice. The `.maxpat` exposes all wiring for inspection. Tests 1 and 2 are optional, separate probes for the related support questions.

| Files | Needed for |
| --- | --- |
| `03-shared-source-mirror.amxd`, corresponding `.maxpat`, `Live-tests Project/Shared-tests.als` | Primary cross-setting Undo reproduction; start here. |
| `01-numeric-assign.amxd`, corresponding `.maxpat`, `Live-tests Project/Primitive-tests.als` | Optional numeric pattr/assign comparison. |
| `02-blob-persistence.amxd`, corresponding `.maxpat`, the same Primitive Set | Optional Blob persistence comparison. |
| `RESULTS.md`, `evidence/`, `MANIFEST.json` | Measured results, screenshots, and file integrity. |

The public ALS copies were cleaned through Live's Groove Pool UI and reverified after saving. Both contain **zero grooves, MIDI note events, audio/MIDI clips, and sample references**. No bundled library content is required. The original private evidence and Sets were left unchanged.

## 1. Environment

- macOS 27.0.1 (26A434), Apple Silicon / arm64.
- Ableton Live 12 Suite 12.4.16 (2026-10-30_e33287a1c7).
- Bundled Max 9.1.5 (3db35fa476d).
- Tested with transport stopped. Audio playback is unnecessary.
- Other OS / Live / Max versions have not been tested with these files.

## 2. Problem

We need shared settings across independently insertable, duplicable, and removable M4L instances: one user edit should create one Undo entry, and Undo/Redo should change only that setting across all instances. Automatic peer updates must also survive saving the Live Set.

The reduced source/mirror experiment uses two Stored Only, undoable `live.menu` sources and two saved Visible mirrors with Undo When Visible disabled per instance. Peer updates normally write the mirrors and use `assign` on the sources behind closed output gates. A saved source can therefore differ from its displayed/runtime value and mirror. After reopening, Undo of Smooth also changes FFT.

Separately, the previous support email concerned automatic variable-length state bookkeeping during insertion (internal Issue #42). That is distinct from the shared-setting problem (internal Issue #38). Test 2 isolates the persistence question from that email; it does **not** reproduce the original insertion-count sequence.

## 3. Expected Behavior

- In Test 3, starting from 8192 / 0%, editing Smooth to 50% and undoing once should leave both instances at **8192 / 0%**. Redo should produce 8192 / 50%.
- In Test 1, the float argument to `pattr assign` should become the single stored/output float, as described in the [pattr reference](https://docs.cycling74.com/reference/pattr/#assign). Whether “stored” also guarantees Live Set persistence and a future Undo baseline is a question, not an assumption.
- For internal variable-length state, we are asking whether a supported persist-without-Undo mechanism exists. We are **not** asserting that `assign` officially supports symbols/lists/Blob data.

## 4. Actual Behavior

Observed directly in Live with the supplied devices on 2026-11-07:

| Test | Observed result |
| --- | --- |
| 1: normal `2.` → bang | Parameter ON: `2.`, one atom; one added device-change Undo row. |
| 1: `0.` → `assign 2.` → bang | Parameter OFF: `0. 2.`, two atoms. Parameter ON / Float / Stored Only: `0.`, one atom. No additional Undo row for assign/bang in this sequence. |
| 2: normal `beta` vs `assign alpha` | Runtime readbacks: `beta` vs `assign alpha`. Saved ALS values: `["beta"]` vs `["baseline"]`. After reopening: `beta` vs `baseline`. |
| 3: reopen supplied Set | Both source and mirror displays: FFT 8192, Smooth 0%. |
| 3: edit only Shared A Smooth to 50% | Both instances: 8192 / 50%; exactly one new Undo History row. |
| 3: Undo once | **Both instances: 4096 / 0%. FFT changes unexpectedly.** |
| 3: Redo once | Both instances: 8192 / 50%; history advances to the same edit. |

Screenshots and scoped results are in [evidence](evidence/) and [RESULTS.md](RESULTS.md). The Live host's internal snapshot boundaries and callback origin remain unproven.

## 5. Steps to Reproduce

Download the **whole folder**, retaining its layout. Do not download an HTML GitHub file page and rename it as a patch. Open a fresh copy of the relevant ALS for each test; do not overwrite the supplied seed Sets. In Live, enable **View → Undo History**. No playback is required.

### Test 3 — two independent instances, unrelated setting changes on Undo

1. Open [Live-tests Project/Shared-tests.als](<Live-tests Project/Shared-tests.als>). Both tracks already contain `03-shared-source-mirror.amxd`.
2. Select **Shared A**. In the device's two rows, the left menu is the source and the right menu is the saved mirror (read-only). Confirm FFT 8192 / Smooth 0% in both columns. Select **Shared B**, confirm the same, then return to **Shared A**.
3. Note the Undo History rows. Change only the **left Smooth menu** from 0% to 50%. Confirm 8192 / 50% on both tracks. The observed history increment is one device-change row.
4. Return to the normal Live window if a menu remains open. Press Cmd-Z once (Windows: Ctrl-Z). Inspect both tracks. Expected: 8192 / 0%. Observed: **4096 / 0%**.
5. Redo once (macOS Cmd-Shift-Z; use Live's Edit menu on other systems). Inspect both tracks. Observed: 8192 / 50%.
6. Close without saving the changed test copy, then reopen the seed Set to repeat.

How the seed was made: two fresh devices started at 4096 / 0%; **Shared B** FFT was edited to 8192; the Set was saved and reopened. The saved source indices are A `{fft:0,smooth:0}`, B `{fft:1,smooth:0}`; both saved mirrors are `{fft:1,smooth:0}`. On load, each instance copies its own mirrors into its runtime sources with `assign`, then opens its source gates. There is no load-time broadcast. These are naturally saved values, not injected Undo notifications or hand-edited parameter states.

For independent reconstruction, insert the same `03` AMXD on each of two audio tracks in an empty Set, follow the seed sequence above, then steps 2–5. The bus names are global to these test devices; use only the intended two instances for this test. This is a reduction, not the full five-device product or a lifecycle solution.

### Test 1 — unbound numeric pattr

1. Open [Live-tests Project/Primitive-tests.als](<Live-tests Project/Primitive-tests.als>) and select **Numeric test**. `01-numeric-assign.amxd` is already inserted.
2. In the **Parameter OFF** lane, click `0.`, `assign 2.`, then `bang`. Read the entire message output and adjacent atom count: observed `0. 2.` / 2 atoms.
3. Repeat in the **Parameter ON / Float / Stored Only** lane. Observed `0.` / 1 atom. Compare history immediately before/after assign, excluding any normal reset write.
4. In that ON lane, click normal `2.`, then `bang`: observed `2.` / 1 atom and one added Undo row. This is the normal-input control.
5. To inspect the patch, open `01-numeric-assign.maxpat` in Max, lock it, and use the same messages. Max Console labels are `SC38_OFF` and `SC38_ON`. Standalone/unhosted Max output is a separate context from Live-hosted parameter behavior.

Both `pattr` objects are **unbound**, internal type `float32`; only the right object has Parameter Mode enabled (Float range 0–10, Stored Only). `zl len` and a message readback avoid hiding extra atoms in a scalar number display.

### Test 2 — variable-length state persistence comparison

1. Open the Primitive Set and select **Blob test**. `02-blob-persistence.amxd` contains two unbound, parameter-enabled Stored Only Blob `pattr` objects, initialized to `baseline`.
2. Click normal **beta** in lane A and **assign alpha** in lane B. Click each `bang`. Observed readbacks: `beta` and `assign alpha`.
3. Save a **copy** of the Live Set with File → Save Live Set As. Switch to another empty Set, then reopen the saved copy and click both `bang` buttons.
4. Observed: A remains `beta`; B returns to `baseline`. The ALS Blob values also show this difference. Do not infer persistence from runtime output alone.
5. `assign beta peer_A peer_B` is provided only as an optional longer-message probe; its save/Undo behavior has **not** been tested in this package.

The supplied Primitive Set already contains the saved beta/baseline comparison and numeric ON value 2. Changing a value to the same stored value may add no Undo row; use a fresh inserted device or switch between alpha and beta when measuring normal writes.

## 6. Technical Questions

1. Is Test 1's numeric result expected in Max 9.1.5? What does `pattr assign` store, and is its documented float behavior intended to update the saved Live value or only runtime state?
2. Is there a supported way to align a peer source's **saved value and next Undo before-value** with its assigned runtime value, without adding peer Undo entries? In Test 3, is restoring another Stored Only source on Smooth Undo expected? Is there a supported callback contract for detecting Undo/Redo direction and completion across instances?
3. Is any `assign` form supported for lossless variable-length symbol/list/Blob data? If not, what supported mechanism persists automatic ID/peer updates while preserving normal Undo/Redo for explicit edits?
4. Can parameter-enabled [pattrstorage](https://docs.cycling74.com/reference/pattrstorage/) persist such updates in the ALS without adding Undo? Which exact message/attributes provide that contract? **No pattrstorage runtime result is claimed here.**
5. Is there a supported transaction mechanism to group writes across instances into one user edit, or initialization writes into the original Insert Device operation? We found no per-notification transaction identifier in the published [Song API](https://docs.cycling74.com/apiref/lom/song/); `can_undo` / `can_redo` alone do not identify a callback's cause.

The [live.menu assign documentation](https://docs.cycling74.com/reference/live.menu/#assign) explicitly describes non-persistence. We are asking for supported semantics or an alternative, not reporting that aspect as a documentation violation. The [parameter visibility documentation](https://docs.cycling74.com/reference/pattr/) offers saved Visible numeric parameters without Undo; that does not establish a variable-length Blob solution. A permanent manager instance, fixed peer limit, or manual-only synchronization would not meet the product requirements.

Public sharing status is recorded in [SHARING.md](SHARING.md). The previous issue link requires repository access; this README is self-contained and does not require opening that issue.
