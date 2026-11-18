# Jest + RTL

- Wrap with repo providers (theme, i18n, QueryClient) via test helper from binding.
- Query by role/label; avoid `container.querySelector` unless no accessible name.
- `waitFor` async UI; fake timers only when testing debounce/time logic.
- Mock network at MSW layer for integration tests; avoid mocking entire `@tanstack/react-query`.