# API & domain types

**Rule:** Wire names follow **OpenAPI / generated client** — FE does not rename fields for “prettier” JSON.

## Layers

| Layer | Type names | Field names |
| ----- | ---------- | ------------- |
| `api/` response DTO | Generated `OrderDto` or imported | As API returns — usually camelCase or snake per contract |
| `domain/` | `Order`, `OrderStatus` | Domain language |
| Mapper | `mapOrderDtoToDomain` | Explicit in function name |

## Mappers

| Function | Direction |
| -------- | --------- |
| `mapOrderDtoToDomain(dto: OrderDto): Order` | API → domain |
| `mapOrderToCreatePayload(order: OrderDraft): CreateOrderRequest` | Form/domain → API |

One function per direction; avoid `convertOrder(data)` ambiguous blobs.

## Enums & status

- Align with API string unions when possible.
- UI labels via i18n — keys in [i18n-keys](i18n-keys.md), not hard-coded API enum strings in many places.

## Error payloads

- Mapper: `mapValidationErrors` — shared name across features when binding defines ([fe-forms server errors](../../fe-forms/references/server-errors.md)).
- Field keys in form match **form field names**, mapped from API in one place.

## Path / query params

- URL path segments: kebab or plural per API (`/order-records/:id`).
- Query keys camelCase in client when API uses camelCase — binding documents exceptions.

## Anti-pattern

```typescript
// bad — parallel field names
type OrderView = { orderNumber: string }; // API uses `referenceNo`
```

Use generated types or shared package SSOT.