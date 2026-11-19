# Sync patterns (UI ↔ URL)

## One direction of truth

Pick one pattern per screen and document in the slice:

| Pattern | When |
| ------- | ---- |
| **URL-first** | URL updates drive `useMemo` parse → query; best for shareable lists |
| **Controlled bridge** | Local input state + debounced URL write; best for search boxes |

Avoid two writers (form internal state and URL) without an explicit sync effect.

## History: replace vs push

| User action | History |
| ----------- | ------- |
| Typing in search, dragging range, toggling filters | **replace** (no back-stack spam) |
| “Save this view”, named bookmark, major context change | **push** (optional) |
| Reset filters | **replace** to default query |

React Router: second arg `{ replace: true }` on `setSearchParams` ([docs](https://reactrouter.com/api/hooks/useSearchParams)).

## Debounce

Text search: debounce URL updates (binding `debounceMs`, often 200–400). Fetch layer can use the same debounced value so you do not refetch on every keypress.

## Functional updates

When updating multiple keys, use the functional form of the router setter so concurrent updates in one tick compose correctly (React Router callback form — note it does not queue like `setState`).

## React Query

After URL parse stabilizes:

```typescript
const filters = useOrderListSearch(); // from URL
const query = useOrderListQuery(filters);
```

Invalidate or refetch when **validated** filters change, not on every raw `searchParams` string twitch if parse output is unchanged (compare serialized filter object or use deep equality on small shapes).

## Clear / reset

“Clear filters” should set URL to **defaults** (minimal query or omit default keys per binding style) and reset any bridge state (search input value).

## Share links

Optional helper: `buildOrderListUrl(filters)` in `domain/` for “Copy link” actions — must use the same serializer as navigation.