# Optimize LCP (enterprise React SPA)

Assumes client-rendered or shell + lazy feature routes. SSR/SSG: apply the same discoverability rules to HTML output.

## Goals

- User sees **meaningful chrome** quickly (header, title region, skeleton).
- LCP element is **discoverable early** (not behind extra async boundary without preload).

## Checklist

### Bootstrap / routing

- [ ] Initial entry only loads app shell + **current route** chunk ([code-splitting](../../fe-architecture/references/code-splitting.md)).
- [ ] No static import from shell → heavy feature (charts, editors, full icon packs).
- [ ] Default landing route audited in Lighthouse URL set.

### LCP element

- [ ] Identify LCP in lab (DevTools Performance or `debug-optimize-lcp` skill).
- [ ] If image: explicit `width`/`height` or aspect box; **no** `loading="lazy"` when in initial viewport.
- [ ] If image not in HTML: `fetchpriority="high"` and/or `<link rel="preload" as="image">`.
- [ ] If text: avoid invisible text while webfont loads — `font-display: swap` + metric-compatible fallback.

### Data path

- [ ] Critical queries use `queryOptions` in `data/`; prefer parallel fetch vs waterfall in `*Page` mount only.
- [ ] Skeleton matches final layout ([optimize-cls](optimize-cls.md)) so LCP does not shift when data arrives.

### Third party

- [ ] Defer non-critical scripts (chat, analytics) after `requestIdleCallback` or post-interactive — document in binding.

## Anti-patterns

| Pattern | Why |
| ------- | --- |
| Blank root until all providers + auth resolve | Pushes LCP to full JS execution |
| Full design-system barrel on `main` | Inflates first chunk |
| Carousel/hero loaded only after client fetch with no placeholder | Late LCP + CLS |

## Handoff

If **TTFB** dominates LCP subparts, escalate to platform/API — FE cannot fix with bundling alone.