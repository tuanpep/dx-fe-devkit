# CWV & bundle (quick reference)

Full workflows: [measurement-workflow](measurement-workflow.md). Thresholds and routing: [SKILL.md](../SKILL.md).

## Per-metric levers (SPA admin)

| Metric | Usually wins | Common mistakes |
| ------ | ------------ | ----------------- |
| **LCP** | Smaller initial route chunk; shell paints before feature data; sized hero/header media; preload discoverable LCP resource | Full UI kit on bootstrap; LCP image `loading="lazy"`; data-only LCP after waterfall |
| **INP** | Shorter sync work in handlers; `startTransition` for heavy UI updates; virtualize long lists; defer analytics off click path | Sync `JSON.parse` / filter huge arrays on every keystroke; modal opens that mount charts synchronously |
| **CLS** | Fixed row height / skeleton matching final layout; reserved image dimensions; stable table toolbar height | Empty → loaded table height change; async alerts pushing content; web font swap without fallback metrics |
| **Transfer** | Route + in-page `lazy`; per-component imports from design system; drop unused locales/polyfills | Static import of chart/editor on list pages; duplicate moment/date libs |

## LCP subparts (lab debugging)

| Subpart | Target share | If high |
| ------- | ------------ | ------- |
| TTFB | ~40% | Server/CDN (out of FE skill); minimize redirects |
| Resource load delay | < 10% | Preload / early `src`; remove lazy on above-fold LCP |
| Resource load duration | ~40% | Compress images; CDN cache |
| Element render delay | < 10% | Less render-blocking JS/CSS; break long tasks |

See [optimize-lcp](optimize-lcp.md). For MCP trace steps use user skill `debug-optimize-lcp`.

## Profiling before React micro-opts

| Signal | Tool |
| ------ | ---- |
| Long tasks / scripting | Performance panel, react-doctor `scan <url>` |
| Chunk attribution | Binding bundle analyzer / `source-map-explorer` |
| Field p75 | Binding RUM (CrUX, web-vitals library, observability vendor) |

**Avoid:** `useMemo` / `memo` on every child without evidence of wasted renders ([web.dev](https://web.dev/articles/optimize-inp)).

## Binding fields (typical)

Document in repo `project-binding`: `bundleBudgetCommand`, `lighthouseCiCommand`, `lighthouseUrls`, `imageLoader`, `rumDashboard`, `thirdPartyScriptOwner`. Never invent commands — [verify-matrix](../../fe-kit/references/verify-matrix.md).