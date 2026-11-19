# Feature boundaries

A **feature** = one business capability the team can name in product language (`order-records`, `user-invites`). Not every screen is its own feature.

## When to create a new slice

| Signal | Action |
| ------ | ------ |
| Distinct lifecycle / ownership in backlog | New `features/<slice>/` |
| Separate API surface or IAM boundary | New slice |
| List + detail + edit share one aggregate | **One** slice, multiple `ui/*` files |
| Reused action on many pages (e.g. comments) | Feature **or** module `ui/` if module-wide — [decision-frameworks](decision-frameworks.md) |

## When **not** to split

- CRUD on one aggregate split into `list/`, `edit/`, `delete/` features without team boundaries.
- Folder split only to reduce file count — use `ui/` files inside one slice.

## Merge features

Only when slices **always** ship together and suffer chronic **illegal** cross-imports of private paths. Document in module `AGENTS.md`. Prefer module-level composition over mega-feature.

## Cross-feature integration

| Need | Prefer |
| ---- | ------ |
| Read another slice’s data | Import **exported** hook/type from `features/other/index.ts` |
| React to another slice’s mutation | Query invalidation in `data/` — shared key prefix when same entity |
| Navigation | Module `routing/` composes URLs |
| Global event bus | Avoid — last resort with typed events |

Policies: [public-api](public-api.md), [external-standards-convergence](external-standards-convergence.md).

## Module `ui/` vs feature `ui/`

| Location | When |
| -------- | ---- |
| Feature `ui/` | One slice owns screen |
| Module `ui/<role>/` | **≥2 features** in same module use primitive — [module-ui-component-packages](module-ui-component-packages.md) |
| Workspace lib | **≥2 product modules** — [layout](layout.md) |

## Thin feature exception

Reuses existing public `data/` API; no new HTTP; no new domain transitions; ≤ ~3 UI files. [decision-frameworks](decision-frameworks.md). Not for new CRUD.

## Facade pattern

Narrow `index.ts` when many consumers need stable surface — export hooks and types only, not every `ui/` helper.

## Related

- [module-shell-ui-segmentation](module-shell-ui-segmentation.md)
- [public-api](public-api.md)