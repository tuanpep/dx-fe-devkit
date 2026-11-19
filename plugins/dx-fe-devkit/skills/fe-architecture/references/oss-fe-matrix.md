# OSS → vertical-slice mapping

Defaults unless module `AGENTS.md` overrides. Background: [external-standards-convergence.md](external-standards-convergence.md). Side-by-side: [standards-comparison.md](standards-comparison.md).

## Structure

| External | Vertical-slice pattern |
| -------- | ------------------------ |
| Thin app composes | App route table merges modules |
| Sibling isolation | Cross-slice via `index.ts` |
| Repository vs service | `api/` vs `domain/` + `data/` |
| Product slice | `modules/<product>/` + `features/*` |
| Direct imports inside slice | Barrel across slices only |
| Second consumer | Workspace lib |

## Data

| External | Pattern |
| -------- | ------- |
| Key = queryFn deps | `data/queryKeys.ts` |
| queryOptions | `data/queries.ts` |
| No server mirror in useState | `data/` owns entities |

## Delivery

| External | Pattern |
| -------- | ------- |
| Route = chunk entry | Lazy `ui/*Page` |
| Layer-ordered PRs | api → data → domain → ui |
