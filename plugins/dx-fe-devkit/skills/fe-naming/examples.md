# Naming examples

More rules: [references/identifiers-typescript-react.md](references/identifiers-typescript-react.md), [anti-patterns.md](references/anti-patterns.md).

## TypeScript / React

```typescript
// bad
const ec = 0;
function pui(i: string) { /* ... */ }

// good
const errorCount = 0;
function processUserInput(input: string) { /* ... */ }
```

```tsx
// bad — JSX instance in PascalCase
const ReservationItem = <ReservationCard />;

// good
const reservationItem = <ReservationCard />;
```

## Meaningful distinction

```typescript
// bad
function copyMessage(msg1: Message, msg2: Message) { ... }

// good
function copyMessage(destination: Message, source: Message) { ... }
```

## Query keys

```typescript
// bad — id not in key
queryKey: ['orders', 'detail'],
queryFn: () => fetchOrder(orderId),

// good
queryKey: orderKeys.detail(orderId),
queryFn: () => fetchOrder(orderId),
```

## Paths (sample-admin style)

```text
apps/admin/src/modules/catalog-management/
  features/order-records/
    ui/list/OrderRecordsPage.tsx
    ui/list/OrderRecordsPage.spec.ts
    domain/create/batchCreate.spec.ts
    data/orderKeys.ts
    data/queries.ts
```

## i18n

```typescript
// bad
t('Click here to save the order');

// good
t('catalog.orderRecords.form.actions.save');
```