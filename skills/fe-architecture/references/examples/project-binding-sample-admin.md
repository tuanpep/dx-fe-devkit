# sample-admin — path binding

Maps generic **fe-architecture** names to a sample Nx React admin app. Copy into the consumer repo and replace paths.

## Roots

| Binding            | Path                                                                                                                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| App source         | `apps/admin/src/`                                                                                                                                                                     |
| Module root        | `apps/admin/src/modules/<product>/`                                                                                                                                                   |
| Legacy (strangler) | `apps/admin/src/views/**`                                                                                                                                                             |
| Data-access lib    | `libs/data-access/admin`                                                                                                                                                              |
| UI lib             | `libs/ui-admin`                                                                                                                                                                       |
| Design system      | Module-scoped Mantine 8.x — binding [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md); host shell may retain `@acme-ui/*` defaults |

## Module Federation

- Single expose: `./Module` → `remote-entry.ts`
- Shell consumer loads `admin/./Module`
- Internal splitting via module `routing/` lazy — not per-feature MF exposes

## Reference module shapes

| Module                | Note                                                                                                          |
| --------------------- | ------------------------------------------------------------------------------------------------------------- |
| `performance-hub`     | Thin shell — target for new products                                                                          |
| `catalog-management`  | Rich module `ui/`/`data/` — Mantine visuals + [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md); structure via module AGENTS.md |

## Strangler

Legacy screens under `views/`. New product capabilities go to `modules/<product>/features/`, not new-only `views/` routes when a module exists.

## Internal imports (catalog)

Inside a feature, use relative paths to real files — do not route internal imports through `features/<slice>/index.ts` (catalog module rule).

## Review auditor — scan variables

Use these when running [review-auditor.md](../review-auditor.md) Phase 3 recipes:

| Variable         | Value                                                                                                             |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| `<APP_SRC>`      | `apps/admin/src/`                                                                                                 |
| `<MODULE_ROOT>`  | `apps/admin/src/modules/<product>/`                                                                               |
| `<HTTP_SYMBOLS>` | `httpClient\|BaseService`                                                                                         |
| `<RQ_SYMBOLS>`   | `useQuery\|useMutation\|@tanstack/react-query`                                                                    |
| `<ALLOWED_ROOT>` | `index.ts`, `keys.ts`, `crossSlice.ts` (`order-records`, `order-notes`; `keys` = Jest-safe codecs)                |

## Review overlays (module-specific)

Generic auditor rules apply everywhere. **Additional** checks for this sample:

| Module                      | Overlay                                                                                                                                                           |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `catalog-management`        | `apps/admin/src/modules/catalog-management/AGENTS.md`                                                                                                             |
| `order-records` (audit note)| `data/` + `domain/` aligned by entity (`attachments`, `create`, `documents`, `form`, `records`); cross-slice UI via `crossSlice.ts`, queries/types via `index.ts` |
| Other modules               | Root + module `AGENTS.md` if present; default feature root = `index.ts` only                                                                                      |

## Module UI package example (catalog)

Use [module-ui-component-packages.md](../module-ui-component-packages.md) for behavioral components such as async entity pickers, not to wrap or re-export Mantine primitives — see [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) § Anti-patterns. Feature public API boundaries remain in force.

## Verification commands (sample-admin)

| Step           | Command                                                                              |
| -------------- | ------------------------------------------------------------------------------------ |
| Lint           | `yarn nx run-many -t lint` or module script (e.g. `yarn lint:catalog-management`)    |
| Test (focused) | `yarn nx run admin:test --runInBand --runTestsByPath <file>`                         |
| Build (local)  | `yarn nx run admin:build --configuration=local`                                      |
| Dev smoke      | `yarn start` → port 4200; routes per module `AGENTS.md`                              |
