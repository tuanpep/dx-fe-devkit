# i18n & accessibility

## i18n (`@fe-i18n`)

| String | Source |
| ------ | ------ |
| Field labels | `feature.form.fields.*` keys |
| Zod messages | `t()` in schema or `errorMap` — binding pattern |
| Server errors | Map codes to keys when server returns codes |
| Submit / cancel | Module `actions.*` |

No user-facing literal in `ui/` without key when binding enforces verify script.

## Validation messages

- Reason + fix tone — [microcopy-voice](../../dx-ui/references/microcopy-voice.md).
- Same message for client and mapped server error when possible.

## Accessibility

| Requirement | Implementation |
| ------------- | -------------- |
| Labels | Programmatically associated — wrapper enforces |
| Errors | `role="alert"` for summary / `root` errors |
| Invalid fields | `aria-invalid={!!error}` |
| Described by | Error id in `aria-describedby` |
| Focus | `shouldFocus` on first server error |
| Required | `required` + visual legend system-wide |

## Placeholders

Placeholder is **not** a label ([forms-validation-ux](../../dx-ui/references/forms-validation-ux.md)).

## Testing

jest-axe on form pages when binding enables — [@fe-testing accessibility](../../fe-testing/references/accessibility-testing.md).