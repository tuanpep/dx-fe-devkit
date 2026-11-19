# TypeScript & React identifiers

Google TS + Airbnb React defaults unless [project-binding](project-binding.md) overrides.

## Casing table

| Identifier | Style | Example |
| ---------- | ----- | ------- |
| Class, interface, type, enum | PascalCase | `OrderStatus`, `CreateOrderPayload` |
| React component function | PascalCase | `OrderRecordsPage` |
| Function, method, variable, param | camelCase | `mapOrderToDto`, `customerId` |
| Module / global constant | SCREAMING_SNAKE | `MAX_PAGE_SIZE` |
| Enum members | Per binding — SCREAMING_SNAKE or PascalCase |
| React hook | camelCase + `use` | `useOrderListQuery` |
| Generic type param | `T` or descriptive `TOrder` | `ListState<TItem>` |
| JSX variable holding element | camelCase | `const listPanel = <OrderTable />` |

## Booleans

| Prefix | Example |
| ------ | ------- |
| `is` | `isLoading`, `isExpired` |
| `has` | `hasPermission`, `hasNextPage` |
| `can` | `canSubmit`, `canArchive` |
| `should` | `shouldShowFilter` (sparingly) |

Props and handlers: **`on`** prefix — `onChange`, `onSubmit`, not `handleSubmit` as prop name.

## Verbs (functions)

| Action | Vocabulary |
| ------ | ---------- |
| HTTP read | `fetch*` or `get*` — one per module |
| HTTP write | `create*`, `update*`, `delete*`, `archive*` |
| Map/transform | `map*To*`, `to*Payload`, `parse*` |
| Guard | `is*`, `assert*`, `ensure*` |
| Pure rule | `validate*`, `getAllowed*` |

Avoid noun-only function names: `validation()` → `validateOrderDraft()`.

## Types vs values

| Kind | Naming |
| ---- | ------ |
| DTO / API wire | Match OpenAPI — often PascalCase types, camelCase JSON |
| Domain entity | Singular noun `Order`, `ContractLine` |
| Collection type | `Order[]` or `OrderList` — not `Orders` type unless domain term |
| Union of statuses | `OrderStatus` with members per binding |
| Props | `OrderTableProps` or `type OrderTableProps = { ... }` |

No `I` prefix on interfaces unless binding idiomatic.

## Collections & maps

| Shape | Name |
| ----- | ---- |
| Array of ids | `orderIds` |
| Record by id | `ordersById` |
| Map | `userIdToName` |

Not `orderList` and `orders` for different shapes in same feature without reason.

## Abbreviations

Allowed when domain-standard: `id`, `url`, `api`, `dto`, `ui`. Spell out project-specific acronyms once in types.

## Observable / stream (optional)

Some repos suffix observables with `$` — binding decides; be consistent in one module.

## ESLint

When skill and `@typescript-eslint/naming-convention` disagree, **fix toward linter**.