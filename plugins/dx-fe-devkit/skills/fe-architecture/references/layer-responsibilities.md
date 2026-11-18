# Layer responsibilities

Inside `features/<slice>/`. **Placement SSOT:** [depth-and-anti-flatten.md](depth-and-anti-flatten.md). No new files at feature root except `index.ts`.

## Anatomy

```text
features/<capability>/
  index.ts     optional — cross-slice / module shell only
  api/         HTTP, DTO map (no React)
  domain/      types, rules, transitions (no React, no fetch)
                 optional domain/<entity>/ when data/ or slice size warrants
  data/        queryKeys, queries, mutations, list state
                 often data/<entity>/ in large slices
  ui/          pages, tables, forms, screen hooks
```

| Layer | Job | Typical files |
| ----- | --- | --------------- |
| `api/` | Wire ↔ domain | `*Api.ts`, `map*.ts` |
| `domain/` | Truth, guards | `types.ts`, `actions.ts`, `status.ts` |
| `data/` | Server/async state | `queryKeys.ts`, `queries.ts`, `mutations.ts` |
| `ui/` | Render + compose | `*Page.tsx`, `*Table.tsx`, `use*Form.ts` |

**Import direction:** `ui` → `data` | `domain` → `api`. Never upward.

## `domain/`

Types, validators, legal actions, status guards. No React, no query library, no i18n in pure functions. UI asks “can user do X in state Y?” via helpers.

Large slices: prefer `domain/<entity>/` using the **same nouns** as `data/<entity>/` when that split exists ([depth-and-anti-flatten.md](depth-and-anti-flatten.md) § layer flat). Keep only cross-entity types/constants at `domain/` root or in `domain/shared/`.

## `api/`

HTTP client calls, DTO → domain maps. No React; no cache policy. **No business rules in mappers** — rules live in `domain/`.

## `data/`

See [server-state.md](server-state.md). Query keys, `queryOptions`, hooks. Every `queryFn` variable in `queryKey`.

## `ui/`

Pages, tables, dialogs. Composes `data/`; reads `domain/`. Screen-local hooks OK in `ui/use*.ts`. Form patterns: follow repo `AGENTS.md`.

## Backend-aligned apps

When a typed HTTP API exists:

```text
JSON on wire     →  api/
UI/legal guards  →  domain/
Orchestration    →  data/ + thin ui/
Screens          →  ui/
```

OpenAPI / backend docs are authority for transitions; `domain/actions` describes what UI **may offer**, not what the client assumes succeeds.

## Module-level `ui/` / `shared/` / `data/`

Only when **≥2 features** in the same module need the artifact — [module-shell.md](module-shell.md).

## Related

- [mental-model.md](mental-model.md)
- [oss-fe-matrix.md](oss-fe-matrix.md)
