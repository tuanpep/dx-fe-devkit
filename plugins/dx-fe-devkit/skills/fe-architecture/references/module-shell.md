# Module shell (product root)

Rules for `modules/<product>/` (or repo equivalent) between **app** and **features/<slice>/**.

## Role

Bounded context **shell**: compose features; do not implement an end-to-end workflow in the shell.

| Job | Location |
| --- | -------- |
| Public surface to app | `index.ts` — routes + navigation |
| URLs, authority, lazy pages | `routing/` |
| Module i18n | `translations/` |
| Cross-feature chrome | `ui/` (optional) |
| Pure helpers (no query layer) | `shared/` (optional) |
| Cross-feature cache helpers | `data/` (optional) |
| Product behavior | `features/*` |
| Contract | `AGENTS.md` (optional) |

```text
modules/<product>/
  index.ts
  routing/
  translations/
  features/
  ui/ | shared/ | data/    # optional
```

No `api/`, `domain/`, or business hooks at module root.

## Placement (module root file)

1. Screen/workflow → `features/<slice>/ui/` + `routing/`.
2. HTTP → `features/<slice>/api/`.
3. Pure rule → `features/<slice>/domain/` or `shared/` if ≥2 features, no single owner.
4. Query/hook → `features/<slice>/data/` or module `data/` for cross-feature invalidation.
5. UI for ≥2 features → `module/ui/`.
6. Pure TS → `shared/`.
7. ≥2 modules need it → workspace lib.

Large `ui/`, mega-features: [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md).

## Imports

| Consumer | May import |
| -------- | ---------- |
| App | `modules/<product>/index.ts` |
| `routing/` | Lazy `features/<slice>/ui/*Page` — not barrel |
| Module `ui`/`data` | Sister `features/<slice>/index.ts` only |
| Features | Module `ui`/`shared`/`data`, design-system, libs |

## New module checklist

1. `index.ts` exports routes + navigation.
2. `routing/` owns paths and lazy targets.
3. Wire i18n at app bootstrap if used.
4. Register module in app route table via `index.ts` only.
5. First capability under `features/<slice>/`.

## Related

- [layout.md](layout.md)
- [depth-and-anti-flatten.md](depth-and-anti-flatten.md)
- [public-api.md](public-api.md)
