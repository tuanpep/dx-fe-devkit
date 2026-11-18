# Server state (React Query)

Rules for `features/<slice>/data/`. UI in `ui/`.

## Ownership

| Concern | Owner |
| ------- | ----- |
| HTTP | `api/` |
| Key factory | `data/queryKeys.ts` |
| `queryOptions` + `queryFn` | `data/queries.ts` |
| Hooks | `data/queries.ts` / `mutations.ts` |

**TkDodo:** every `queryFn` variable in `queryKey`.

## Invalidation

Hierarchy `all` → `lists` → `list(filters)` → `detail(id)`. Invalidate narrowest truthful scope after mutations.

## Anti-patterns

- Server rows in `useState` / global client store as source of truth.
- Non-trivial `useQuery` in `*Page.tsx`.
- Keys missing debounced filters.

## Pagination / filters

When filters change, avoid showing stale rows from previous filter — module `AGENTS.md` may define `placeholderData` policy. Page/index paging may use keep-previous-page for size changes only.

## State taxonomy

| Kind | Owner |
| ---- | ----- |
| Server entities | Query layer in `data/` |
| Form draft | Form library in `ui/` (repo convention) |
| Ephemeral UI | Local state in `ui/` |
| Session | App shell / auth provider |
