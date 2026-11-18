# Stack profiles

Detect from `package.json` + binding. Skills apply regardless; **commands and imports** follow the profile.

| Profile | Signals | Architecture notes |
| ------- | ------- | ------------------- |
| **nx-mf-host** | `nx`, `@nx/*`, module federation config | App merges routes; remotes expose `./Module`; lazy inside module `routing/` |
| **nx-apps** | `nx`, no MF | Same slice layout; simpler deploy |
| **vite-spa** | `vite`, single `src/` | `features/` or `modules/` per binding |
| **next-app-router** | `next` ≥ 13 | Do not force `fe-architecture` folders into `app/` without binding; use route groups / colocation policy in binding |
| **mantine-product** | `@mantine/core` | `@fe-mantine` + dx-ui binding for tables/forms |
| **antd-product** | `antd` | dx-ui binding maps patterns to Ant components |
| **design-system-package** | `@org/ui-*` | Map in dx-ui `project-binding.md`; fe-architecture module `ui/<role>/` for module-only primitives |

## Version discipline

Read installed versions from the repo lockfile/`package.json`. Global skills are **pattern** SSOT; MCP/docs must match pinned major versions in binding.