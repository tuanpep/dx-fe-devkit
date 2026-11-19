# Project binding schema (`fe-naming`)

Repository file: `.cursor/skills/fe-naming/references/project-binding.md` (or split path in [resolve-binding](../../fe-kit/references/resolve-binding.md)).

## Required fields

| Section | Content |
| ------- | ------- |
| **Layout** | Module root, feature folder pattern, layer names |
| **Files** | Component file casing (Pascal vs kebab); util file pattern |
| **Tests** | Suffix `*.spec.ts(x)` vs `*.test.*`; colocation rule |
| **TypeScript** | Enum member casing; constant prefix; `Observable$` yes/no |
| **API fields** | camelCase vs snake_case; generated package name |
| **Hooks** | Allowed `use*` in `data/` vs `ui/` |
| **i18n** | Key namespace root; verify command |
| **Verification** | `nx lint`, naming-eslint rules |

## Optional fields

| Section | Content |
| ------- | ------- |
| **Legacy paths** | `views/` mapping during strangler |
| **Barrel policy** | When `index.ts` allowed |
| **Public exports** | Feature `index.ts` export names |
| **Nx project aliases** | Import path prefixes |

## Example

[fe-architecture sample-admin binding](../../fe-architecture/references/examples/project-binding-sample-admin.md) — architecture paths; copy naming rows into consumer `project-binding.md`.

Full kit template: [repo-binding-template](../../fe-kit/references/repo-binding-template.md#naming-fe-naming).