# Public sharing and download verification

Public repository: [SpectrumCompare-Issue38-Repro](https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro).

Complete package: [download the ZIP](https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/releases/download/repro-20261107/SpectrumCompare-Issue38-Repro.zip). Its final download verification and SHA-256 are recorded in the [release notes](https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/releases/tag/repro-20261107).

## Anonymous checks — 2026-11-07

The initial public snapshot `0088d97367fde50e14f85717d19c383755b54dc7` was checked using HTTP requests without an Authorization header, cookies, or account credentials:

- Repository and README, RESULTS, REPLY, main maxpat, AMXD, and ALS file pages: HTTP 200.
- Every one of the 31 raw repository files: HTTP 200, byte-for-byte identical to the reviewed local files.
- [GitHub archive of that snapshot](https://github.com/kazunoriri/SpectrumCompare-Issue38-Repro/archive/0088d97367fde50e14f85717d19c383755b54dc7.zip): HTTP 200; ZIP integrity check passed.

The initial snapshot already contains the cleaned ALS copies. This document adds the measured access results; the release provides the final package. MANIFEST.json lists the packaged file hashes, and the release notes record the final anonymous ZIP-download check.

## Publication scope

Only this independent reproduction package was published, using a new Git history. The private product repository, its existing history, Issues, PRs, original ALS files, and uncommitted changes were not modified or uploaded. The old issue links in RESEARCH.md are private historical references; the public README and included patches are self-contained and do not require access to them.

Both public ALS files were cleaned through Live's Groove Pool UI and reverified in Live, including relocation. No grooves, MIDI note events, audio/MIDI clips, sample assets, or third-party externals are included. Preparation backups and raw machine/crash logs are excluded. The diagnostic source/AMXD files remain byte-identical to the reviewed originals. See RESULTS.md and evidence/publication-checks.json for scope and remaining unknowns.

REPLY.md contains the completed English reply and Japanese translation with the formal public links. **No email has been sent.**
