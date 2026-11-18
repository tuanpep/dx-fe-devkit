---
name: fe-forms
description: >-
  Form implementation from dx-ui forms-validation-ux; libraries from binding.
  Use for create/edit flows, validation mapping, submit pending states.
---

# FE forms

**UX:** [dx-ui forms-validation-ux](../dx-ui/references/forms-validation-ux.md).

**Stack:** [repo-binding-template](../fe-kit/references/repo-binding-template.md#forms-fe-forms).

- Single form owner (RHF / binding library); server errors on fields.
- Disable submit while pending; `defaultValues` from query on edit; reset when id changes.
- Copy from [dx-ui microcopy-voice](../dx-ui/references/microcopy-voice.md) + `fe-i18n`.