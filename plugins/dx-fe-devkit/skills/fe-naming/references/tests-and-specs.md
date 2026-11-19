# Tests & specs

Binding defines suffix — default in kit examples: **`*.spec.ts(x)`**.

## File names

| Subject | Spec file |
| ------- | --------- |
| `OrderRecordsPage.tsx` | `OrderRecordsPage.spec.tsx` |
| `orderTransitions.ts` | `orderTransitions.spec.ts` |
| `handlers.ts` | optional `handlers.spec.ts` |

Colocate in **same folder** as subject — [@fe-testing colocation](../../fe-testing/references/colocation-and-naming.md).

## `describe` / `it` names

| Level | Style |
| ----- | ----- |
| `describe` | Unit under test — component name or function name |
| `it` / `test` | **Behavior** in plain language — present tense |

```typescript
describe('OrderRecordsPage', () => {
  it('filters rows when status is Active', async () => { ... });
  it('shows forbidden message when API returns 403', async () => { ... });
});
```

Avoid: `it('works')`, `it('test 1')`, `it('should render correctly')` without specifics.

## Test data builders

- `buildOrder`, `buildUser` — verb `build` + entity ([fe-testing fixtures](../../fe-testing/references/fixtures-and-data-builders.md)).
- Not `mockOrder` unless it is literally a Jest mock.

## MSW / fixtures

- `handlers.ts`, `handlers.integrations.ts` per binding.
- `defaultHandlers` vs `orderHandlers` — plural for sets.

## Structured names (optional)

Google style allows `structured` test names with underscores in **test identifiers** only when binding uses structured Jest/Karma style — rare in RTL repos.