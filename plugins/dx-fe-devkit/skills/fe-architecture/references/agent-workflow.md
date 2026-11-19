# Agent workflow

Run after [project-binding](project-binding.md). **Placement SSOT:** [depth-and-anti-flatten](depth-and-anti-flatten.md).

## New route / screen

| Step | Action |
| ---- | ------ |
| 1 | Confirm module: [decision-frameworks](decision-frameworks.md) |
| 2 | Create `features/<slice>/ui/<Name>Page.tsx` |
| 3 | Register lazy route in module `routing/` — [code-splitting](code-splitting.md) |
| 4 | Add `data/` only when page fetches; `api/` when new HTTP; `domain/` when rules |
| 5 | Export cross-slice symbols via `index.ts` only if needed — [public-api](public-api.md) |
| 6 | [verify-matrix](../../fe-kit/references/verify-matrix.md): routes → build |

## New HTTP for existing slice

| Step | Action |
| ---- | ------ |
| 1 | `features/<slice>/api/<resource>Api.ts` — wire only |
| 2 | DTO map beside API or `map*.ts` |
| 3 | `data/queryKeys.ts` + `queries.ts` / `mutations.ts` |
| 4 | Page imports hooks from `data/`, not raw client in `*Page` |

## New business capability

| Step | Action |
| ---- | ------ |
| 1 | New folder `features/<new-slice>/` with minimal layers |
| 2 | Do not add empty `api/` until first request exists |
| 3 | Module `routing/` + nav entry |
| 4 | Naming: `@fe-naming` [files-and-folders](../../fe-naming/references/files-and-folders.md) |

## Touch legacy `views/` / flat folder

| Step | Action |
| ---- | ------ |
| 1 | [decision-frameworks](decision-frameworks.md) strangler |
| 2 | Extract **api → data → domain → ui** in that order on touch |
| 3 | No **new** capabilities only in legacy if module exists |
| 4 | Preserve URLs unless product approves change |

## Cross-feature need

| Step | Action |
| ---- | ------ |
| 1 | [feature-boundaries](feature-boundaries.md) — merge rarely |
| 2 | Prefer import from other feature’s `index.ts` export |
| 3 | If ≥2 modules need same UI/client → workspace lib — [layout](layout.md) § libs |
| 4 | Prefer query invalidation over event bus |

## Promote shared UI / client

| Step | Action |
| ---- | ------ |
| 1 | Second **product module** consumer required before lib ([mental-model](mental-model.md) rule 7) |
| 2 | Module-level `ui/<role>/` before workspace package when module-only |
| 3 | Update public exports; avoid breaking feature barrels |

## Refactor fat page

| Step | Action |
| ---- | ------ |
| 1 | [architectural-smells](architectural-smells.md) |
| 2 | [refactoring-playbook](refactoring-playbook.md) extract order |
| 3 | One behavioral slice per PR when possible |
| 4 | Tests green after each phase |

## PR self-check

```
- [ ] File in lowest correct layer folder?
- [ ] Imports respect ui → data → api → domain?
- [ ] No feature-root utils/hooks dump?
- [ ] Cross-slice via index.ts only?
- [ ] Lazy target is ui/*Page?
- [ ] queryKey includes all queryFn inputs?
```