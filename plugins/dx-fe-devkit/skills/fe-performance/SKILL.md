---
name: fe-performance
description: >-
  Enterprise React performance: Core Web Vitals (LCP, INP, CLS), bundle and
  Lighthouse budgets, SPA route-transition timing, table/chart lazy boundaries.
  Code splitting lives in fe-architecture. Resolves binding fe-performance
  (budget command, Lighthouse CI, image loader). Use when pages feel slow,
  CWV regress, bundle size grows, large tables or dashboards ship, or verify
  matrix points here.
---

# FE performance

Portable skill (`plugins/dx-fe-devkit/skills`). **Paths and CI commands:** [repo-binding](../fe-kit/references/repo-binding-template.md#performance-fe-performance) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md). **Chunk boundaries:** [fe-architecture code-splitting](../fe-architecture/references/code-splitting.md).

## Principles

1. **Measure first** — binding Lighthouse/budget/RUM before micro-optimizations ([measurement-workflow](references/measurement-workflow.md)).
2. **Target the bottleneck** — profile LCP subparts, INP interaction, or CLS shifts; do not blanket `memo` ([cwv-and-bundle](references/cwv-and-bundle.md)).
3. **Enterprise reality** — authenticated SPAs: CrUX is top-level navigation only; budget route transitions separately ([spa-rum-and-transitions](references/spa-rum-and-transitions.md)).
4. **Slice-friendly** — heavy deps behind route or in-page `lazy`; queries in `data/` per [fe-architecture](../fe-architecture/references/server-state.md).

## CWV thresholds (field, p75)

| Metric | Good | Poor | Enterprise focus |
| ------ | ---- | ---- | ---------------- |
| **LCP** | ≤ 2.5 s | > 4 s | Shell + first meaningful content in app chrome |
| **INP** | ≤ 200 ms | > 500 ms | Table filter, row open, modal open, bulk actions |
| **CLS** | ≤ 0.1 | > 0.25 | Skeletons, table pagination, async banners |

Source: [web.dev vitals](https://web.dev/articles/vitals). Segment **mobile and desktop**.

## Read by task

| Symptom or change | Read |
| ----------------- | ---- |
| Slow first paint / login shell | [optimize-lcp](references/optimize-lcp.md) |
| Laggy click / typing / filter | [optimize-inp](references/optimize-inp.md) |
| Content jumping / layout shift | [optimize-cls](references/optimize-cls.md) |
| Bundle grew / CI budget failed | [bundle-budgets](references/bundle-budgets.md) + [code-splitting](../fe-architecture/references/code-splitting.md) |
| Client nav feels slow (no full reload) | [spa-rum-and-transitions](references/spa-rum-and-transitions.md) |
| Large table / chart / editor screen | [enterprise-screens](references/enterprise-screens.md) |
| What to run in CI / locally | [measurement-workflow](references/measurement-workflow.md) |
| Quick metric cheat sheet | [cwv-and-bundle](references/cwv-and-bundle.md) |

## Workflow

```
Binding gates (budget / Lighthouse) → lab trace or RUM slice →
identify metric + screen → apply one reference doc → re-measure →
optional react-doctor --scope changed
```

| Step | Action |
| ---- | ------ |
| 0 | Resolve binding: budget command, Lighthouse config, image loader, RUM owner |
| 1 | Reproduce on **throttled** mobile lab (DevTools) or binding CI URL |
| 2 | Classify: LCP / INP / CLS / transfer size / custom route timing |
| 3 | Fix smallest change that moves the bottleneck (see task table) |
| 4 | `fe-kit` [verify-matrix](../fe-kit/references/verify-matrix.md): budget / Lighthouse if configured |
| 5 | Large UI change: `npx react-doctor@latest --verbose --scope changed` (bundle + perf rules) |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| `React.lazy` on `*Page`, MF | `@fe-architecture` |
| Virtualized table UX | `@dx-ui` [data-tables-density](../dx-ui/references/data-tables-density.md) |
| Query placement, stale rows | `@fe-architecture` [server-state](../fe-architecture/references/server-state.md) |
| Mantine tree-shaken imports | `@fe-mantine` |
| Deep LCP trace (MCP) | User skill `debug-optimize-lcp` + Chrome DevTools MCP ([external-catalog](../fe-kit/references/external-catalog.md)) |

## Out of scope

CDN/edge cache policy, backend TTFB tuning (coordinate with platform team), marketing/SEO landing pages, non-React stacks. Document handoffs in binding when TTFB dominates LCP.