# Naming examples

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

## sample-admin-style paths

```
apps/admin/src/modules/catalog-management/
  features/order-records/
    ui/list/OrderRecordsPage.tsx
    ui/list/OrderRecordsPage.spec.ts
    domain/create/batchCreate.spec.ts
  ui/display/numberInput.spec.ts
```

## Meaningful distinction

```typescript
// bad
function copyMessage(msg1: Message, msg2: Message) { ... }

// good
function copyMessage(destination: Message, source: Message) { ... }
```