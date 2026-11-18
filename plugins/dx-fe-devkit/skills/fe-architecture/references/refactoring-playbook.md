# Refactoring playbook

Turn [review-auditor.md](review-auditor.md) findings into **safe, reviewable PRs**. Always extract **`api` → `data` → `domain` → `ui`** ([architectural-smells.md](architectural-smells.md)).

## When to refactor

| Trigger | Action |
| ------- | ------ |
| Touching a flat / mega file for a feature change | Extract the needed layer in the same change if small; else split work |
| Deep audit **High/Block** | Schedule phased PRs before major new work on that slice |
| Strangler legacy | Feature extraction per [decision-frameworks.md](decision-frameworks.md) |
| Module forbids cosmetic moves | Pair structure changes with testable behavior ownership (see scope `AGENTS.md`) |

## Phase A — `api/`

**Goal:** Network and DTO mapping here; no UI framework.

1. Find inline HTTP / service calls in `ui/` or misplaced in `data/`.
2. Add `features/<slice>/api/<entity>Api.*` (match sibling naming).
3. Place DTO → domain mappers with API ([layer-responsibilities.md](layer-responsibilities.md)).
4. Point `data/` at `api/`; defer thinning `ui/` until hooks exist in `data/`.
5. Run specs that cover those calls.

**Done when:** no HTTP client under `ui/`; `api/` has no UI imports.

## Phase B — `data/`

**Goal:** Server/async state — query keys, hooks, list or search state ([server-state.md](server-state.md)).

1. Add or extend `data/queryKeys.*` (or `data/<entity>/queryKeys.*`).
2. Every input to the fetch function appears in the query key.
3. Move server-state hooks from pages into `data/queries.*`, `mutations.*`, or `use*Screen.*`.
4. Centralize table or URL search state in typed `data/state.*` when the module contract requires it.
5. Align mutation invalidation with repo rules (often feature-wide `all` key).

**Done when:** pages call a screen hook; pages are mostly layout + event wiring.

## Phase C — `domain/`

**Goal:** Pure rules, guards, discriminated types.

1. Collect duplicated status / permission checks from `ui/` and `data/`.
2. Add `domain/types.*`, `domain/actions.*`, `domain/status.*` as needed.
3. Add `domain/*.spec.*` for non-trivial rules when the repo tests them.
4. `ui/` asks domain helpers; do not assume server transitions succeed client-side.

**Done when:** workflow guards have one home; pure domain has no UI framework or i18n.

## Phase D — `ui/`

**Goal:** Thin pages, focused components.

1. Split route pages **> ~250 lines**: table, filters, dialogs into sibling `ui/` files or subfolders by flow.
2. Screen orchestration stays in `data/` unless render-only ([layer-responsibilities.md](layer-responsibilities.md)).
3. Update route lazy paths — still concrete `ui/*Page`, not barrel ([code-splitting.md](code-splitting.md)).
4. Fix in-feature relative imports; fix cross-feature consumers via public `index.ts` only.

**Done when:** one job per file; pages read as a table of contents.

## Public API cleanup

1. Export only what sister features need from `index.ts` ([public-api.md](public-api.md)).
2. Split fat barrels (types vs hooks) if tests or routing pull heavy graphs.
3. Optional lightweight public file (e.g. `keys.ts`) when module contract needs query keys without heavy hooks — document in binding.

## PR slicing strategy

| PR | Contents | Verify |
| -- | -------- | ------ |
| 1 | `api/` only | Mapper / API tests; build |
| 2 | `data/` keys + hooks | Query or hook specs; one screen |
| 3 | `domain/` + specs | Domain unit tests |
| 4 | `ui/` split + routes | Lint; smoke affected routes |

Do not mix **api extraction** and **visual redesign** in one PR.

## Recipe — mega page

**Symptom:** One route file fetches, mutates, validates, and renders table + multiple dialogs.

```text
Before:
  ui/EntityPage.*  (large file, server-state hooks inside)

After:
  api/entityApi.*
  data/entity/queryKeys.*, queries.*, mutations.*, useEntityScreen.*
  domain/actions.* (+ spec)
  ui/EntityPage.*           (thin)
  ui/list/EntityTable.*
  ui/list/EntityFilters.*
```

## Recipe — flat feature root

**Symptom:** `helpers.*`, `useFoo.*` at feature root.

```text
helpers.*   → domain/*Rules.*  OR  data/*Mappers.*
useFoo.*    → data/useFoo.*    OR  ui/useFooForm.*
Remove root file after moves; no permanent re-export stubs at root.
```

## Recipe — cross-feature leak

**Symptom:** `features/bar/ui/Table.*` imports `../../baz/data/queries`.

1. Export hook/type from `features/baz/index.ts` (or documented public entry).
2. Import from that entry only.
3. If circular: module `shared/` or owning feature API ([feature-boundaries.md](feature-boundaries.md)).

## Recipe — flat `domain/` layer (D-MISMATCH)

**Symptom:** `data/` has entity subfolders; `domain/` has many sibling `*.ts` files (Phase 0b **L-FLAT** / **D-MISMATCH**).

**Principles:**

- Mirror **`data/<entity>/` nouns** under `domain/<entity>/`.
- Keep at layer root only: `types.ts`, `constants.ts`, and pure helpers used by **≥ 2** entities (or introduce `domain/shared/`).
- Move `*.spec.ts` with its module; run domain specs after each entity PR.

**Example mapping** (illustrative — derive from your `data/` tree):

```text
data/records/     → domain/records/     (status, actions, sort, identity, list rules)
data/form/        → domain/form/        (form ids/values, sanctions, handle type, catalog)
data/create/      → domain/create/      (batch create, case payload)
data/documents/   → domain/documents/  (report, conclusion, decision, download)
data/attachments/ → domain/attachments/ (attachments, zip, file names)
domain/types.ts   stays at root
```

**PR order:** one entity folder per PR; no behavior changes; fix relative imports in `data/` and `ui/` for that entity only.

## Recipe — module UI component package

**Symptom:** **M-UI-PACKAGE** / **M-UI-FLAT** in `module/ui/<role>/` ([module-ui-component-packages.md](module-ui-component-packages.md)).

1. Name package folder `ui/<role>/<kebab-primitive>/`.
2. Move implementation, types, hooks, pure helpers, and specs into the folder.
3. Fix imports to sibling module roles: `../display` → `../../display` (up through `ui/`, then into role).
4. Add or keep **public entry** at role root (`ui/<role>/<PascalPrimitive>.tsx`) — re-export if needed for stable consumers.
5. Leave product wrappers as siblings importing the public entry.
6. Update `jest.mock` paths in package specs (same `../../` rule).
7. Run package specs + one wrapper spec + one feature consumer spec.

Do not move wrappers into the package unless they are generic across products.

## Recipe — module `ui/` misplaced

**Symptom:** Single-feature screen under `modules/<product>/ui/`.

1. Move to `features/<slice>/ui/`.
2. When a second feature needs it → promote to module `ui/` with a clear shared name.

## Verification checklist

Use commands from repo `AGENTS.md` / [project-binding.md](project-binding.md):

- [ ] Lint for affected projects  
- [ ] Unit tests for changed `domain/` / `data/` / `api/`  
- [ ] Application or package build  
- [ ] Smoke documented routes or flows for UI changes  

## Related

- [review-auditor.md](review-auditor.md)
- [depth-and-anti-flatten.md](depth-and-anti-flatten.md)
- [decision-frameworks.md](decision-frameworks.md)
