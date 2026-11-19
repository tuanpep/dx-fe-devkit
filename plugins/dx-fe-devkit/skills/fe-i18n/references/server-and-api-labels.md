# Server & API labels

[dx-ui locale-and-content](../../dx-ui/references/locale-and-content.md) § Domain terminology.

## Codes vs labels

| Source | UI |
| ------ | --- |
| API status code `ACTIVE` | `t('domain.order.status.ACTIVE')` or domain map |
| API returns localized label | Use when contract guarantees i18n — still verify fallback |
| API returns English-only label | Map code → key in `domain/`; do not spread English field as SSOT |

## Domain map pattern

```typescript
// domain/orderStatus.ts
export function orderStatusLabelKey(status: OrderStatus): string {
  return `catalog.orderRecords.domain.status.${status}`;
}
```

Keep enum values aligned with OpenAPI.

## Dynamic strings from API

- Error messages from server: display when safe; map known codes to keys for consistency.
- User names, titles: interpolate into `t('...', { name })` — never `dangerouslySetInnerHTML`.

## Glossary

Module `AGENTS.md` or binding lists terms that must not vary per translator without approval (legal entity names, product names).

## fe-architecture

Pure maps in `domain/`; hooks in `data/` if loading glossary from API.