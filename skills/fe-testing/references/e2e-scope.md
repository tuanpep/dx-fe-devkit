# E2E scope

Ship E2E for:

- Auth gate + redirect with return URL
- Primary create/submit flow
- List filter + row action that changes server state

Defer E2E for static pages coverable by component tests. Use binding for base URL, storage state, and CI command.