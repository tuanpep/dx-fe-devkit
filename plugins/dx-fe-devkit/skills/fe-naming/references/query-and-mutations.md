# Query keys & data hooks

TkDodo-style keys per [server-state](../../fe-architecture/references/server-state.md).

## Factory file

- `data/queryKeys.ts` or `data/<entity>/queryKeys.ts`
- Export **object** or factory functions — one naming style per module:

```typescript
export const orderKeys = {
  all: ['orders'] as const,
  lists: () => [...orderKeys.all, 'list'] as const,
  list: (filters: OrderListFilters) => [...orderKeys.lists(), filters] as const,
  details: () => [...orderKeys.all, 'detail'] as const,
  detail: (id: string) => [...orderKeys.details(), id] as const,
};
```

## Key segments

| Segment | Style |
| ------- | ----- |
| Root | Plural domain noun `orders`, `contracts` |
| Scope | `'list'`, `'detail'`, `'infinite'` |
| Params | Serialize filters object — stable sort if binding requires |

Every `queryFn` variable part must appear in `queryKey`.

## Hook names

| Hook | File |
| ---- | ---- |
| `useOrderListQuery(filters)` | `queries.ts` |
| `useOrderQuery(id)` | `queries.ts` |
| `useCreateOrderMutation()` | `mutations.ts` |

Not `getOrders` hook — reserve `get` for non-hook fetch if used.

## Options helpers

- `orderListQueryOptions(filters)` — when colocating `queryOptions` for loaders/router.
- Suffix `QueryOptions` / `MutationOptions` for shared option builders.

## Invalidation helpers

- `invalidateOrderList(queryClient)` in `data/` if repeated — verb `invalidate` + scope.