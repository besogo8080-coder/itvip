> Current cumulative development source: **v0.83.34-dev (Complete Source Package v118)**. This cumulative package hardens the central license-authority HTTP boundary with strict UTF-8/JSON parsing, duplicate-key and non-standard constant rejection, explicit request framing, and serialized SQLite writer transactions, a complete authenticated audit-export endpoint with chain verification, server-controlled audit actor attribution that ignores caller-supplied identity headers, and hardened owner-side RSA-3072 user-edition signing with inventory path and key-pair checks. See `docs/CENTRAL_LICENSE_AUTHORITY.md`, `docs/BUILD_STATUS.txt`, and `docs/PROJECT_COMPLETION_AUDIT_v115.md`.

# IT VIP — ULTIMATE WINDOWS TOOLKIT

Developer: Mahmoud Basyouni Abdallah

Cumulative Windows 10/11 C++17 source project. Arabic documentation: `README_AR.md`.

Included native modules: scanner, USB Guard, Temp Cleaner, Activation Status/Manager, and local Password Reset helper.

Build on Windows using a Visual Studio 2022 Developer Command Prompt: `build.bat msvc`. The selected developer prompt determines x86 or x64 output. MinGW is also supported through `build.bat mingw`.

The project includes a Win32 dashboard and multiple native modules. This source package has not been compiled or runtime-tested on Windows in this environment. The independent IT VIP Boot Manager/bootloader remains unimplemented; no USB is formatted or modified by this package.


## UI Customization Center (v0.4.0-dev)
The dashboard now supports four themes, an optional lightweight animated accent background, and show/hide controls for existing tool buttons. Preferences are stored in `config/appearance.ini`. Arbitrary image/video backgrounds, drag-and-drop layout editing, and custom user-defined buttons are not implemented yet.

### Portable App Card Studio
Portable Apps Manager supports per-app display-name editing and a built-in symbol catalog, plus recording a custom `.ico` path. Editing never renames or modifies the target executable; removing an entry only removes its list record. Direct rendering of custom ICO assets in the list is a follow-up UI task.


## v0.7.0-dev — App Card rendering update
The Portable Apps Manager now displays imported ICO files directly in each application row, with the selected preset glyph as a fallback. This is source-level work and still needs a Windows build/runtime test.

## v0.8.0-dev — App Card customization
- Per-card background palette (five presets).
- Persistent move-up/move-down ordering controls.
- Backward-compatible reading of the previous four-column TSV database.
- Fixed dashboard package-root resolution when the GUI executable lives in `build`.
- Windows compilation/runtime testing has not been performed in this environment.


## v0.9.0-dev
Portable Apps Manager adds mouse drag-and-drop card reordering. Keyboard move controls remain available. The native Windows GUI still requires Windows build and runtime validation.

## v0.10.0-dev — App card sizing
- Added Compact, Standard, and Large per-app card sizes.
- Variable-height owner-drawn list rows and scaled icons.
- Backward-compatible TSV loading: older records default to Standard.
- Windows build/runtime testing is still required.


### v0.11.0-dev update
Added a **Relink EXE** action to Portable Apps Manager. It lets users browse to a moved application after relocation or a USB drive-letter change, saves the updated path without launching the app, and preserves card metadata. Windows build/runtime testing is still pending.

## v0.13.0-dev — Custom image background

The Customization Center now supports selecting and clearing a PNG/JPG/JPEG/BMP background image. The image is copied into `assets/backgrounds`, and a relative path is saved in `config/appearance.ini` for portability. GDI+ renders the image with a dark overlay for text contrast. This is a static image feature, not video playback; Windows build/runtime testing remains required.

### 0.14.0-dev update
Added a live 0–255 background dimming slider with percentage feedback. The value is saved in `config/appearance.ini` and controls the overlay drawn above the image; it does not modify the source image. Windows compilation/runtime testing is still pending.

### v0.16.0-dev — Preset Wallpaper Gallery
The Customization Center now includes four bundled static PNG wallpapers (Violet Nebula, Cyan Circuit, Gold Chrome, Matrix Grid). A preset applies only to the currently selected theme and is stored as a relative project asset path. Custom image selection and per-theme clearing remain available. Windows build/runtime validation has not been performed.


## v0.17.0-dev — Visual wallpaper gallery
- Replaced text-only preset buttons with owner-drawn gallery tiles containing actual PNG thumbnails and labels.
- Thumbnails are loaded from bundled assets/backgrounds/presets and scaled with GDI+.
- Each preset has a theme-colored outline and pressed-state feedback.
- Preset selection still applies only to the currently selected theme.
- Source-level update only; Windows build/runtime testing remains outstanding.


## Imported wallpaper library — v0.18.0-dev
- Import multiple PNG/JPG/JPEG/BMP files in one selection.
- Copies are stored under `assets/backgrounds/imported` for portable use.
- An imported-image list and large preview are provided.
- Apply the selected image to the current theme, or remove the imported copy from the library.
- Removing an item deletes only the project's imported copy, not the original source file.
- Multi-select file dialog and preview behavior still require Windows testing.


## v0.20.0-dev — VIP Studio accent color
- Added the native Windows color picker for a custom dashboard accent.
- Added a reset action to restore the selected theme's default accent.
- The custom accent currently applies to the IT VIP title and Core Tools heading.
- The value and enabled state are persisted in `config/appearance.ini`; closing without saving restores the saved value.
- This does not recolor every native button or every module.
- Windows compilation and runtime testing have not been performed in this environment.


## VIP Studio update — v0.21.0-dev
- Added a dashboard font-size slider (14–26).
- Live preview updates the main dashboard child controls and title sizing.
- FontSize is persisted in `config/appearance.ini`.
- Closing/canceling the customizer restores the saved font size.
- This setting currently applies to the main dashboard, not the standalone module windows.

## IT VIP AI Assistant — OpenAI Platform integration
- Launch the AI Assistant from the main dashboard.
- Enter an OpenAI API key and a model available to your API project (default: `gpt-5.5`).
- Type a question or paste a text report, then explicitly press Send. No API request is made before that action.
- The key is stored in Windows Credential Manager, not in project files or logs; the key field is masked.
- Requests use HTTPS and the Responses API with `store:false`. API usage may incur charges and is subject to account limits.
- Do not paste passwords, secrets, or sensitive personal data. System reports are not uploaded automatically; the user selects the text to send.
- `build.bat` builds `build\\ai_assistant.exe`.

## v0.23.0-dev — GitHub Hub
A separate read-only GitHub REST integration is included. It stores a user-provided token in Windows Credential Manager, verifies the account, and lists up to 50 recently updated repositories. It does not write to repositories, trigger Actions, or send repository contents to an AI provider. Windows build and live API validation remain pending.


## Universal API Manager (v0.24.0-dev)
A native Windows REST client for HTTPS endpoints. Current scope: GET/POST, JSON request bodies, configurable authentication header/prefix, HTTP status and response viewer, profile settings in `config/api_manager.ini`, and API secret in Windows Credential Manager. POST requires explicit confirmation. This is a generic REST adapter, not automatic compatibility with every API: OAuth2, signed requests, GraphQL/WebSocket, provider SDKs, OpenAPI import, and multiple profiles are not implemented yet.

### v0.25.0-dev — Multiple API connection profiles
Universal API Manager now supports multiple named REST connection profiles. Each profile stores its endpoint, method, and auth-header settings independently, while its secret is stored under a distinct Windows Credential Manager target. Current transport remains HTTPS GET/POST; OAuth2, OpenAPI import, GraphQL, WebSocket, and agent execution are not implemented. Windows build/runtime and live API behavior remain untested.

### v0.26.0-dev — Expanded REST methods
Universal API Manager now offers HTTPS GET, POST, PUT, PATCH, and DELETE. All potentially mutating methods (POST/PUT/PATCH/DELETE) require explicit confirmation. POST/PUT/PATCH accept a JSON body; GET never sends the body editor contents. Per-profile auth settings and Credential Manager secrets remain in place. This does not add OAuth2, OpenAPI import, GraphQL, WebSocket, or agent runtime. Windows compilation/runtime and live endpoint tests remain outstanding.

## Agent Studio Foundation (v0.27.0-dev)

Adds a standalone Agent Studio profile manager. Profiles store a name, description, provider label, API profile reference, tool allowlist policy, max steps, timeout, enabled state, and approval requirement in `config/agents.ini`. API secrets are not copied into agent profiles.

This is profile management only: no agent runtime, provider calls, tool execution, or workflow orchestration is implemented. See `docs/AGENT_STUDIO.md`.

## v0.28.0-dev — Universal AI Provider Hub
Adds a standalone provider catalog for provider name, protocol label, HTTPS base URL, default model, API profile reference, and enabled state. Secrets remain in Universal API Manager; this catalog does not yet send prompts or execute agents. See `docs/PROVIDER_HUB.md`.

## v0.29.0-dev — Universal AI Provider Runtime
Adds `provider_runtime.exe`, a basic chat client for enabled provider profiles exposing an OpenAI-compatible Chat Completions endpoint. It reads the selected API profile's secret from Windows Credential Manager and uses its configured auth header/prefix. HTTPS is required. This is not yet an Agent runtime: no streaming, persistent conversation history, tool calling, or workflow execution. Provider-specific protocols and nonstandard schemas require adapters. Windows build and live API tests remain outstanding.

## v0.30.0-dev — Multi-Agent Team Studio
Adds a Team Studio configuration editor for teams built from enabled Agent Studio profiles. Configure a coordinator, 1–16 member IDs, sequential/round-robin dispatch metadata, and an approval-required flag. Definitions are stored in `config/teams.ini`.

**Scope note:** this release manages team definitions only; it does not execute agents or provide orchestration. Windows build/runtime testing has not been performed in this environment.

## Project Validation (v0.31.0-dev)

Run `py tools\\validate_project.py` to perform static source/build/launcher/documentation checks. Add `--report` to save a timestamped report under `reports/`. This does not compile or run Windows binaries; see `docs/PROJECT_VALIDATION.md`.


## Multi-Agent Execution Engine (v0.32.0-dev)

The new `team_runner.exe` dispatches one approved task sequentially to each member of a saved team, using that agent's provider and API profile. Responses are displayed and saved under `reports/`. This is analysis-only: no local shell, file edits, or arbitrary tool execution. It currently supports HTTPS OpenAI Chat Completions-compatible endpoints only. See `docs/TEAM_RUNNER.md`.

## v0.33.0-dev — Coordinator-led multi-agent collaboration

The Team Runner now uses a three-stage collaboration flow: coordinator planning, specialist reviews (each receives the original task and plan), and coordinator synthesis. The coordinator must be included in the team. Duplicate member IDs are ignored and the UI limits task input to 8,000 characters.

This remains text-only: no local tools, shell execution, file modifications, or automatic code changes. Plans and model responses are untrusted text. A run can make multiple billable API calls. Dispatch is sequential; Round Robin remains metadata only. Provider support remains limited to HTTPS OpenAI Chat Completions-compatible endpoints. A Windows build, live provider test, and GUI runtime test have not yet been performed. See `docs/TEAM_RUNNER.md`.


## Workflow Studio (v0.34.0-dev)

The Workflow Studio foundation lets you create ordered workflow definitions using enabled Agent IDs, configure sequential/round-robin metadata, approval policy, and stop-on-failure policy. Definitions are stored in `config/workflows.ini`. This release is a configuration editor only; workflow execution, conditional branches, agent-to-agent output passing, and retries are not implemented. See `docs/WORKFLOW_STUDIO.md`.


## v0.35.0-dev — Workflow Execution Engine

Added `workflow_runner.exe` to execute saved workflow definitions sequentially. Each enabled Agent receives the original task and, after the first step, the previous successful Agent response as context. The runner validates Agent IDs, enforces configured approval, honors `StopOnFailure`, and writes timestamped reports under `reports/`. The dashboard now exposes **Run Workflow**.

This is text-only orchestration: no local tools, shell commands, file edits, branching, retries, cancellation, or live progress streaming. Each step sends task/context to an external provider and may incur API charges. Provider compatibility remains limited to OpenAI Chat Completions-compatible endpoints. Windows build and live API tests have not been performed in this environment. See `docs/WORKFLOW_RUNNER.md`.


## Execution History

The new `run_history.exe` module lists approved local report prefixes (`workflow_run_`, `team_run_`, `project_validation_`), previews reports, exports copies, and deletes only after confirmation. Reports may contain sensitive prompts or responses. This is a report browser, not yet a persistent per-Agent chat-memory database. Windows build/runtime has not been verified here.

## v0.37.0-dev — Agent Memory Vault
Added `memory_center.exe`, a user-managed local memory vault. Users can create records scoped by Agent ID and project/context tag, browse them, export a selected record, and delete it after confirmation. Records are stored in the versioned `data/memory/memory.v1` format using UTF-8 hex fields so embedded tabs and newlines do not corrupt record boundaries.

**Privacy and limits:** the module makes no provider requests and does not automatically capture chats. It is not yet integrated with Provider Runtime, Team Runner, or Workflow Runner. The store is not encrypted; do not save passwords, API keys, recovery codes, or other secrets. See `docs/AGENT_MEMORY.md`. Windows compilation and runtime have not been verified in this environment.


## Chat Session History — v0.38.0-dev
Provider Runtime now persists successful prompt/response turns locally in `data/sessions/chat.v1`. Session Center supports filtering, preview, export, and confirmed deletion. The store is unencrypted and is never automatically sent to providers or reused as prompt context. Windows build and live provider testing have not been run in this environment.

## Latest cumulative update — v0.38.0-dev (Source Package v39)

Added the integrated Backup & Restore Center (`backup_center.exe`). It backs up `config`, `data`, `assets`, `portable`, and `reports` to a timestamped folder with a versioned manifest. Restore requires a valid manifest and explicit confirmation. Windows Credential Manager secrets are intentionally excluded. See `docs/BACKUP_RESTORE.md` for limits and safety notes.

This release is a cumulative source package. Static integration checks and ZIP integrity are performed before delivery; a Windows build/runtime test must be reported separately and is not implied by static checks.


## Backup & Restore Center
`backup_center.exe` creates timestamped backups in a user-selected location outside the application folder. It includes `config`, `data`, `assets`, `portable`, and `reports`; it excludes source/build folders and Windows Credential Manager secrets. Restore validates the versioned manifest, approved relative paths, file sizes, and SHA-256 before asking for confirmation. Restore is not transactional: create a fresh backup first. Backup data is not encrypted and may include reports, settings, memory, and chat text. See `docs/BACKUP_CENTER.md`.

## Latest cumulative update — v0.38.0-dev (Source Package v39)

Added the integrated Backup & Integrity Center (`backup_center.exe`). It creates timestamped backups of `src`, `docs`, `config`, `data`, `assets`, `portable`, and `reports`, and records each file's relative path, size, and SHA-256 digest in a versioned manifest. The Center can verify a backup against that manifest. It does not restore backups yet. Windows Credential Manager secrets are excluded. See `docs/BACKUP_RESTORE.md` for the exact scope and limitations.

This is a cumulative source package. Static integration checks and ZIP integrity are performed before delivery; Windows compilation and runtime tests are reported separately.


## Universal Settings & Control Center — v0.40.0-dev

Added a centralized local settings utility to validate project folders, create standard missing folders, export selected configuration files, open key data folders, and restore dashboard appearance defaults only after a timestamped backup and explicit confirmation. Credential Manager secrets are not read or exported. This settings export is not a substitute for Backup & Restore. See `docs/SETTINGS_CENTER.md`.


## Deployment Manager (v0.41.0-dev)

The `deployment/Deploy-ITVIP.ps1` script provides a Windows preflight, complete portable-folder packaging, and SHA-256 package verification. It requires a successful full build first and refuses to package if any required EXE is missing. See `docs/DEPLOYMENT_MANAGER.md`. This is not an MSI/MSIX installer.


## Manual Local Update Manager — v0.42.0-dev
Added `deployment/Update-ITVIP.ps1`, `Update-ITVIP.cmd`, and a dashboard entry. The updater consumes a local package containing `ITVIP_UPDATE.json`, validates its approved relative paths, file sizes, and SHA-256 hashes, then stages it before applying. Apply requires ITVIP.exe to be closed and the user to type `APPLY`; rollback files are stored under `data/update-backups`. `RollbackLatest` requires the user to type `ROLLBACK`.

**Security limits:** there is no automatic download or update-server connection. SHA-256 detects corruption but does not authenticate the publisher; obtain the package/manifest from a trusted channel and independently verify the manifest digest. Multi-file replacement is not globally atomic, so retain an external backup. PowerShell execution, Windows build, and runtime behavior have not been tested in this environment. See `docs/UPDATE_MANAGER.md`.

## Security & Diagnostics Center
The dashboard includes a read-only diagnostics launcher (`deployment/Diagnostics-ITVIP.cmd`). It checks project structure, source/build-output presence, Windows details, available Defender/Firewall/Secure Boot/UAC status, and writes timestamped TXT/JSON reports under `reports/`. It does not repair or change system settings. See `docs/SECURITY_DIAGNOSTICS.md` for limitations.

## Driver & Hardware Manager (v0.44.0-dev)
A read-only Windows inventory launched from the dashboard. It reports Plug and Play device status/problem codes, CPU, display, disks, physical network adapters, and optional signed-driver metadata. Timestamped JSON/TXT/CSV reports are written to `reports/`. It does not install, update, remove, or disable drivers. See `docs/HARDWARE_MANAGER.md`.

## Network Manager — v0.45.0-dev
A read-only network inventory and diagnostics utility is available from the dashboard. It reports adapters, IP/DNS configuration, gateway information, interface counters, local TCP listeners, ICMP reachability, and DNS resolution. It writes timestamped JSON/TXT/CSV reports. It does not change network settings or scan remote hosts. See `docs/NETWORK_MANAGER.md`.

## Process & Performance Manager (v0.46.0-dev)
Launch `deployment/Performance-ITVIP.cmd` to inspect CPU/OS memory, top processes,
running services, and fixed-disk usage. Reports are written to `reports/`.
An optional process-stop action requires a PID and exact typed confirmation; stopping
processes can lose unsaved work. Prefer closing applications normally. See
`docs/PERFORMANCE_MANAGER.md` for limitations.

## Startup & Services Manager — v0.47.0-dev
Added a read-only inventory of Windows startup command entries and service state/start mode. JSON, TXT and CSV reports are written to `reports/`. This release does not modify startup entries, services, scheduled tasks or registry values. A listed startup entry is not proof that it executed successfully. See `docs/STARTUP_SERVICES_MANAGER.md`.

## Windows Optimization Center — v0.48.0-dev
Added a read-only Windows assessment launched from the dashboard. It inventories fixed-drive capacity, estimates selected temporary-folder contents with a per-location scan cap, and lists registered startup entries. It writes timestamped JSON/TXT reports and a storage CSV. It does not delete files or change Windows settings; startup impact is not benchmarked. See `docs/WINDOWS_OPTIMIZATION_CENTER.md`.

## v0.49.0-dev — Windows Repair Center
Read-only Windows health assessment: OS, Windows Update service and disk inventory, plus optional SFC verify-only, DISM ScanHealth and CHKDSK online scan. No repair or settings changes are automated. See `docs/WINDOWS_REPAIR_CENTER.md`.


## Firewall & Privacy Center — v0.50.0-dev
The read-only `deployment/FirewallPrivacy-ITVIP.cmd` reviews Windows Firewall profiles and enabled-rule summaries, network profiles, selected UAC/SmartScreen/privacy policy registry values, and optionally up to 250 established TCP connections with process names where permitted. Timestamped JSON and TXT reports are written under `reports/`. It does not change firewall rules, registry values, privacy settings, or network configuration. Missing registry values are not interpreted as enabled or disabled. Reports may contain local/remote endpoints and process names; review before sharing. See `docs/FIREWALL_PRIVACY_CENTER.md`. Windows PowerShell runtime testing has not been performed in this packaging environment.


## v0.51.0-dev — Event Viewer & Log Analyzer
- Added bounded, read-only queries for System and Application Windows event logs.
- Supports severity, date-window, event-ID, and maximum-event filters.
- Exports timestamped JSON/TXT/CSV reports; event messages may contain private data.
- No log clearing, Security-log collection, or automated remediation.
- PowerShell runtime validation on Windows remains pending.

## v0.52.0-dev — Software & Installed Apps Manager
Added `deployment/Software-ITVIP.cmd` for read-only inventory of conventional Windows Uninstall registry entries across native, 32-bit and current-user scopes. Supports scope selection, name filtering, bounded results, and timestamped JSON/TXT/CSV reports. Displays version, publisher, install-date metadata and publisher-supplied estimated size where available.

The module does not retrieve or execute uninstall commands, install/update/remove software, or modify the registry. Store/MSIX and portable apps may be absent; estimated sizes are not verified disk usage. See `docs/SOFTWARE_INSTALLED_APPS_MANAGER.md`. Portable packaging now includes the `deployment` folder so dashboard launchers remain available.

## Windows Update Manager — v0.53.0-dev
Added a consent-gated, read-only Windows Update Agent inventory for available software updates, recent update history, and Windows Update service status. The search may contact the configured Microsoft Update or organizational WSUS source. Timestamped JSON/TXT/CSV reports are written under `reports/`. It never downloads, installs, hides, schedules, or changes updates or Windows settings. See `docs/WINDOWS_UPDATE_MANAGER.md`. Live WUA COM behavior on Windows remains untested in this packaging environment.


## Owner Permissions Console & User Editions — v0.54.0-dev

The new **User Permissions Console** creates named per-recipient capability profiles and exports separate runtime folders. The owner selects allowed tools; the exporter includes only granted module EXEs and their deployment launchers. The dashboard hides disabled entries and blocks their commands. See `docs/USER_PERMISSIONS_EDITION_BUILDER.md`.

**Security limitation:** This is application-level gating and package minimization, not tamper-proof access control. Profiles are unsigned INI files; a local administrator or someone able to modify the package can bypass the restrictions. For real isolation on a shared PC, use separate standard Windows accounts and NTFS ACLs, and keep the owner build private. Authenticode and signed-policy verification remain future hardening work.


## v0.55.0-dev — User Profile Lifecycle
- Added a profile manager window to list, load, revoke, and delete named user profiles.
- Added a New Profile action so multiple recipients can be configured in one owner-console session.
- Profiles now track Active/Revoked status, revision number, and UTC update time.
- Revocation clears all 36 grants and blocks future exports from that profile.
- Added a local CSV audit trail for save, revoke, delete, and export-request events.
- Export manifests record the profile revision; previously exported editions are not remotely revoked.
- See `docs/USER_PROFILE_LIFECYCLE.md` and `docs/USER_PERMISSIONS_EDITION_BUILDER.md`.

## License & Security Authority (v0.56 foundation)
Owner-side RSA-3072 key generation, DPAPI-protected private-key storage, detached manifest/inventory signing, and explicit signature/hash/expiry verification scripts are provided. Runtime enforcement, hardware/account binding, Authenticode, and remote revocation are not implemented. See `docs/ITVIP_LICENSE_SECURITY_AUTHORITY.md`.


## v0.57.0-dev — Signed edition launch gate
Exported user editions now include a verifier and a launcher that validates the detached RSA signature, manifest, expiry, inventory, and file hashes before starting the dashboard. The public key is included before inventory signing; duplicate paths and unlisted files are rejected. This is launcher-level defense-in-depth, not native or administrator-resistant enforcement. Windows runtime validation remains pending. See `docs/ITVIP_LICENSE_SECURITY_AUTHORITY.md`.

---

## v0.58.0-dev — Package v59

- Optional Windows account SID binding for signed user editions via `-BindingMode WindowsSid -BindingSid <target-SID>` (`None` remains the default).
- Verifier hardening for unsupported binding modes, future issue timestamps, revoked manifest status, and reparse points.
- Added a read-only Boot Manager preflight inventory and JSON/TXT reports. It does not create bootable media or modify disks.
- Windows PowerShell 5.1 and native Windows build/runtime qualification remain outstanding.


## v0.59.0-dev — Package v60
Added an authority-signed offline revocation snapshot per user edition. The owner may pass a JSON file containing `RevokedEditionIds` when signing; the launcher verifier validates the snapshot signature and rejects a revoked EditionId. If omitted, an empty signed snapshot is generated. This is offline revocation, not remote revocation; existing copies require a newly signed/reissued package to receive updates. Windows/PowerShell runtime tests were not run here.

### Central License Authority (reference)
A loopback-first SQLite control-plane reference is available in `server/license_authority.py`. See `docs/CENTRAL_LICENSE_AUTHORITY.md` for setup, API, offline signing workflow, and deployment limits. The service never stores the RSA private signing key.


## v0.61.0-dev — Central Authority Revisioning
- Added monotonically increasing central revocation revision values and stored each state-changing revision in the audit log.
- Offline signing preserves the revision inside the owner-signed revocation snapshot; the verifier validates its non-negative integer format.
- Revision is an operational ordering marker, not anti-rollback protection. Older signed snapshots are not blocked by a trusted client-side high-water mark.
- Python unit tests cover revision increments and idempotency. Windows PowerShell/C++ runtime remains untested here.

## v0.62.0-dev — Package v63: local revocation anti-rollback
- The edition verifier persists the highest accepted signed revocation revision per `EditionId` under `%LOCALAPPDATA%\\ITVIP\\LicenseState`.
- State is protected using Windows DPAPI `CurrentUser` scope and updated through a temporary file replacement.
- Lower revisions are rejected, equal revisions are accepted, and higher revisions advance the local high-water mark. Unreadable existing state fails closed.
- This is limited local protection: administrators, state deletion, profile rollback, and offline freshness gaps remain outside its guarantees.
- Static validation: 327 PASS / 0 FAIL; Python unit tests: 4 PASS. PowerShell/DPAPI and native Windows builds were not run in this environment.

## v0.63.0-dev — Central Authority Access Hardening
- Separate read-only and admin bearer credentials; mutations require the admin token.
- Optional bounded operator audit label (not verified identity).
- Optional direct TLS listener; non-loopback binding requires certificate and key, TLS 1.2 minimum.
- SQLite WAL/FULL synchronous mode and HTTP authorization tests.
- Production identity/MFA, rate limiting, monitoring, HA, and tested backups remain outstanding.


## v0.64.0-dev — Tamper-evident license audit (Package v65)
- Central authority audit events now form a canonical SHA-256 hash chain with `prev_hash` and `audit_hash`.
- Authenticated `GET /v1/audit/verify` checks chain continuity and event digests.
- Legacy rows are backfilled during migration; existing non-empty hashes are preserved.
- SQLite connections now close deterministically after commit/rollback.
- Python tests cover chain validation, tamper detection, legacy migration, and HTTP verification.

**Security boundary:** this is tamper-evident, not tamper-proof. A database administrator who can rewrite the entire database can recompute an unkeyed SHA-256 chain. Signed external checkpoints or WORM/independent log forwarding are needed for stronger evidence. Windows native builds, PowerShell/DPAPI runtime, real TLS certificate deployment, Authenticode, Boot Manager, and Windows qualification remain incomplete.


## v0.65.0-dev — Native license launch orchestrator
Added a C++ Win32 `ITVIPBootstrap.exe` source and MSVC/MinGW build targets. User-edition export requires and packages it; `Start-ITVIP.cmd` delegates to the native launcher, which waits for the existing verifier before starting the dashboard.

**Security boundary:** the native program orchestrates launch only. RSA, file-hash, revocation and DPAPI checks remain in PowerShell. The bootstrapper is not Authenticode-signed and Windows runtime qualification has not been performed here. See `docs/NATIVE_LICENSE_BOOTSTRAPPER.md`.


## v0.66.0-dev — Native CNG License Verification
- Added `ITVIPNativeVerify.exe` source using Windows CNG to verify RSA-3072/SHA-256 edition and revocation signatures.
- Native verifier recalculates signed inventory hashes before the PowerShell policy checks.
- Bootstrapper blocks dashboard startup if native verification fails.
- Exported user editions now require and include the native verifier.
- Source/static validation only; Windows compilation and CNG runtime qualification remain pending.


## v0.67.0-dev — Native license policy enforcement
- The CNG verifier now enforces signed issue/expiry timestamps, optional Windows SID binding, revoked profile status, and monotonic revocation revisions.
- The native verifier protects the per-EditionId high-water mark with DPAPI CurrentUser and commits state atomically; inability to validate protected state fails closed.
- PowerShell remains a second independent layer for full-tree reparse-point and unlisted-file checks.
- Native C++/CNG/DPAPI/SID runtime tests have NOT been run on Windows in this environment.

## v0.68.0-dev — Native edition-tree hardening
- The CNG verifier rejects reparse points and junctions in inventory paths and throughout the edition tree.
- It now rejects unlisted files and duplicate paths using Windows case-insensitive semantics.
- It validates the revocation schema before updating DPAPI anti-rollback state.
- Static validation: 360 PASS / 0 FAIL; Python authority tests: 10 PASS; ZIP integrity: PASS.
- Native Windows compilation/runtime, PowerShell 5.1, Authenticode, and Windows 10/11 x86/x64 qualification remain NOT RUN.

## v0.69.0-dev — Native JSON syntax gate and revocation ordering
- Added bounded strict JSON syntax validation for signed manifest, inventory, and revocation documents.
- Rejects duplicate keys, malformed escapes/numbers, trailing bytes, oversized documents/strings, and excessive nesting.
- Checks the current EditionId revocation decision before mutating DPAPI anti-rollback state.
- Limitation: semantic extraction/inventory iteration still use regex accessors after syntax validation; a vetted typed parser and fuzzing remain required.
- Native Windows build/runtime and CNG/DPAPI/SID qualification remain NOT RUN.


## v0.71.0-dev — Native JSON fuzzing and parser robustness
- Added a libFuzzer-compatible parser target and a reproducible seed corpus for edition manifests, revocation snapshots, and inventories.
- Added a deterministic 50,000-mutation smoke harness compiled with AddressSanitizer and UndefinedBehaviorSanitizer.
- Recorded a bounded Clang libFuzzer campaign of 20,000 executions with ASan/UBSan and no crash or sanitizer finding.
- See `docs/NATIVE_JSON_FUZZING.md` for commands, run scope, and limitations.
- These Linux parser tests do not replace Windows MSVC/CNG/DPAPI/SID/PowerShell integration or full verifier testing.

### v0.72.0-dev — Native license schema hardening
The native signed-edition verifier now enforces an exact revocation snapshot schema, strict full-string UTC timestamps, unique bounded revocation IDs, and inventory ceilings (100,000 entries, 512 MiB per file, 4 GiB aggregate). These Windows-specific verifier changes have not yet been compiled or run on Windows; see `docs/NATIVE_LICENSE_SCHEMA_HARDENING.md`.

## Automated build and test workflow

The repository includes `.github/workflows/windows-build.yml`. After pushing to GitHub,
Actions builds the native suite with Visual Studio 2022 for x64 and x86 and runs portable
JSON, sanitizer smoke, license-authority, and Python syntax tests on Ubuntu. Workflow
configuration is not evidence of a successful hosted build; check the Actions run and
its uploaded artifacts before treating Windows binaries as qualified.

## v0.74.0-dev — Windows build output qualification
- Remove stale EXEs before each build so partial failures cannot leave apparently current binaries.
- Add `tools/verify_windows_build.ps1` to require the complete executable set and verify PE architecture (x86/x64).
- Extend GitHub Actions to run output qualification and compile/execute strict JSON tests with MSVC in both architectures.
- Hosted Windows CI has not yet run from this environment; no MSVC, CNG, DPAPI, SID, or Windows runtime pass is claimed.

## v0.75.0-dev — Bounded native verifier file I/O
- The native verifier checks file sizes before allocating buffers.
- Independent limits: manifest 4 MiB, signed inventory 64 MiB, revocation snapshot 16 MiB,
  DPAPI anti-rollback state 64 KiB, and 512 MiB per inventory payload file.
- Exact-length reads are required; short reads or files changed during reading fail closed.
- Linux parser/fuzz/authority tests were run. Windows MSVC, CNG, DPAPI, SID, PowerShell,
  and signed-edition end-to-end runtime tests were not run in this environment.

## Large portable-app folder import (v0.76)
The Portable Apps Manager adds a full-folder import action that copies a selected application directory to `portable/apps/<app-name>`, preserving its directory tree. It uses Windows `CopyFileExW` rather than loading whole files into memory, pre-scans total size, checks free space, asks for confirmation, skips symbolic links, and leaves the source untouched. A progress bar reports copy progress. If copying fails, a partial destination may remain and should be reviewed manually. After import, add the main EXE from the imported folder to the app list. The 512 MB license-inventory limit does not apply to this feature. Actual maximum file size depends on the USB filesystem and free space; FAT32 cannot store a single file larger than 4 GB, while exFAT/NTFS are generally suitable. Windows/physical-USB runtime testing is still required.


## v0.77.0-dev — Safer large portable-app imports
- Import now copies into a temporary staging directory on the same volume and renames it to the final app folder only after the full copy succeeds.
- On failure, the importer attempts to remove the staging tree; the original source is never modified.
- Removed `skip_permission_denied` so unreadable entries fail the import instead of being silently omitted.
- Verifies copied file count and aggregate bytes, and compares each copied file size with its source after `CopyFileExW`.
- Progress percentage uses a wide intermediate to avoid integer multiplication overflow for very large totals.
- Source-only change: Win32 build and physical USB runtime tests were not available here. Size checks are not a cryptographic SHA-256 content verification.


## Large portable application imports and copy integrity

Portable Apps Manager imports complete application folders into `portable/apps` using Windows file-copy APIs without loading whole files into memory. Each copied file is checked by size and incremental SHA-256 comparison using Windows CNG and a fixed 1 MiB buffer. The final application folder is published only after all checks pass. The source is not deleted or modified. See `docs/PORTABLE_APPS_MANAGER.md` for limitations, including FAT32's 4 GiB per-file limit and the need for Windows/physical-USB testing.

## Portable storage overview (v0.79)
The Portable Apps Manager now reports imported file count/total size, free space on the toolkit volume, and detected filesystem; it can open `portable/apps` in Explorer and warns about FAT32's 4 GiB single-file limit. See `docs/PORTABLE_APPS_MANAGER.md`. This is informational and synchronous; Windows/physical-USB validation remains outstanding.


## Imported portable-app folder management (v0.80)
The Portable Apps Manager now has source-level actions to rename or permanently delete an imported app folder under `portable/apps`. Rename uses the selected card's current display name, refuses collisions, and updates registered EXE/custom-icon paths under the folder. Delete requires explicit confirmation, removes the complete selected top-level app folder, and removes matching app-list entries while clearing custom-icon references into the deleted folder. Both actions reject external paths and symbolic-link roots; the existing remove-from-list action remains non-destructive. These Win32 changes still need MSVC and physical USB runtime validation. See `docs/PORTABLE_APPS_MANAGER.md`.


## Fast Copy between PC and USB (v0.81)

The package includes `copy_manager.exe`, launched from Portable Apps Manager. Choose any source folder and destination folder to copy in either direction: USB to PC or PC to USB. It pre-scans regular files, totals their sizes, checks destination free space, then copies on a background thread with progress and cancellation, preserving empty subfolders as well. It never deletes the source, refuses an existing destination folder, and does not follow symbolic links. On failure or cancellation it attempts to remove the partial destination tree.

This first version copies complete folders and their subfolders; it does not merge into an existing destination or resume interrupted transfers. It verifies copied file sizes but skips a second full SHA-256 read during normal copy to prioritize throughput; use Portable Apps import when per-file SHA-256 verification is required. Actual speed depends on the USB drive, port, destination disk, filesystem, thermal behavior, and file count/size distribution. FAT32 cannot store a single file larger than 4 GiB; use exFAT or NTFS. Windows build and physical USB testing remain required.

## Shared visual identity — v0.82.0-dev
A shared Win32 branding layer (`src/app/itvip_branding.hpp`) now applies the IT VIP crowned-V icon, dark navy surfaces, subtle circuit traces, violet/cyan accent rules, dark control colors, and a dark DWM title bar where supported. It is wired into the main dashboard and all existing standalone GUI modules, including Portable Apps Manager and Fast Copy. Icon assets live in `assets/itvip.ico` and `assets/branding/`; build scripts embed the icon into Windows executables. Scanner, USB Guard, Temp Cleaner, Activation Manager, Password Recovery, and Security Center remain console utilities rather than standalone GUI windows and are explicitly not claimed as GUI-converted. See `docs/ITVIP_VISUAL_IDENTITY.md`.


## Bilingual branded core-tool front ends
Branded GUI front ends are now provided in source for Scanner, USB Guard, Temp Cleaner, Activation Manager, Password Recovery, and Security Center. They read `Language=ar|en` from `config/appearance.ini`; Arabic is the first-run default. The dashboard persists language selection for subsequently opened standalone windows. Existing CLI engines remain separate and are invoked by the GUI, so engine output opens in a separate console window in this iteration. Windows compilation and RTL/localization runtime validation remain outstanding.


## v0.83.1-dev — branded tool front-end reliability

The six branded core-tool front-ends now render their localized module name in a dedicated heading control, retain a stable window caption, safely quote Windows process arguments for selected paths and account names, and reject engine paths that are not regular files. These are source-level improvements; Windows builds and runtime tests remain pending.


## v0.83.2-dev — embedded asynchronous tool console

The six branded core-tool front-ends now capture engine stdout/stderr inside the GUI using a background worker. A read-only output panel, Stop action, indeterminate activity indicator, and process exit-code status are included. Exact percentage progress is not displayed because the existing engines do not provide a structured progress protocol. Windows build/runtime qualification remains pending.

### VIP Studio responsive customization (v0.83.3-dev)
The Customization Center adapts to the available desktop height and provides vertical-scrollbar and mouse-wheel navigation so its complete control set remains reachable on shorter displays. Existing themes, wallpaper library, accent color, font size, card scale, and appearance-profile storage remain compatible. Windows runtime verification is still required.


### Boot Manager read-only preflight update (v0.83.4-dev)
The Boot Manager preflight report now uses schema `ITVIP-BOOT-PREFLIGHT-2`. In addition to firmware and disk basics, it records available disk model/manufacturer/serial/UniqueId, offline/read-only state, partition layout, and volume filesystem/capacity details. Partial query failures are surfaced as warnings. USB candidate hints remain informational only and require manual physical-device identity verification. This remains a read-only inventory—not a bootable USB creator—and has not yet been executed against Windows Storage cmdlets in this Linux environment.


### Boot Manager report privacy (v0.83.5-dev)
Use `deployment/BootManager-Preflight.cmd -RedactHardwareIdentifiers` before sharing a preflight report. This option redacts the computer name, disk serial number, and disk UniqueId in both JSON and TXT reports and records the redaction state. Model, capacity, bus type, and partition information remain visible. The preflight remains read-only and is not a bootable USB creator.


## System Diagnostics Center (v91)
Run `deployment/System-Diagnostics-ITVIP.cmd` for a read-only system snapshot and bounded CPU/memory sampling. Timestamped JSON, TXT, HTML, and CSV reports are saved under `reports/`. Network counters are cumulative; thermal data is optional and depends on ACPI provider availability. Configurable CPU/RAM/disk-free warning thresholds are included in JSON/TXT/HTML output, and a bounded 1,000-row local CSV history is maintained. See `docs/SYSTEM_DIAGNOSTICS_CENTER.md`. Windows runtime validation is pending.


### v0.83.8-dev / Package v92 — bounded live diagnostics

- Added optional `-LiveMonitoring` mode with a 1–60 minute duration bound and a hard maximum of 3,601 samples.
- Added approximate receive/send bytes-per-second estimates from deltas in cumulative physical-adapter counters; first sample is intentionally unavailable.
- Added live console status lines and included per-sample network rates in CSV/JSON/TXT/HTML diagnostics output.
- The existing short sampling mode remains the default; all collection remains read-only.
- PowerShell parsing/execution and Windows 10/11 adapter-counter behavior remain pending validation on Windows.


## Native Live System Monitor (v0.83.9-dev / Package v93)
The Dashboard now launches `system_monitor_gui.exe`, a native Win32 live monitor. It samples CPU load from `GetSystemTimes`, RAM from `GlobalMemoryStatusEx`, active non-loopback network adapter byte counters from `GetIfTable2`, and free/total capacity for the Windows system volume. The UI provides start, pause/resume, stop, a 1/5/10/30/60-minute session selector, and rolling CPU/RAM/network graphs. Samples are appended to `reports/system_monitor_live.csv`. Network graph scaling is relative to 1 MB/s; displayed rates are local adapter throughput, not internet speed. The first CPU/network sample establishes counter baselines. The monitor is read-only and does not query temperatures in this native UI. MSVC/MinGW and Windows 10/11 runtime validation are pending.

- UI click/back sound feedback and mute control: `docs/UI_AUDIO_FEEDBACK.md`.

## UI Audio Feedback (v0.83.10-dev / Package v94)

The native dashboard and module windows now provide soft, asynchronous click and back cues. The setting is available in VIP Studio and persists as `[Audio] Enabled=1` in `config/appearance.ini`; set it to `0` to mute. Details: `docs/UI_AUDIO_FEEDBACK.md`.


## UI Audio Feedback Expansion (v0.83.11-dev / Package v95)

The shared native audio layer now includes distinct success, warning, completion, and notification cues in addition to click/back. VIP Studio provides preview buttons for the four event cues. Branded tool windows play success or warning feedback based on the engine exit code and then a completion cue. Dashboard settings-save and denied-capability paths also provide appropriate feedback. The master `[Audio] Enabled` switch remains backward-compatible; optional per-cue keys (`ClickEnabled`, `BackEnabled`, `SuccessEnabled`, `WarningEnabled`, `CompleteEnabled`, `NotificationEnabled`) can independently mute categories. Four additional short PCM WAV assets are included. Windows audible playback, device routing, and native compilation still require Windows runtime/build validation.

## Custom UI Audio (v0.83.12-dev / Package v96)
VIP Studio can import a custom `.wav` file for each of the six UI cues (click, back, success, warning, completion, notification). Imported files are copied into `assets/audio/custom/`; relative paths are stored in `[Audio]` in `config/appearance.ini`. The importer enforces a 20 MiB file-size ceiling and checks the RIFF/WAVE container signature. It does not transcode or guarantee codec compatibility; PCM WAV is recommended. Missing custom files fall back to bundled cues. Windows playback validation remains pending. See `docs/UI_AUDIO_FEEDBACK.md`.


## Lifecycle UI Audio (v0.83.13-dev / Package v97)
The shared WinMM audio helper now supports optional startup and shutdown chimes. VIP Studio exposes separate enable switches and preview buttons; both lifecycle cues are opt-in and default to disabled (`StartupEnabled=0`, `ShutdownEnabled=0`) so existing installations do not gain unexpected sounds. Two short PCM WAV assets are bundled. Windows audio playback and GUI behavior still require Windows 10/11 runtime validation. See `docs/UI_AUDIO_FEEDBACK.md`.


### v0.83.14-dev (Package v98)
Dashboard native buttons now show a theme-colored outline on hover and a stronger alternate-accent outline while pressed. Standard Win32 button behavior remains delegated to the system. This enhancement currently applies to the main dashboard only; other windows are not claimed as covered. Windows compilation and runtime validation are pending.

### v0.83.16-dev / Package v100

- Added animated non-activating dashboard notifications and a click-to-open local notification log.
- Added launch feedback and dynamic per-monitor-v2 DPI-awareness request with fallback.
- See `docs/NOTIFICATIONS.md` for behavior and current limitations.

### v0.83.15-dev / Package v99
- Added a lightweight native startup splash before the dashboard.
- The splash uses the saved language and theme accent and closes automatically after 850 ms.

### v100 desktop notifications
The dashboard now shows animated, non-activating toast feedback for module launches. Click a toast to open the local UI notification history at `reports/ui_notifications.log`. Notification sounds follow the existing audio settings.

### Notification Center (v101)
The in-app Notification Center supports text search, refresh, confirmed clearing, and opening the log file. Toast events are queued FIFO (up to 50 waiting items) instead of replacing the active toast. The log is compacted to its newest 1,000 lines after exceeding 512 KiB. Existing button hover/pressed styling is also applied to VIP Studio child buttons. A real Windows build and GUI run are still required to validate native behavior.


### v0.83.18-dev / Package v102
- Dashboard controls now reflow on window resize, with three- or four-column layouts and DPI-scaled positions.
- The dashboard enforces a minimum tracking size to protect button usability.
- Standalone native modules launched through `CreateProcessW` now generate a queued notification when the process exits, including its exit code. This reports process exit status, not the success of every internal task.
- See `docs/DASHBOARD_RESPONSIVE_LAYOUT.md` and `docs/MODULE_EXIT_NOTIFICATIONS.md`.
- Windows build and mixed-DPI runtime verification remain pending.

### v103 process and DPI improvements
Dashboard-launched deployment CMD utilities now run as tracked child processes and publish their final wrapper exit code to the notification center. Branded tool windows request per-monitor DPI awareness and dynamically resize their output/status regions. Full responsive reflow of all tool controls remains in progress.

### v0.83.19-dev / Package v103
- Dashboard deployment CMD utilities are launched as tracked child processes; the Notification Center receives their wrapper process exit code.
- Branded tool windows request per-monitor DPI awareness and resize their output, progress, and status areas as the window changes size.
- Full reflow of all tool controls and reliable propagation from every nested PowerShell command remain follow-up work pending Windows runtime validation.

### Tool execution history (v104)
Completed dashboard-launched modules and command utilities append a local record to `reports/tool_execution_history.tsv` with timestamp, filename, process exit code, and success/nonzero classification. PowerShell-backed CMD wrappers return the PowerShell exit code to the dashboard watcher. This log is local and is not transmitted.
See `docs/TOOL_EXECUTION_HISTORY.md` for the TSV fields, retention policy, and verification limits.


### Command Center (v105)
Open **Command Center** from the dashboard to view tracked running tools and completed process results. Search and filter by running/success/failed status, open the local TSV history, or export recorded process metadata to CSV. The monitor is observational only and does not terminate or restart processes. See `docs/COMMAND_CENTER.md`.

### Project completion audit (v105)
The current release gates and remaining work are consolidated in `docs/PROJECT_COMPLETION_AUDIT_v105.md`. The project is not yet Windows-release-qualified; native builds and Windows 10/11 runtime validation remain mandatory.


Build pipeline update (v106): Windows CI now defines MSVC x86/x64 and MinGW-w64 x64 build, PE-architecture verification, native JSON tests, and artifact upload. CI execution is still required; this source package is not itself proof of a successful Windows build.

### Windows process integration gate (v107)
The Windows CI workflow now exercises CMD-to-PowerShell exit-code propagation under both Windows PowerShell 5.1 and PowerShell 7 using isolated temporary fixtures (expected exit codes 0 and 23). This validates wrapper transport only; individual tool semantics and Windows 10/11 GUI behavior still require separate runtime qualification. See `docs/WINDOWS_RUNTIME_TESTS.md` and `docs/PROJECT_COMPLETION_AUDIT_v107.md`.

### Secondary tool responsive layout (v108)
The shared branded tool windows now reposition their input, action, status, progress,
and output controls when resized or moved to a monitor with a different DPI. A second
action button wraps to a new row at constrained widths. This is source-level behavior;
Windows 10/11 visual and mixed-DPI runtime qualification remains pending.

### Storage safety hardening (v109)
Fast Copy now cleans up a partial destination only when its worker created that destination root, avoiding deletion of a directory created by another process during a preflight/start race. Backup Center now fails closed on enumeration, metadata, copy, hash, and manifest-write errors instead of silently skipping inaccessible files; failed attempts remove only their own newly-created backup folder. Restore now stages incoming files, snapshots existing destinations, and attempts reverse-order rollback for handled commit errors; it is not crash-consistent. Windows/USB runtime qualification remains pending. See `docs/STORAGE_RESTORE_TRANSACTION_v110.md` and `docs/PROJECT_COMPLETION_AUDIT_v110.md`.


### v110 — Staged backup restore
Backup restore now stages and revalidates all incoming files, snapshots existing destinations, and attempts reverse-order rollback after handled commit errors. If rollback itself fails, its transaction directory is retained for manual recovery. This is not crash-consistent; Windows fault-injection and filesystem qualification remain required.

## Windows 10 build and runtime packaging

The source ZIP does not contain prebuilt EXE files. On Windows 10 with Visual Studio 2022 and the **Desktop development with C++** workload installed, run `BUILD_WINDOWS_10.bat` from the project root. It builds x64 and x86 separately, verifies PE architecture, and creates runtime ZIPs under `dist`. See `docs/BUILD_ON_WINDOWS_10_AR.md`. Runtime qualification and Authenticode signing are still required before production distribution.
