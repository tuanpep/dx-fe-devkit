# Fixtures & data builders

Factories keep MSW and tests aligned with **API types** — not divergent hand-written JSON.

## Pattern

```typescript
import type { OrderDto } from '@binding-api-types';

export function buildOrder(overrides?: Partial<OrderDto>): OrderDto {
  return {
    id: 'ORD-1',
    status: 'ACTIVE',
    createdAt: '2026-01-15T10:00:00Z',
  ...overrides,
  };
}
```

| Rule | Detail |
| ---- | ------ |
| Defaults valid | Happy-path object passes zod/OpenAPI shape |
| Overrides explicit | `buildOrder({ status: 'CLOSED' })` for filter tests |
| IDs unique when parallel | `ORD-${n}` in factories used across tests |

## Location

| Scope | Path |
| ----- | ---- |
| Feature DTO | `features/<slice>/api/mocks.builders.ts` or `domain/test/builders.ts` |
| Shared personas | `test/builders/` per binding |

Share builders between MSW handlers and assertions (`expect(screen.getByText(order.reference))`).

## Lists & pagination

- `buildOrderList(count)` for table virtualization smoke
- Paginated envelope matches API: `{ items, total, page }`

## Auth persona

Binding `buildUser({ roles: ['ADMIN'] })` + MSW `/me` — UI permission tests without mocking hooks.

## Fake data libs

`@faker-js/faker` or binding equivalent — seed in CI if binding requires deterministic tests.

## Anti-patterns

- Giant fixture JSON files copied from prod (PII risk).
- Builders with optional fields always `undefined` — breaks strict types.
- Different shapes in handler vs test assertion.