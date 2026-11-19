# Test utils & providers

Binding exports a single **`render`** (and optional `renderHook`) that mirrors app shell providers.

## Typical wrapper stack

| Provider | Notes |
| -------- | ----- |
| `QueryClientProvider` | Test client config ([react-query-testing](react-query-testing.md)) |
| i18n | Real messages or minimal `en` fixture per binding |
| Theme / Mantine / Ant | Same as production root |
| Router | `MemoryRouter` with `initialEntries` from options |
| Auth | Stub session or MSW `/me` |

```typescript
type RenderOptions = {
  route?: string;
  queryClient?: QueryClient;
  locale?: string;
};

export async function render(ui: React.ReactElement, options?: RenderOptions) {
  const client = options?.queryClient ?? createTestQueryClient();
  // wrap ui — match app/providers.tsx from binding
}
```

Illustrative — **copy pattern from binding file**, do not invent provider order.

## `renderHook`

For hooks in `data/` when UI test is awkward — still use QueryClient + MSW, not mocked query hooks.

Prefer page integration when hook exists to serve one screen.

## Global setup

Binding `jest-setup` may include:

- `@testing-library/jest-dom`
- `matchMedia`, `ResizeObserver` mocks
- MSW `beforeAll` if centralized
- `i18n` silent missing keys policy for tests

## MSW in browser tests

Rare — only when binding runs component tests in jsdom with `setupServer` (node). Storybook + MSW is dev concern unless binding tests stories.

## Nx

Run focused specs per binding:

```bash
nx run <app>:test --runInBand --runTestsByPath path/to/file.spec.tsx
```

From [nx-and-mf](../../fe-architecture/references/nx-and-mf.md).