# React Query in tests

Hooks live in `features/<slice>/data/` per [server-state](../../fe-architecture/references/server-state.md). Tests exercise hooks **through UI** or `renderHook` with real `QueryClient`.

## Test QueryClient

```typescript
export function createTestQueryClient() {
  return new QueryClient({
    defaultOptions: {
      queries: {
        retry: false,
        gcTime: Infinity,
        staleTime: Infinity,
      },
      mutations: { retry: false },
    },
  });
}
```

| Option | Why |
| ------ | --- |
| `retry: false` | Fast failure; no flake |
| `gcTime: Infinity` | Predictable cache between assertions in one test |

Call `queryClient.clear()` in `afterEach` when tests share client instance.

## Do not mock

- `useQuery`, `useMutation`, `@tanstack/react-query` module
- Internal `queryFn` unless testing pure unit extracted from hook

MSW fulfills `queryFn` HTTP.

## Loading / error

```typescript
expect(screen.getByRole('status', { name: /loading/i })).toBeInTheDocument();
await screen.findByRole('heading', { name: /orders/i });
```

Use product loading semantics (skeleton, spinner label) from `dx-ui` feedback patterns.

## Mutations

1. Setup MSW POST/PATCH success or failure.
2. User submits form.
3. Assert disabled submit during pending ([forms-and-mutations](forms-and-mutations.md)).
4. Assert cache effect: row appears, toast, or list refetch — per product spec.

## Prefetch / invalidate

When mutation should invalidate keys — assert UI reflects new data after MSW returns updated list; optional spy on handler call count, not on `queryClient.invalidateQueries`.

## Devtools

Off in tests via provider defaults; never assert on devtools.