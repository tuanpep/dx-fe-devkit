# Parse and validate

URL query strings are **user-controlled**. Always decode → validate → default.

## Pipeline

```
raw URLSearchParams / Record<string, unknown>
  → coerce types (string → number/boolean/date)
  → Zod (or binding schema)
  → typed *Search state with defaults
```

## Schema rules

- **Defaults for omissions** — missing `page` → `1`; missing `sort` → binding default.
- **Clamp** — `page >= 1`, `pageSize` in allowlist from binding.
- **Strip unknown keys** — `.strict()` or explicit pick; never spread raw params into API calls.
- **Arrays** — repeated keys `tag=a&tag=b` vs comma-separated: pick **one** convention per repo in binding.
- **Dates** — ISO date strings only; reject invalid; timezone per binding (`fe-forms` date policy).
- **Enums** — `z.enum([...])` for sort direction, status filters aligned with API.

## Example (illustration)

```typescript
import { z } from 'zod';

const orderListSearchSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  pageSize: z.coerce.number().int().refine((n) => [10, 25, 50].includes(n)).default(25),
  q: z.string().max(200).default(''),
  sort: z.enum(['createdAt', 'amount']).default('createdAt'),
  dir: z.enum(['asc', 'desc']).default('desc'),
  status: z.enum(['open', 'closed', 'all']).default('all'),
});

export type OrderListSearch = z.infer<typeof orderListSearchSchema>;

export function parseOrderListSearch(
  input: Record<string, unknown>,
): OrderListSearch {
  return orderListSearchSchema.parse(input);
}
```

Use `safeParse` when you need a fallback screen + toast instead of throw (product choice).

## Serialization

Symmetric **parse** + **serialize** functions in `domain/` keep tests and share-link helpers consistent. Do not hand-build query strings in multiple components.

## TanStack Router

Prefer route-level `validateSearch` when binding uses TanStack Router — same schema, framework-owned navigation ([router-adapters](router-adapters.md)).