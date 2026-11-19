# Depth rules — prevent flattened structure

**Mandatory** when creating or moving files under **product modules** (`modules/<product>/` or repo equivalent). Map path via `AGENTS.md`.

Related: [layer-responsibilities.md](layer-responsibilities.md), [layout.md](layout.md), [code-splitting.md](code-splitting.md), [architectural-smells.md](architectural-smells.md).

## What “depth” means

| Deep (required) | Flat (forbidden for new code) |
| --------------- | ----------------------------- |
| `features/<slice>/api/fooApi.ts` | `features/<slice>/fooApi.ts` at root |
| `data/<entity>/queries.ts` when slice is large | Dozens of siblings in flat `data/` |
| `domain/<entity>/status.ts` when `data/` is segmented | Many siblings in flat `domain/` |
| `data/queryKeys.ts` + `data/queries.ts` | `useQuery` inline in `*Page.tsx` |
| `domain/actions.ts` | Duplicate `status` checks in many components |
| `ui/*Page.tsx` composes hooks | Page > ~250 lines with fetch + form + table |
| Module `ui/` only for **≥2 features** | Single-feature screen in module `ui/` |

**Depth** = one job per file, lowest correct folder, downward imports only.

## Mandatory decision (stop at first match)

1. **New URL / screen?** → `features/<slice>/ui/<Name>Page.tsx`; register in module `routing/`.
2. **HTTP / DTO map?** → `features/<slice>/api/`.
3. **Rule, guard, pure type?** → `features/<slice>/domain/`.
4. **Query key, hook, list state?** → `features/<slice>/data/`.
5. **≥2 features in same module?** → module `ui/` / `data/`, or owning feature `index.ts`.
6. **≥2 product modules / apps?** → shared workspace lib ([layout.md](layout.md)).
7. Else → read sibling feature; **do not** add `helpers/`, `utils/`, `services/` at feature root.

## Layer imports (enforce)

```text
ui     →  data, domain, module ui/shared, design-system
data   →  api, domain
api    →  domain (types)
domain →  domain only
```

Forbidden: `ui` → HTTP client; `domain` → React or `data`; `api` → `ui`.

## Anti-flatten patterns

| Pattern | Fix |
| ------- | --- |
| `utils.ts` / `hooks.ts` at feature root | `domain/`, `data/`, or `ui/use*.ts` |
| Mega `*Page.tsx` | Split `ui/*Table.tsx`, hooks to `data/` |
| Route imports feature internals from app shell | Module `routing/` + lazy `ui/*Page` |
| Logic in `modules/<product>/` without `features/` | Create/use `features/<slice>/` |

## Thin feature exception

All true: reuses another feature’s public `data/`; no new HTTP; no new domain transitions; ≤ ~3 UI files. Not for new CRUD/API surface.

## Split triggers (same layer)

File > ~250 lines with two jobs; shared logic >30% across screens; `queries.ts` > ~150 lines → split under `data/` by entity.

## Layer flat (inside `api/` / `domain/` / `data/`)

Anti-flatten is **not** only the feature root. A **layer carpet** — many sibling modules, no subfolders — hurts navigability the same way `utils/` at feature root does.

| Signal | Threshold | Finding ID |
| ------ | --------- | ---------- |
| Flat layer file count | **≥ 12** non-spec source files directly under `domain/` (or `api/`, `data/`) with **zero** child directories | **L-FLAT** |
| Data segmented, domain not | `data/` has **≥ 2** entity subfolders; `domain/` is still flat with **≥ 8** files | **D-MISMATCH** |
| New rule in flat carpet | Adding another top-level `domain/*.ts` while **L-FLAT** or **D-MISMATCH** is open | **Block new** — add under the matching entity subfolder instead |

**Segmentation rule:** When `data/` is already grouped by business noun (`records/`, `form/`, `create/`, …), new `domain/` code for that noun goes in `domain/<same-noun>/`. Cross-cutting types and guards may live in `domain/types.ts` or `domain/shared/` at layer root — keep that set small (types, constants, pure helpers used by ≥2 subfolders).

**Refactor:** move-only PRs per entity folder; co-locate `*.spec.ts`; update imports inside the feature ([refactoring-playbook.md](refactoring-playbook.md) § flat domain). Pair with module contract if it forbids cosmetic-only moves.

## Module `ui/` role depth (not feature layers)

After `module/ui/<role>/` exists ([module-shell-ui-segmentation.md](module-shell-ui-segmentation.md)):

| Signal | Threshold | ID |
| ------ | --------- | -- |
| Flat role carpet | **≥ 8** impl files at `ui/<role>/` root with no component subfolders | **M-UI-FLAT** |
| Primitive cluster | **≥ 5** files for one export (shared prefix / internal-only graph) not in a package | **M-UI-PACKAGE** |
| New internal part | Adding file to an existing cluster instead of `ui/<role>/<package>/` | **Block new** when **M-UI-PACKAGE** open |

Packages and re-exports: [module-ui-component-packages.md](module-ui-component-packages.md).

## Agent checklist

- [ ] New symbols under feature **layer** folders, not feature root.
- [ ] No query hooks added in pages except trivial delegate (still prefer `data/`).
- [ ] No HTTP client outside `api/`.
- [ ] Query key includes all `queryFn` inputs.
- [ ] No new `utils/` / `services/` folders.

Refactor existing flat code: `api` → `data` → `domain` → `ui` last.

Scenarios: [agent-workflow.md](agent-workflow.md).
