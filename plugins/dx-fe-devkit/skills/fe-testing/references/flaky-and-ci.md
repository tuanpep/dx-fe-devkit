# Flakes & CI

## Common flake sources

| Cause | Fix |
| ----- | --- |
| Query retry in tests | `retry: false` on test QueryClient |
| Unhandled fetch | MSW `onUnhandledRequest: 'error'` |
| Leaked handlers | `server.resetHandlers()` |
| Shared mutable state | New QueryClient or `clear()` per test |
| `waitFor` without condition | Assert specific element |
| Real timers + debounce | `userEvent` + `findBy` or controlled fake timers |
| Parallel E2E same user | Per-worker accounts ([e2e-scope](e2e-scope.md)) |

## Order independence

- No `test.only` in commits.
- No depend-on-previous-test ordering.
- Avoid global `beforeAll` that mutates shared DB without per-test cleanup.

## CI commands

Use binding only:

```text
nx affected -t lint,test
# or
yarn nx run admin:test --runInBand
```

`--runInBand` when binding documents Jest worker issues with MSW or native modules.

## Coverage

Follow binding threshold — do not chase 100% on `ui/` presentational wrappers.

## Debugging locally

1. Run single file with `--runTestsByPath`.
2. Repeat with `--runInBand` if passes alone, fails in suite → shared state.
3. MSW log: temporary `onUnhandledRequest: 'warn'` — revert before merge.

## When to skip tests

`test.skip` only with ticket link and binding policy — prefer `it.each` disabled via `describe.skip` for whole unimplemented slice.