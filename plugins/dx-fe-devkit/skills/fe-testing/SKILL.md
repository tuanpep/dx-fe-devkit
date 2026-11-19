---
name: fe-testing
description: >-
  Enterprise React testing: test levels (static, unit, integration, E2E), Jest,
  React Testing Library, MSW, React Query in tests, forms/mutations, a11y
  (jest-axe when bound), Playwright scope and auth. Binding fe-testing.
  Use when adding *.spec.ts(x), choosing test depth, mocking HTTP, flaky CI,
  or verify-matrix requires colocated specs.
---

# FE testing

Portable skill (`plugins/dx-fe-devkit/skills`). **Commands and wrappers:** [repo-binding](../fe-kit/references/repo-binding-template.md#testing-fe-testing) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md).

**Architecture alignment:** specs colocate with `features/<slice>/` layers per `@fe-architecture`; behavior tests over implementation details.

## Principles

1. **Testing Trophy** — invest in integration tests with real providers + MSW; thin E2E; static (types/lint) as baseline ([test-levels](references/test-levels.md)).
2. **User-visible behavior** — query by role/label/name; interact with `@testing-library/user-event` ([jest-rtl](references/jest-rtl.md)).
3. **Mock at the network edge** — MSW handlers; do not mock `useQuery` / entire data layer ([msw](references/msw.md), [react-query-testing](references/react-query-testing.md)).
4. **Binding SSOT** — test command, wrapper, MSW path, E2E storage state, jest-axe flag.
5. **Stable CI** — `retry: false` on QueryClient in tests; `server.resetHandlers()`; no order-dependent suites ([flaky-and-ci](references/flaky-and-ci.md)).

## Read by task

| Situation | Read |
| --------- | ---- |
| What to test where (unit vs integration vs E2E) | [test-levels](references/test-levels.md) |
| RTL queries, user-event, async | [jest-rtl](references/jest-rtl.md) |
| Handlers, errors, dev+test parity | [msw](references/msw.md) |
| Provider wrapper, render helper | [test-utils-and-providers](references/test-utils-and-providers.md) |
| Loading, cache, mutations | [react-query-testing](references/react-query-testing.md) |
| Factories, fixtures | [fixtures-and-data-builders](references/fixtures-and-data-builders.md) |
| Create/edit/submit flows | [forms-and-mutations](references/forms-and-mutations.md) |
| jest-axe, keyboard/a11y smoke | [accessibility-testing](references/accessibility-testing.md) |
| File placement, test names | [colocation-and-naming](references/colocation-and-naming.md) |
| Playwright scope, auth setup | [e2e-scope](references/e2e-scope.md) |
| Flakes, timing, CI | [flaky-and-ci](references/flaky-and-ci.md) |

## Workflow

```
Resolve binding → pick level (test-levels) → colocate spec →
use render helper + MSW → assert user-observable outcomes →
binding test command (Nx path from project-binding)
```

| Step | Action |
| ---- | ------ |
| 0 | Binding: `test` command, `render` helper path, MSW init |
| 1 | Choose level — default **integration** for pages; **unit** for `domain/` pure rules |
| 2 | Add/update handlers to match **API types** |
| 3 | Write failing test → implement → [verify-matrix](../fe-kit/references/verify-matrix.md) |
| 4 | E2E only when matrix or product risk requires ([e2e-scope](references/e2e-scope.md)) |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Spec file names | `@fe-naming` |
| Query hooks live in `data/` | `@fe-architecture` [server-state](../fe-architecture/references/server-state.md) |
| Submit/pending/disabled submit | `@fe-forms` + [forms-validation-ux](../dx-ui/references/forms-validation-ux.md) |
| Permission-denied UI | `@dx-ui` [permissions-ux](../dx-ui/references/permissions-ux.md) |
| Security HTML cases | `@fe-security` [xss-and-html](../fe-security/references/xss-and-html.md) (optional RTL) |
| Focused Nx test | `@fe-architecture` [nx-and-mf](../fe-architecture/references/nx-and-mf.md) |

## Out of scope

Load/perf testing (see `@fe-performance`), backend contract testing owned by API teams, visual regression unless binding defines it, mobile native.

## External SSOT

| Topic | Link |
| ----- | ---- |
| RTL queries | [Testing Library priority](https://testing-library.com/docs/queries/about/#priority) |
| user-event | [async APIs](https://testing-library.com/docs/user-event/intro) |
| MSW | [MSW docs](https://mswjs.io/docs/) |
| Testing Trophy | [Kent C. Dodds](https://kentcdodds.com/blog/static-vs-unit-vs-integration-vs-e2e-tests) |
| Playwright auth | [storageState setup](https://playwright.dev/docs/auth) |