# Code splitting

**Depth:** [depth-and-anti-flatten.md](depth-and-anti-flatten.md). **Bundles:** async boundaries aligned with product routes.

## Stack

1. **Optional** coarse split — single MF remote, separate deployable, or route-based app chunks.
2. **Module routes** — `React.lazy` on concrete `features/<slice>/ui/*Page`.
3. **In-page** — second `lazy` for heavy deps (charts, editors) used by one screen.

Splitting does not replace `api/data/domain/ui`; it controls **when** JS downloads.

```text
(app bootstrap)
  lazy → module routing
    lazy → features/<slice>/ui/*Page   ← primary chunk per URL
```

Static imports from the page pull `data/`, `domain/`, `api/` into that chunk unless behind another `dynamic import()`.

## Module route lazy

```typescript
component: lazy(() => import('../features/<slice>/ui/<Name>Page'))
```

| Do | Don't |
| --- | ----- |
| Lazy concrete page path | Lazy feature `index.ts` barrel |
| Register lazy in module `routing/` | Wire new module features only from legacy route folders |

## Module Federation (when used)

Prefer **one** remote expose per micro-frontend; use **internal** route lazy for per-module savings. Avoid many per-feature MF exposes unless org requires separate deploys.

## In-page lazy

Wrap heavy child in `Suspense` when only parent needs it and parent should paint fast.

## Barrels

Route registration never lazy-loads barrels ([public-api.md](public-api.md)).

## Checklist

- [ ] Lazy target is `ui/*Page` (or legacy page file).
- [ ] Page not default-exported from `index.ts` for routing.
- [ ] No accidental static shell → heavy feature import.
