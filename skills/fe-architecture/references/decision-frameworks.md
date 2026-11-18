# Decision frameworks

Exceptions and migration. **File placement:** [depth-and-anti-flatten.md](depth-and-anti-flatten.md) only.

## New module vs legacy area?

| Question | If yes |
| -------- | ------ |
| New product / bounded context? | `modules/<product>/` |
| Existing module for this product? | That module’s `features/` |
| No module yet, legacy only? | Legacy tree until strangler |
| Shared across products in monorepo? | Workspace UI/data lib |

## Barrel vs direct?

[public-api.md](public-api.md)

## Thin feature exception

Reuses public `data/` API; no new HTTP; no new domain transitions; ≤ ~3 UI files. Not for new CRUD.

## When not to add structure

- Empty `api/`/`data/` until needed.
- No global `entities/` layer until many features share one noun.
- No per-feature remote expose unless deploy requires it.
- No feature merge except chronic cross-imports ([feature-boundaries.md](feature-boundaries.md)).

## Strangler (legacy → module)

```text
[legacy/*]  ──►  modules/<product>/features/<slice>/
```

1. Add module shell + `routing/`; preserve URLs when possible.
2. Move screens to `features/<slice>/ui/`; extract `api` → `data` → `domain` first.
3. Point lazy imports at new paths; delete dead legacy files.
4. URL renames need product approval.

While in legacy: extract layers on touch; do not add **new** capabilities only in legacy if a module exists.

## Related

- [layout.md](layout.md)
