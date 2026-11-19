# Accessibility testing

Design rules: `@dx-ui`. Automated checks supplement — do not replace — manual keyboard review.

## jest-axe (when binding `jest-axe: yes`)

```typescript
import { axe, toHaveNoViolations } from 'jest-axe';

expect.extend(toHaveNoViolations);

test('order list has no a11y violations', async () => {
  const { container } = await render(<OrderListPage />, { route: '/orders' });
  await screen.findByRole('table');
  expect(await axe(container)).toHaveNoViolations();
});
```

| Scope | Guidance |
| ----- | -------- |
| Page integration | Run after primary content loaded |
| Modal | `axe` on `document.body` or dialog node after open |
| Known third-party violations | Document in binding allowlist — narrow scope |

Fix **critical** violations before merge when binding gates on axe.

## RTL as a11y practice

- Prefer role queries — tests fail when accessible name missing.
- `getByRole('button', { name })` encodes label contract.

## Keyboard smoke (integration)

- Tab to primary action; Enter activates.
- Table: binding documents focus target for scroll region ([data-tables-density](../../dx-ui/references/data-tables-density.md)).

## E2E a11y

Optional `@axe-core/playwright` in smoke suite when binding enables — keep separate from full scan every test for speed.

## Out of scope

Full VPAT / manual audit — coordinate with accessibility team; skill covers dev test hooks only.