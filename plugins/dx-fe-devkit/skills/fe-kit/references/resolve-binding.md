# Resolve binding

| Step | Location |
| ---- | -------- |
| 1 | Repo `AGENTS.md` |
| 2 | `.cursor/skills/project-binding.md` (monolith) **if present** — sections in [repo-binding-template](repo-binding-template.md) |
| 3 | `.cursor/skills/fe-architecture/references/project-binding.md` |
| 4 | `.cursor/skills/fe-naming/references/project-binding.md` |
| 5 | `.cursor/skills/dx-ui/references/project-binding.md` |
| 6 | Module `AGENTS.md` — wins for that product |

Monolith vs split: use one style per repo, not both duplicated.

Kit patterns stay in the plugin; **paths, commands, and component names** stay in git only.