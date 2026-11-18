# Public API and imports

## Rules

| Consumer | Import |
| -------- | ------ |
| Same feature | Direct file paths — not own barrel |
| Sister feature / module shell | Owning `index.ts` only |
| Route `lazy()` | Concrete `ui/*Page` — **never** barrel |
| App | Module `index.ts` only |

## Export from `index.ts`

Query key factories, shared hooks, domain types, legal helpers, small shared UI when owner is clear.

**Do not** default-export pages. **Do not** re-export entire `ui/` trees.

## Fat barrels

Split exports by concern (types vs hooks vs light UI) when one barrel pulls heavy graphs.

Policies between slices: [feature-boundaries.md](feature-boundaries.md). Smells: [architectural-smells.md](architectural-smells.md).

Direct imports **inside** a feature; barrel **across** slices only ([external-standards-convergence.md](external-standards-convergence.md)).
