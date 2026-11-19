---
name: fe-forms
description: >-
  Enterprise React forms: binding library (RHF/Mantine/Ant), Zod schemas, create
  and edit flows, server field errors, submit pending, pickers, wizards. UX from
  dx-ui forms-validation-ux. Binding fe-forms. Use for create/edit pages, mutation
  forms, validation mapping, dirty cancel, multi-step flows, or verify-matrix
  form changes.
---

# FE forms

Portable skill (`plugins/dx-fe-devkit/skills`). **Stack:** [repo-binding](../fe-kit/references/repo-binding-template.md#forms-fe-forms) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md). **UX SSOT:** [@dx-ui forms-validation-ux](../dx-ui/references/forms-validation-ux.md) (layout, timing, copy)—implement here; do not duplicate UX tables in code comments.

## Principles

1. **One form owner per screen** — single `useForm` / binding equivalent; fields via binding wrappers ([field-wrappers](references/field-wrappers.md)).
2. **Layer split** — schema or rules in `domain/` when shared; mutation in `data/`; compose in `ui/` ([architecture-and-ownership](references/architecture-and-ownership.md)).
3. **Client for UX, server for truth** — Zod or binding schema on client; API always re-validates ([client-validation](references/client-validation.md)).
4. **Server errors on fields** — map 400/422 to `setError` / binding helper; `root` for global failures ([server-errors](references/server-errors.md)).
5. **Submit honesty** — disable primary while `isSubmitting` / mutation pending; no double-post ([submit-and-pending](references/submit-and-pending.md)).

## Read by task

| Situation | Read |
| --------- | ---- |
| Where hooks/schemas live in a slice | [architecture-and-ownership](references/architecture-and-ownership.md) |
| Zod, modes, shared schema | [client-validation](references/client-validation.md) |
| 400 mapping, root errors | [server-errors](references/server-errors.md) |
| Create vs edit, reset on id | [create-and-edit](references/create-and-edit.md) |
| Loading, disabled, success path | [submit-and-pending](references/submit-and-pending.md) |
| Search select, async unique check | [pickers-and-async-fields](references/pickers-and-async-fields.md) |
| Wizard / sections | [multi-step-and-sections](references/multi-step-and-sections.md) |
| ControlledField / Form.Item | [field-wrappers](references/field-wrappers.md) |
| i18n keys, a11y | [i18n-and-accessibility](references/i18n-and-accessibility.md) |
| Duplicated state, footguns | [anti-patterns](references/anti-patterns.md) |

## Workflow

```
Read dx-ui forms-validation-ux → resolve binding library + wrappers →
place schema/hook per architecture → wire mutation + server error mapper →
test submit/pending (@fe-testing forms-and-mutations) → verify-matrix
```

| Step | Action |
| ---- | ------ |
| 0 | Binding: form library, schema lib, field wrappers, error payload shape |
| 1 | Match page pattern P3 / wizard from `dx-ui` |
| 2 | `defaultValues` + validation mode per UX doc |
| 3 | Mutation from `data/`; onSuccess navigates per product |
| 4 | Map API errors through binding mapper — single function |
| 5 | [verify-matrix](../fe-kit/references/verify-matrix.md): form flow → submit/pending tests |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Labels, errors, density, wizard UX | `@dx-ui` [forms-validation-ux](../dx-ui/references/forms-validation-ux.md), [multi-step-flows](../dx-ui/references/multi-step-flows.md) |
| Mantine props / Form API | `@fe-mantine` |
| Mutation + Query invalidate | `@fe-architecture` [server-state](../fe-architecture/references/server-state.md) |
| Form tests | `@fe-testing` [forms-and-mutations](../fe-testing/references/forms-and-mutations.md) |
| Copy / keys | `@fe-i18n` |
| Upload fields | `@fe-security` [uploads-and-downloads](../fe-security/references/uploads-and-downloads.md) |

## Out of scope

PDF generation, server-side form builders, non-React forms. Backend validation contract owned with API team — FE implements mapper only.

## External SSOT

| Topic | Link |
| ----- | ---- |
| RHF server errors | [Advanced: server errors](https://react-hook-form.com/advanced-usage/server-errors) |
| RHF + Zod | [Zod integration](https://react-hook-form.com/integrations/zod) |
| Multi-step | [RHF multi-step](https://react-hook-form.com/advanced-usage/multi-step-forms) |
| Ant forms spec | [data-entry](https://ant.design/docs/spec/data-entry) (UX via `dx-ui`) |