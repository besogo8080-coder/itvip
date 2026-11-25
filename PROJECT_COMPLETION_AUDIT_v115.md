# IT VIP — Project Completion Audit (v115)

Date: 2026-11-25  
Baseline: `IT_VIP_v0.83.30-dev_COMPLETE_v114.zip`  
Candidate: `IT_VIP_v0.83.31-dev_COMPLETE_v115.zip`

## v115 implementation

The central license authority's HTTP mutation boundary and SQLite write sequencing were hardened:

- Mutation bodies must have explicit decimal `Content-Length`, be 2–8192 bytes, use `application/json`, and contain exactly the declared number of bytes.
- `Transfer-Encoding` bodies are rejected.
- UTF-8 decoding is strict.
- Duplicate JSON object properties are rejected, avoiding ambiguous values for security-sensitive fields such as `EditionId`.
- Non-standard JSON constants (`NaN`, `Infinity`, `-Infinity`) are rejected.
- Revoke and restore acquire SQLite `BEGIN IMMEDIATE` before changing revocations, allocating the monotonic revision, and appending the audit-chain event.
- Tests cover malformed/ambiguous requests and 24 concurrent independent writer transactions; the final revision sequence and audit chain are checked.

## Validation

See `release_validation_v115.txt` for exact checks and results. All 403 regular files from v114 are retained; three new documentation/release files were added. ZIP CRC and SHA-256 are verified.

## Remaining release gates

1. Execute MSVC x86/x64 and MinGW x64 builds in Windows CI and resolve actual compiler/linker diagnostics.
2. Run PowerShell 5.1 and PowerShell 7 signing/verifying fixtures on Windows.
3. Exercise RSA-3072, DPAPI, CNG native verification, anti-rollback state, and Authenticode with real Windows APIs and certificates.
4. Complete operator identity, MFA, rate limiting, certificate lifecycle, network policy, database backup/restore drills, and independent audit export before any remote production authority deployment.
5. Test Windows 10/11 GUI, RTL, DPI, audio, notifications, and all specialist tools.
6. Qualify Backup/Restore and USB behavior on NTFS/exFAT/FAT32 with low-space, disconnect, cancellation, large-file, and permission-failure cases.
7. Add native Windows restore crash/fault injection; the Python protocol model is not proof of crash consistency.
8. Boot Manager remains read-only preflight/inventory. Bootable media, ISO chainloading, UEFI/BIOS integration, and Secure Boot chain are not implemented.

## Security limitations

- The license authority does not sign licenses; the owner RSA private key remains offline.
- The audit chain uses unkeyed SHA-256 and is tamper-evident, not tamper-proof.
- `X-ITVIP-Actor` is an operator-supplied label, not verified identity.
- Local DPAPI anti-rollback is not an absolute boundary against local administrators, profile replacement, or state deletion.
- The new strict parsing and writer serialization have host-side tests only; no real TLS handshake or remote deployment was exercised.

**Status: cumulative development source package v115. Not a production licensing service, Windows-qualified build, or final release.**
