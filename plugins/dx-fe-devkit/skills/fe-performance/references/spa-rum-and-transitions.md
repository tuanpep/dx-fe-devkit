# SPA RUM & route transitions

Reference: [web.dev SPA and CWV FAQ](https://web.dev/articles/vitals-spa-faq) — metrics tied to top-level navigation.

## Implication for admin SPAs

- Users live inside one loaded app for hours — **INP** and **custom timings** matter more than repeated LCP on every menu click.
- CrUX may reflect login/landing URL, not every module route — supplement with product RUM.

## Custom timings (recommended)

Instrument at module router or feature page boundary:

```typescript
performance.mark('nav:user-list:start');
// after data + primary UI ready (not every secondary widget)
performance.mark('nav:user-list:ready');
performance.measure('route:user-list', 'nav:user-list:start', 'nav:user-list:ready');
```

| Mark | When |
| ---- | ---- |
| `nav:*:start` | User navigation intent (link, programmatic) |
| `nav:*:ready` | Primary content visible + interactive (skeleton → real or empty state) |

Export to RUM vendor via binding wrapper. Gate releases on p75 `route:*` for top N routes.

## Lighthouse CI

When lab runs authenticated flows with marks, assert:

`user-timings:route:user-list:upper`

(Exact assertion keys follow Lighthouse CI docs for measured name.)

## Interaction vs navigation

- **Full page load** — optimize LCP per [optimize-lcp](optimize-lcp.md).
- **In-app route** — optimize chunk download + suspense + data parallelization; measure `route-ready`.
- **Same route, new filter** — INP + debounce; avoid full list unmount.

## Prefetch (optional, binding-gated)

- Prefetch next-likely route chunk on hover/focus of nav item — only if binding allows and bandwidth policy ok.
- Do not prefetch every module — wastes mobile data.