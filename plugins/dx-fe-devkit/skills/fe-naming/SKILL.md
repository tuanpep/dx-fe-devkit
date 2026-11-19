---
name: fe-naming
description: >-
  Enterprise React/TS naming: identifiers, files, folders, hooks, tests, API
  fields, query keys, i18n keys. Resolves fe-naming project-binding before
  Google/Airbnb/Clean Code defaults. Use when naming or renaming symbols,
  creating paths in vertical slices, reviewing unclear names, or linter has no
  rule.
---

# FE naming

Portable skill (`plugins/dx-fe-devkit/skills`). **Repo SSOT:** [project-binding](references/project-binding.md) → consumer `.cursor/skills/fe-naming/references/project-binding.md` ([schema](references/project-binding-schema.md)). **Layout context:** `@fe-architecture`. Hub: `@fe-kit`.

## Priority order

1. **Active repo** — `project-binding`, module `AGENTS.md`, ESLint, 3–5 neighbors in same folder.
2. **This kit** — reference docs below when binding silent.
3. **External guides** — [reference.md](reference.md) (Google TS, Airbnb React, Clean Code).

**Repo wins** over generic rules.

## Principles (Clean Code, condensed)

| Principle | Rule |
| --------- | ---- |
| Intent | Names explain *why*, not *how* — no `data2`, `temp` |
| Distinction | `source` / `destination`, not `msg1` / `msg2` |
| Searchable | Named constants for magic values |
| No type encoding | `name`, not `strName` — types carry types |
| One concept | Pick `fetch` *or* `get` module-wide |
| Scope vs length | Single letter only in ≤10-line locals |
| Layer nouns | Match `api` / `data` / `domain` / `ui` — not random `Manager` |

## Read by task

| Task | Read |
| ---- | ---- |
| Variables, types, functions, constants | [identifiers-typescript-react](references/identifiers-typescript-react.md) |
| Pages, features, module paths | [files-and-folders](references/files-and-folders.md) |
| Components, props, hooks | [hooks-and-components](references/hooks-and-components.md) |
| `*.spec.ts(x)`, test names | [tests-and-specs](references/tests-and-specs.md) |
| DTOs, OpenAPI fields, mappers | [api-and-domain-types](references/api-and-domain-types.md) |
| `queryKeys`, hooks in `data/` | [query-and-mutations](references/query-and-mutations.md) |
| Translation key paths | [i18n-keys](references/i18n-keys.md) |
| Rename PR, review output | [review-workflow](references/review-workflow.md) |
| Smells, banned roots | [anti-patterns](references/anti-patterns.md) |
| Java/Python/Go, debates | [reference.md](reference.md) |
| Before/after | [examples.md](examples.md) |

## Quick workflow

```
Binding → neighbors → pick reference doc →
checklist (review-workflow) → lint if bound
```

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Where files go | `@fe-architecture` [depth-and-anti-flatten](../fe-architecture/references/depth-and-anti-flatten.md) |
| Colocated tests | `@fe-testing` [colocation-and-naming](../fe-testing/references/colocation-and-naming.md) |
| Form field / schema names | `@fe-forms` [architecture-and-ownership](../fe-forms/references/architecture-and-ownership.md) |
| Copy (not key structure) | `@dx-ui` [microcopy-voice](../dx-ui/references/microcopy-voice.md) |

## Out of scope

Product marketing names, git branch policy ([`@fe-git-workflow`](../fe-git-workflow/SKILL.md)), database column renames in applied migrations ([reference.md](reference.md)).

## External SSOT

| Source | Link |
| ------ | ---- |
| Google TypeScript | https://google.github.io/styleguide/tsguide.html |
| Airbnb React | https://github.com/airbnb/javascript/blob/master/react/README.md |