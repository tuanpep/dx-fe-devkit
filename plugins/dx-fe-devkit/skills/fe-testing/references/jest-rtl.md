# Jest + React Testing Library

Prioritize queries: **role → label → placeholder → text → testId** ([RTL priority](https://testing-library.com/docs/queries/about/#priority)). `data-testid` only when product cannot expose accessible names.

## Setup

- Import `render` from binding **test-utils** — never raw `render` from RTL without providers ([test-utils-and-providers](test-utils-and-providers.md)).
- `user-event` v14+: **await** all interactions.

```typescript
import userEvent from '@testing-library/user-event';
import { render, screen } from '<binding-test-utils>';
import { setupServer } from 'msw/node';
import { handlers } from '<binding-msw>';

const server = setupServer(...handlers);
beforeAll(() => server.listen({ onUnhandledRequest: 'error' }));
afterAll(() => server.close());
afterEach(() => server.resetHandlers());

test('filters list by status', async () => {
  const user = userEvent.setup();
  await render(<OrderListPage />, { route: '/orders' });

  await user.click(screen.getByRole('combobox', { name: /status/i }));
  await user.click(screen.getByRole('option', { name: /active/i }));

  expect(await screen.findByRole('cell', { name: /ORD-1001/i })).toBeInTheDocument();
});
```

Pattern only — paths from binding.

## Async

| Tool | Use |
| ---- | --- |
| `findBy*` | Element appears after fetch |
| `waitFor` | Composite assertions |
| `waitForElementToBeRemoved` | Loading spinner gone |

Avoid empty `waitFor` without assertion inside.

## Queries

| Prefer | Avoid |
| ------ | ----- |
| `getByRole('button', { name: /save/i })` | `container.querySelector('.btn-primary')` |
| `getByLabelText` for fields | `getByTestId` for every input |
| `within(table)` for row actions | Index-based `getAllByRole(...)[3]` |

## Timers

- `jest.useFakeTimers()` only for debounce/throttle/**explicit** time logic.
- Always restore real timers in `afterEach`.
- Do not fake timers for React Query polling unless documented.

## What not to test

- Internal hook return values without UI effect.
- Module-private functions — test via public UI or export through `domain/`.
- Third-party component library internals.

## Assertions

- Visible text, ARIA states (`aria-invalid`, `aria-busy`), disabled buttons during pending.
- URL/router state only when user cares (breadcrumb, active nav) — use binding router helper.