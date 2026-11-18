---
name: fe-architecture
description: >-
  Guides frontend structure for modular React apps: thin app shell, product
  module boundary, and feature vertical slices (api, data, domain, ui). Use when
  adding or moving module/feature files, creating lazy routes, promoting libs,
  reviewing layer violations, code splitting, or React Query placement. Module
  shared UI: role folders plus component packages under ui/<role>/<kebab>/. For
  deep audits run references/review-auditor.md and refactoring-playbook.md.
  Resolve paths via references/project-binding.md (repo) or project-binding-schema.
  Mandatory: depth-and-anti-flatten. Hub: fe-kit.
---

# FE vertical slice architecture

Portable skill (user Agent Store / `~/.cursor/skills`). Patterns are repo-agnostic; **paths and commands:** resolve [project-binding](references/project-binding.md) then [project-binding-schema](references/project-binding-schema.md). Entry hub: `@fe-kit`.

## Layer stack

| Level       | Role                                                                  |
| ----------- | --------------------------------------------------------------------- |
| **App**     | Route merge, providers, optional MF remote — no feature workflows     |
| **Module**  | Product shell: routing, nav, i18n, cross-feature `ui`/`shared`/`data` |
| **Feature** | One business capability                                               |
| **Layer**   | `api`, `data`, `domain`, `ui` inside the feature only                 |

## Read by task

| Change                                | Read                                                                                                                                                                                                 |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **This repo’s paths**                 | [project-binding](references/project-binding.md)                                                                                                                                                     |
| Onboarding                            | [mental-model](references/mental-model.md)                                                                                                                                                           |
| New file, hook, API, page             | [depth-and-anti-flatten](references/depth-and-anti-flatten.md) **first**                                                                                                                             |
| Feature layers                        | [layer-responsibilities](references/layer-responsibilities.md)                                                                                                                                       |
| Tree, legacy, libs, routing/i18n      | [layout](references/layout.md)                                                                                                                                                                       |
| Module shell                          | [module-shell](references/module-shell.md)                                                                                                                                                           |
| Fat module `ui/` / split feature      | [module-shell-ui-segmentation](references/module-shell-ui-segmentation.md)                                                                                                                           |
| Module `ui/<role>/` primitive cluster | [module-ui-component-packages](references/module-ui-component-packages.md)                                                                                                                           |
| Query / mutation / API types          | [server-state](references/server-state.md), [api-errors](references/api-errors.md)                                                                                                                 |
| Nx commands / Module Federation       | [nx-and-mf](references/nx-and-mf.md)                                                                                                                                                                 |
| Cross-feature export                  | [public-api](references/public-api.md)                                                                                                                                                               |
| Strangler, thin feature, exceptions   | [decision-frameworks](references/decision-frameworks.md)                                                                                                                                             |
| Lazy routes / chunks                  | [code-splitting](references/code-splitting.md)                                                                                                                                                       |
| Shallow review                        | [mental-model](references/mental-model.md) (ten rules) + [architectural-smells](references/architectural-smells.md)                                                                                  |
| **Deep audit / refactor plan**        | [review-auditor](references/review-auditor.md) (Phase **0b** layer depth) → [refactoring-playbook](references/refactoring-playbook.md); overlays in [project-binding](references/project-binding.md) |
| OSS mapping (optional)                | [oss-fe-matrix](references/oss-fe-matrix.md)                                                                                                                                                         |

## Module public surface

App imports each product module only from **`index.ts`** (routes + navigation).

## Terms

| Term             | Meaning                                                                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **Anti-flatten** | `api/data/domain/ui` inside features; module `ui/<role>/<package>/` for shared primitives — no tech dumps at feature or role root |
| **Public API**   | Feature `index.ts` for cross-slice use only                                                                                       |
| **Strangler**    | Legacy `views/` → `modules/<product>/features/`                                                                                   |
