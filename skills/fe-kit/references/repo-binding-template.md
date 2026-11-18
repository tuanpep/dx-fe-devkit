# Repo binding template

Copy to `.cursor/skills/project-binding.md` **or** split into the per-skill paths in [resolve-binding.md](resolve-binding.md). Fill only sections your repo needs.

## Architecture (`fe-architecture`)

| Field | Value |
| ----- | ----- |
| App source | |
| Module root | |
| Feature layers | `api/`, `data/`, `domain/`, `ui/` |
| Shared libs | |
| Legacy strangler | |
| Lazy routes | |
| MF expose / consumer | |
| Nx app project name | |
| lint / test / build commands | |
| HTTP client / API types package | |

Schema detail: [fe-architecture project-binding-schema](../../fe-architecture/references/project-binding-schema.md).

## Naming (`fe-naming`)

Test suffix, path patterns, API field naming — [fe-naming schema](../../fe-naming/references/project-binding-schema.md).

## UI stack (`dx-ui`)

Table/form/dialog components, tokens, verify — [dx-ui project-binding-template](../../dx-ui/references/project-binding-template.md).

## Testing (`fe-testing`)

| Field | Value |
| ----- | ----- |
| Test runner command | |
| E2E command (if any) | |
| Test wrapper / setup | |
| MSW location | |
| jest-axe | yes/no |

## i18n (`fe-i18n`)

| Field | Value |
| ----- | ----- |
| Library | |
| Locale file glob | |
| verify command | |
| RTL locales | |

## Forms (`fe-forms`)

| Field | Value |
| ----- | ----- |
| Form library | |
| Schema library | |
| Field wrapper components | |

## Security (`fe-security`)

Auth model, token storage, CSP owner, redirect allowlist, rich-text sanitizer.

## Performance (`fe-performance`)

Bundle budget command, Lighthouse CI, image loader.