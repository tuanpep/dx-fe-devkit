# MSW (network layer)

Single mock boundary for **dev and tests** when binding adopts it ([MSW](https://mswjs.io/docs/)).

## Placement

| Pattern | Location |
| ------- | -------- |
| Feature-owned endpoints | `features/<slice>/api/mocks.handlers.ts` or beside `api/` |
| Shared baseline | `mocks/handlers.ts` per binding |
| Browser dev | `msw/browser` worker in app bootstrap (binding flag) |

Handlers import **same path builders** as production client.

## Handler rules

- Response body satisfies **generated API types** — use factories ([fixtures-and-data-builders](fixtures-and-data-builders.md)).
- Status codes match product: 400 field errors, 403, 404, 500.
- Params and body assertions inside handler when testing caller contract:

```typescript
http.post('*/api/orders', async ({ request }) => {
  const body = await request.json();
  expect(body).toMatchObject({ status: 'ACTIVE' });
  return HttpResponse.json(buildOrder({ id: 'ORD-NEW' }), { status: 201 });
});
```

## Lifecycle (Node / Jest)

```typescript
const server = setupServer(...defaultHandlers);

beforeAll(() => server.listen({ onUnhandledRequest: 'error' }));
afterAll(() => server.close());
afterEach(() => server.resetHandlers());
```

| Option | Why |
| ------ | --- |
| `onUnhandledRequest: 'error'` | Catches missing handlers early |
| `resetHandlers()` | Per-test overrides via `server.use(...)` |

## Per-test overrides

```typescript
server.use(
  http.get('*/api/orders', () => HttpResponse.json([], { status: 200 })),
);
```

Restore via `resetHandlers()` — do not leak into next test.

## Scenarios to cover

| Scenario | Assert in UI |
| -------- | ------------ |
| Loading | Skeleton / progress accessible name |
| Empty list | Empty state copy |
| Field validation 400 | Errors on fields ([forms-and-mutations](forms-and-mutations.md)) |
| 403 | Permission message ([permissions-ux](../../dx-ui/references/permissions-ux.md)) |
| 500 | Recoverable error banner + retry if product has it |
| Mutation success | Invalidated list / toast / redirect per spec |

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| `jest.spyOn(global, 'fetch')` ad hoc | MSW |
| Hand-rolled JSON diverging from OpenAPI | Typed builders |
| Mocking `axios` instance | Handler at HTTP boundary |

## E2E

Integration tests use MSW; E2E hits real/staging API per binding — do not run MSW in production E2E unless binding documents mock env.