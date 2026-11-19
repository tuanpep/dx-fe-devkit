---
name: fe-architecture
description: >-
  Enterprise modular React structure: app shell, product modules, feature vertical
  slices (api, data, domain, ui), public APIs, React Query placement, code
  splitting, Nx/MF, strangler from legacy. Mandatory anti-flatten. Use when
  adding or moving files, new routes, queries, cross-feature imports, lib
  promotion, layer violations, or deep audits (review-auditor + refactoring
  playbook). Binding fe-architecture. Hub fe-kit.
---

# FE vertical slice architecture

Portable skill (`plugins/dx-fe-devkit/skills`). **Paths and commands:** [project-binding](references/project-binding.md) → repo file or [project-binding-schema](references/project-binding-schema.md) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md).

## Layer stack

| Level | Role |
| ----- | ---- |
| **App** | Route merge, providers, optional MF host — no feature workflows |
| **Module** | Product shell: `routing/`, nav, i18n, cross-feature `ui` / `data` |
| **Feature** | One business capability (`features/<slice>/`) |
| **Layer** | `api`, `data`, `domain`, `ui` inside the feature only |

Module shared UI: `ui/<role>/<kebab-package>/` — [module-ui-component-packages](references/module-ui-component-packages.md).

## Principles

1. **Capability-first** — folders name what the business does, not `hooks/` or `utils/` at feature root ([depth-and-anti-flatten](references/depth-and-anti-flatten.md)).
2. **Inward dependencies** — `ui → data → api`; `domain` pure; no upward imports ([mental-model](references/mental-model.md)).
3. **Server truth in `data/`** — queries/mutations own async server state ([server-state](references/server-state.md)).
4. **Public API gate** — cross-slice imports via feature `index.ts` only ([public-api](references/public-api.md)).
5. **URLs own chunks** — lazy concrete `ui/*Page`, not barrels ([code-splitting](references/code-splitting.md)).

## Workflows

### Default (new code)

```
Binding → depth-and-anti-flatten decision tree →
layer file → match neighbors → verify-matrix (build/test)
```

Detail: [agent-workflow](references/agent-workflow.md).

### Shallow review

[mental-model](references/mental-model.md) (ten rules) + [architectural-smells](references/architectural-smells.md).

### Deep audit / refactor

[review-auditor](references/review-auditor.md) (Phase **0b** depth) → [refactoring-playbook](references/refactoring-playbook.md); module overlays in repo binding.

## Read by task

| Change | Read |
| ------ | ---- |
| **This repo’s paths** | [project-binding](references/project-binding.md) |
| Onboarding / big picture | [mental-model](references/mental-model.md) |
| New file, hook, API, page | [depth-and-anti-flatten](references/depth-and-anti-flatten.md) **first** |
| Step-by-step agent paths | [agent-workflow](references/agent-workflow.md) |
| Feature layers | [layer-responsibilities](references/layer-responsibilities.md) |
| Tree, legacy, libs, routing | [layout](references/layout.md) |
| Module shell | [module-shell](references/module-shell.md) |
| Fat module `ui/` / split feature | [module-shell-ui-segmentation](references/module-shell-ui-segmentation.md) |
| Module `ui/<role>/` packages | [module-ui-component-packages](references/module-ui-component-packages.md) |
| Split / merge slices | [feature-boundaries](references/feature-boundaries.md) |
| Query / mutation / API errors | [server-state](references/server-state.md), [api-errors](references/api-errors.md) |
| Nx / Module Federation | [nx-and-mf](references/nx-and-mf.md) |
| Cross-feature export | [public-api](references/public-api.md) |
| Strangler, thin slice, exceptions | [decision-frameworks](references/decision-frameworks.md) |
| Lazy routes / chunks | [code-splitting](references/code-splitting.md) |
| Bulletproof / FSD / OSS mapping | [standards-comparison](references/standards-comparison.md), [oss-fe-matrix](references/oss-fe-matrix.md) |

## Module public surface

App imports each product module only from **`index.ts`** (routes + navigation).

## Terms

| Term | Meaning |
| ---- | ------- |
| **Anti-flatten** | Layers inside features; no tech dumps at feature root |
| **Public API** | Feature `index.ts` for cross-slice use |
| **Strangler** | Legacy `views/` → `modules/<product>/features/` |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Names & paths | `@fe-naming` |
| Forms in `ui/` | `@fe-forms` |
| Tests / MSW | `@fe-testing` |
| Screen UX templates | `@dx-ui` |
| Bundle / lazy perf | `@fe-performance` |
| Verify gates | `@fe-kit` [verify-matrix](../fe-kit/references/verify-matrix.md) |

## Out of scope

Backend service architecture, full DDD tactical patterns, mandating global FSD `entities/` layer, choosing monolith vs microservices. Next.js App Router layout policy lives in binding [stack-profiles](../fe-kit/references/stack-profiles.md).

## External SSOT

| Topic | Link |
| ----- | ---- |
| Feature folders + public API | [Bulletproof React structure](https://github.com/alan2207/bulletproof-react/blob/master/docs/project-structure.md) |
| Layers & import rule | [Feature-Sliced Design](https://feature-sliced.design/docs/get-started/overview) |
| Query keys | [TkDodo — Effective React Query](https://tkdodo.eu/blog/) (patterns in server-state doc) |
| Kit citations | [external-standards-sources](references/external-standards-sources.md) |