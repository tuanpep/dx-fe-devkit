# Architecture and ownership

Per `@fe-architecture` vertical slice.

## Suggested files

| File | Responsibility |
| ---- | ---------------- |
| `domain/orderListSearch.ts` | Zod schema, `parse*`, `serialize*`, defaults |
| `data/useOrderListSearch.ts` | Binding hook: router adapter → typed search |
| `data/orderListQuery.ts` | `useOrderListQuery(filters)` — filters from URL parse |
| `ui/OrderListPage.tsx` | Layout; wires filters toolbar to hook |
| `ui/OrderListFilters.tsx` | Controlled inputs; calls URL update helpers |

Keep **router imports** inside `data/` (or a thin `data/url-state/` submodule), not scattered in presentational `ui/` components.

## Hook naming

- `useOrderListSearch()` — returns validated `OrderListSearch` + setters/clear
- Do not name `useSearchParams` wrappers after API endpoints

## Query keys

Include the same filter object used after validation:

```typescript
list: (filters: OrderListSearch) => [...orderKeys.lists(), filters] as const,
```

Strip cosmetic fields (e.g. raw `q` before debounce ends) only if binding documents dual-phase search; otherwise debounce before URL write so key and URL stay aligned.

## Multiple features on one route

Namespace keys: `?orders.sort=…&orders.page=…` vs flat keys — **one convention per product** in binding; never ad hoc per screen.

## Code splitting

List pages already lazy-loaded via `*Page` — URL hooks load with the feature chunk; no extra splitting required unless a heavy serializer is shared (keep in `domain/`).