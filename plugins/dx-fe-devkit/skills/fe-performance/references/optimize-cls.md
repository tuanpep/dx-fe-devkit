# Optimize CLS (layout stability)

CLS accumulates unexpected movement. Enterprise UI: tables, alerts, tabs, async page headers, avatars.

## High-impact patterns

| UI | Fix |
| -- | --- |
| Table loading | Skeleton with **same row height** and column widths as loaded state |
| Async page title / breadcrumbs | Reserve min-height in header region |
| Images / avatars | `width`/`height` or fixed circle box |
| Charts | Fixed aspect container before series data |
| Banners / toasts | Overlay or reserved strip — don't push main content ([dx-ui feedback](../../dx-ui/references/feedback-states.md) patterns) |
| Web fonts | `size-adjust` / fallback stack matching metrics |

## Data arrival

When server rows replace skeleton:

- Match pagination bar height.
- Keep filter toolbar mounted (disable controls vs unmount).
- Avoid swapping compact empty state for tall illustration without min-height.

## Fonts and icons

- Icon font flashes: prefer SVG/icon components with intrinsic size.
- Load icon subsets or tree-shaken icons — avoid FOIT on critical labels.

## Measurement

- Lighthouse CLS + visual review on slow 3G.
- Field: watch CLS on routes with heavy tables after deploy.

## dx-ui alignment

Tables scroll **inside** region when possible — reduces whole-page shift from growth ([data-tables-density](../../dx-ui/references/data-tables-density.md)).