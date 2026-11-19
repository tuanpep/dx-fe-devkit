# External standards — convergent model (optional)

Short OSS alignment. App defaults: [oss-fe-matrix.md](oss-fe-matrix.md).

- **Thin composition root** — screens live outside bootstrap.
- **Feature = capability** — optional inner `api|domain|data|ui`.
- **Acyclic graph** — pick cross-feature policy:

| Policy | Rule |
| ------ | ---- |
| Strict | No feature → feature; compose in module |
| Public API (default) | `index.ts` only between slices |
| Facade | Narrow exports for hot shared aggregates |

- **Public API** — direct imports inside feature; barrel across only.
- **React Query** — keys include all `queryFn` inputs; hooks in `data/`.
- **PRs** — prefer layer order: api → data → domain → ui.

Links: [external-standards-sources.md](external-standards-sources.md), [standards-comparison.md](standards-comparison.md).
