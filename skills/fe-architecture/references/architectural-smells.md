# Architectural smells

Deep audit procedure: [review-auditor.md](review-auditor.md). Refactor PR slicing: [refactoring-playbook.md](refactoring-playbook.md).

Refactor order: **`api` → `data` → `domain` → `ui`**.

| Smell | Remediation | Severity |
| ----- | ----------- | -------- |
| File at feature root | [depth-and-anti-flatten.md](depth-and-anti-flatten.md) | Block new |
| HTTP client in `ui/` | Extract `api/` | Block |
| Duplicate status logic | `domain/actions` | High |
| `lazy(() => import('.../index'))` | Lazy `*Page` | High |
| Private cross-feature `data/` import | [public-api.md](public-api.md) | Medium |
| Feature-root `utils/` | `domain/` or module `shared/` | Block new |
| Query key missing filters | Fix keys | High |
| Premature workspace lib | [layout.md](layout.md) | Medium |
| Single-feature screen in `module/ui/` | Move to feature `ui/` | Medium |
| `domain` with i18n | `ui/*Display` | Medium |
| 500+ line page | Split `ui/` + `data/` | High |
| `eslint-disable` import zones | Fix graph | Block |
| Client assumes workflow state | `domain` from API only | Block |
| Flat bloated `module/ui/` | [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md) | Medium |
| Flat bloated `domain/` or `data/` layer | Segment under `domain/<entity>/` to match `data/` ([depth-and-anti-flatten.md](depth-and-anti-flatten.md) § layer flat) | Medium |
| `data/` segmented, `domain/` flat carpet | **D-MISMATCH** — align nouns with `data/` subfolders | Medium |
| Flat `module/ui/<role>/` primitive cluster | `ui/<role>/<kebab-package>/` + public re-export ([module-ui-component-packages.md](module-ui-component-packages.md)) | Medium |
| Shell imports `features/.../api` | Export via `index.ts` | High |

## Quality (non-structure)

| Area | Rule |
| ---- | ---- |
| Tests | `domain/*.spec.ts` for pure rules |
| Performance | Route lazy; debounced values in query keys |
| Security | Public env vars only in FE; UI hide ≠ authz |
