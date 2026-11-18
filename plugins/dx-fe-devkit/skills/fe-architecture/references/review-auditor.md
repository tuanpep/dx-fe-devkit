# Review auditor (deep)

Use when **auditing existing code** or **planning refactors** to match [mental-model.md](mental-model.md), [depth-and-anti-flatten.md](depth-and-anti-flatten.md), and [architectural-smells.md](architectural-smells.md). Shallow PR review: ten rules + smells table only. **Deep audit:** follow this document end-to-end.

**Output contract:** every finding cites a **path** (and line range when useful), maps to a **rule ID**, has **severity**, and lists a **concrete refactor step** (not “clean up structure”).

## Preconditions

| Step | Action |
| ---- | ------ |
| 1 | Repo path binding — if present, [project-binding.md](project-binding.md); else map paths via root `AGENTS.md` |
| 2 | Scope contract — root `AGENTS.md`; module- or app-level `AGENTS.md` under the audit path if it exists |
| 3 | Pick **audit scope** (see below) |
| 4 | Load layer docs for expected smells: [server-state.md](server-state.md), [public-api.md](public-api.md), [code-splitting.md](code-splitting.md), [module-shell.md](module-shell.md) |

## Audit scope

Resolve concrete folders from [layout.md](layout.md) and repo binding. Generic patterns:

| Scope | Typical path pattern | Deep audit includes |
| ----- | -------------------- | ------------------- |
| **App shell** | `<app-src>/`, bootstrap, optional MF remote entry | Imports modules only via module public entry; no feature internals |
| **Module** | `<module-root>/<product>/` | `routing/`, module `index`, module `ui` / `data` / `shared`, every `features/*` |
| **Feature** | `<module-root>/<product>/features/<slice>/` | All layers + cross-slice imports |
| **Legacy strangler** | Legacy route or `pages/` / `views/` tree named in `AGENTS.md` | Extract plan per [decision-frameworks.md](decision-frameworks.md) |

Default for “review this product module deeply”: **module** scope with per-feature sub-reports.

## Phase 0 — Inventory

Produce a short tree summary (folders only, not every file):

```text
<module-root>/<product>/
  routing/     ✓ | missing
  features/<slice>/
    api/       ? | ✓ | missing (OK if thin slice)
    data/      ?
    domain/    ?
    ui/        ✓
    index.ts   ✓ (public API, if used)
    <flat>     ⚠ any file at feature root — see rule below
```

**Feature root (default):** only `index.ts` for cross-slice exports ([public-api.md](public-api.md)). Repo or module `AGENTS.md` may allow extra root files (e.g. lightweight `keys.ts`); list those in **project binding** or module contract. Any other file at feature root → finding **F-ROOT**.

Record:

- Line counts for route pages (`ui/*Page.*`) and screen orchestration hooks (`data/use*Screen.*`, `ui/use*.*`)
- Whether routes use lazy import of a **concrete page file**, not a feature barrel ([code-splitting.md](code-splitting.md))
- **Layer depth** per feature — see Phase 0b (required when `domain/` or `data/` exists)

## Phase 0b — Layer depth inventory

For each `features/<slice>/` in scope, measure **flat layer carpets** ([depth-and-anti-flatten.md](depth-and-anti-flatten.md) § layer flat).

| Metric | How to measure |
| ------ | -------------- |
| `domain/` file count | Non-spec `*.ts` files **directly** under `domain/` (not in subfolders) |
| `domain/` subdirs | Count child directories under `domain/` |
| `data/` subdirs | Count child directories under `data/` (entity folders) |
| `api/` flat count | Same as domain, when `api/` exists |

**Raise a finding when:**

| ID | Condition | Default severity |
| -- | --------- | ---------------- |
| **L-FLAT** | Layer has **≥ 12** non-spec files at layer root and **0** subdirectories | Medium |
| **D-MISMATCH** | `data/` has **≥ 2** subdirectories and `domain/` has **≥ 8** root files and **0** subdirectories | Medium (High if **≥ 20** domain root files) |
| **L-NEW-FLAT** | PR adds a new root-level file under a layer that already hits **L-FLAT** / **D-MISMATCH** | Block new |

Report a compact table per feature:

```text
order-records: domain root=24 impl + specs → L-FLAT + D-MISMATCH (data: attachments, create, documents, form, records)
```

### Layer depth scans

```bash
# Bash: count non-spec ts files at domain root (one feature)
find <MODULE_ROOT>/features/<slice>/domain -maxdepth 1 -name '*.ts' ! -name '*.spec.ts' | wc -l

# List data entity folders
find <MODULE_ROOT>/features/<slice>/data -mindepth 1 -maxdepth 1 -type d
```

```powershell
# PowerShell: domain flat count + data subfolder count
$dom = "…/features/<slice>/domain"
$data = "…/features/<slice>/data"
$flat = (Get-ChildItem $dom -File -Filter '*.ts' | Where-Object { $_.Name -notmatch '\.spec\.ts$' }).Count
$sub = (Get-ChildItem $dom -Directory).Count
$dataEnt = (Get-ChildItem $data -Directory -ErrorAction SilentlyContinue).Count
"$slice domain flat=$flat subdirs=$sub dataEntities=$dataEnt"
```

**Refactor output:** For **D-MISMATCH**, propose `domain/<entity>/` names mirroring `data/` and list which root files move to each bucket ([refactoring-playbook.md](refactoring-playbook.md) § flat domain).

## Phase 1 — Ten rules scorecard

Score each rule **Pass | Warn | Fail** with evidence.

| ID | Rule | Fail signals |
| -- | ---- | ------------ |
| R1 | Thin composition roots | App imports feature private paths; `routing/` contains business logic |
| R2 | Capability-first folders | `hooks/`, `utils/`, `services/`, `models/` at feature root; **L-FLAT** / **D-MISMATCH** on `domain/` or `data/` |
| R3 | Inward dependencies | `domain` imports UI framework or server-state library; `data`/`domain` upward into `ui`; `api` imports `ui/` |
| R4 | Server truth in `data/` | Server-state hooks in route pages (non-trivial); cache policy in `ui/` |
| R5 | Public API | Cross-feature import bypassing owning `index.ts` (or documented public entry); lazy import of feature barrel |
| R6 | URL-aligned lazy | Lazy target is barrel `index`; page routed only through barrel default export |
| R7 | Lib promotion | Same client duplicated across product modules without shared-package justification ([layout.md](layout.md)) |
| R8 | Product / module contract | Violation of scope `AGENTS.md` (forms, queries, routing, i18n, etc.) |
| R9 | Refactor extract order | Plan changes `ui/` before `api` / `data` / `domain` |
| R10 | No empty layers | Empty layer folders committed “for later” |

References: [mental-model.md](mental-model.md) § Ten rules.

## Phase 2 — Smell sweep

Map each hit to [architectural-smells.md](architectural-smells.md). **Block** smells are merge blockers for *new* violations; existing legacy may be **Warn** with a strangler ticket.

Prioritize: **Block** → **High** → **Medium**.

## Phase 3 — Import graph (deep)

For each feature in scope, sample imports from route pages and largest `ui/` components:

1. **Upward — HTTP in UI:** `ui/` imports raw HTTP client or service class → **S-HTTP-UI** (type-only imports from `api/` may be OK per repo)
2. **Sideways — public API:** feature A imports feature B’s `data/`, `api/`, or private `ui/` without documented public entry → **S-PUBLIC**
3. **Barrel — self or lazy:** same-feature code imports through own `index.ts` when repo forbids it → **S-BARREL-SELF** (module overlay only)
4. **Module shell:** module-level `ui/` or `data/` imports sibling feature private path → **S-PUBLIC**

### Scan recipes (adapt paths and symbols)

Set variables from [project-binding.md](project-binding.md) or `AGENTS.md`:

- `<MODULE_ROOT>` — product module folder under audit  
- `<HTTP_SYMBOLS>` — regex for HTTP client (e.g. `httpClient`, `fetch`, `axios`, `BaseService`)  
- `<RQ_SYMBOLS>` — server-state library (e.g. `useQuery`, `useMutation`, package name)  
- `<ALLOWED_ROOT>` — allowed feature-root filenames besides `index.ts`

```bash
# Cross-feature imports into features/<other>/...
rg "features/[^/'\"]+/" <MODULE_ROOT> --glob "*.{ts,tsx,js,jsx}"

# Lazy barrel
rg "lazy\\(\\s*\\(\\)\\s*=>\\s*import\\([^)]*index" <MODULE_ROOT>

# HTTP in ui layer
rg "<HTTP_SYMBOLS>" <MODULE_ROOT> --glob "**/features/**/ui/**"

# Server state in domain
rg "<RQ_SYMBOLS>" <MODULE_ROOT> --glob "**/features/**/domain/**"

# Feature-root files (PowerShell example — adjust ALLOWED_ROOT)
# List files directly under each features/<slice>/ excluding allowed names
```

## Phase 4 — Layer responsibility drill-down

Per [layer-responsibilities.md](layer-responsibilities.md):

| Layer | Deep checks |
| ----- | ------------- |
| `api/` | Wire ↔ domain mapping; no UI framework; no user-visible copy in mappers |
| `domain/` | Pure rules + types; tests for non-trivial transitions when repo uses them |
| `data/` | Query key factory; keys include all inputs to the fetch function ([server-state.md](server-state.md)) |
| `ui/` | Composes `data/`; workflow guards not duplicated when they belong in `domain/` |

**Mega-file triggers** ([depth-and-anti-flatten.md](depth-and-anti-flatten.md)):

- Route page or screen hook **> ~250 lines** → split (`ui/` children + `data/` hooks)
- Monolithic `queries.*` **> ~150 lines** → split under `data/<entity>/` or by noun

**Layer carpet** (Phase 0b — do not skip when auditing a large slice):

- Count flat `domain/*.ts` (exclude `*.spec.ts`); compare to `data/` entity folders
- Flag misplaced concerns: display/i18n in `domain/` → existing smell “domain with i18n”; zip/binary helpers that are orchestration → may belong in `data/` if tied to mutations (note in finding, don’t auto-fail)

## Phase 5 — Module shell (when scope = module)

[module-shell.md](module-shell.md), [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md):

- Module `ui/` only for UI shared by **≥2 features** in the module
- Module `data/` for cross-feature invalidation, router state codecs — not single-feature list state
- `routing/` (or equivalent) owns lazy route targets

**Repo overlays:** extra audit rules for a specific module live in that module’s `AGENTS.md` and in [project-binding.md](project-binding.md) § Review overlays — not in this generic doc.

## Phase 5b — Module `ui/` role depth

When scope includes `modules/<product>/ui/`, audit each **role** folder (`pickers/`, `actions/`, `display/`, …). Spec: [module-ui-component-packages.md](module-ui-component-packages.md).

| ID | Condition | Severity |
| -- | --------- | -------- |
| **M-UI-FLAT** | **≥ 8** non-spec files at `ui/<role>/` root (exclude one-line public re-exports) | Medium |
| **M-UI-PACKAGE** | **≥ 5** files belong to one primitive cluster (shared prefix or internal import graph) and are not under `ui/<role>/<kebab-package>/` | Medium |
| **M-UI-LEAK** | Feature imports path under `ui/<role>/<package>/` (bypasses role-level public entry) | High |

**Checks:**

- Public entry at role root is implementation or thin re-export only (not duplicate bodies).
- Product wrappers remain siblings; they must not fork package internals.
- Specs and `jest.mock` paths use correct `../../` depth after package moves.

```bash
# Flat files at role root (adjust ROLE)
find "<MODULE_ROOT>/ui/<ROLE>" -maxdepth 1 -type f \( -name '*.ts' -o -name '*.tsx' \) ! -name '*.spec.*'
```

```powershell
Get-ChildItem "<MODULE_ROOT>/ui/<ROLE>" -File |
  Where-Object { $_.Name -notmatch '\.spec\.(ts|tsx)$' }
```

Report: `<role>: M-UI-PACKAGE → <kebab-package>/ (N files)` or list open clusters ([module-ui-component-packages.md](module-ui-component-packages.md) § detecting a cluster).

## Severity rubric

| Severity | Meaning | Action |
| -------- | ------- | ------ |
| **Block** | New code must not copy this; merge blocker if introduced in PR | Fix in same PR or reject |
| **High** | Correctness, bundle, or boundary risk | Dedicated refactor PR soon |
| **Medium** | Maintainability / consistency | Batch with related feature work |
| **Low** | Naming, optional depth | Backlog |

## Finding record format

```markdown
### [SEVERITY] RULE-ID — Short title

- **Where:** `path/to/file` (L10–L80) or folder
- **Rule:** R4 / S-HTTP-UI / F-ROOT / architectural-smells row
- **Observation:** One factual sentence.
- **Risk:** Why it matters (one sentence).
- **Refactor:** Numbered steps; extract order `api` → `data` → `domain` → `ui`.
- **Tests:** Specs to add or run (if any).
- **Deps:** Other findings or work that must land first.
```

## Deep audit report template

1. **Executive summary** — scope, Pass/Warn/Fail counts, top 3 risks  
2. **Scorecard** — R1–R10  
3. **Findings** — by severity, then rule ID  
4. **Refactor roadmap** — [refactoring-playbook.md](refactoring-playbook.md); phased PRs  
5. **Verification** — lint / test / build commands from repo `AGENTS.md`; smoke routes or flows if documented  

## Refactor planning (summary)

| Principle | Detail |
| --------- | ------ |
| Extract order | `api` → `data` → `domain` → `ui` |
| PR size | One capability or one layer per PR when possible |
| Behavior | No drive-by product changes; tests green after each phase |
| Cosmetics | Avoid move-only refactors unless module contract allows or pairs with testable ownership |

## Anti-patterns for the auditor

- Do not fail code that matches a **documented exception** without citing the contract (`AGENTS.md` / binding).
- Do not recommend shared packages on first duplicate — [layout.md](layout.md) § libs.
- Do not delete logic when moving layers — **move**, then fix imports.
- Prefer **evidence** over style opinions.

## Related

- [refactoring-playbook.md](refactoring-playbook.md)
- [architectural-smells.md](architectural-smells.md)
- [feature-boundaries.md](feature-boundaries.md)
- [project-binding.md](project-binding.md) — repo-specific paths and audit overlays
