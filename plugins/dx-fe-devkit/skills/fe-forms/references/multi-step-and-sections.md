# Multi-step & sections

**UX SSOT:** [multi-step-flows](../../dx-ui/references/multi-step-flows.md) + [forms-validation-ux](../../dx-ui/references/forms-validation-ux.md).

## When to use

| Fields | Pattern |
| ------ | --------- |
| &lt;10 | Single page sections |
| 7–15 | Grouped sections |
| &gt;15 / phased | Stepper or routed wizard |

Not modal wizard for 20+ fields — route P3 page.

## Single form, multiple steps (RHF)

| Technique | Note |
| --------- | ---- |
| `FormProvider` | One `useForm` for all steps |
| `trigger(stepFields)` on Next | Validate current step only |
| `shouldUnregister` | Default **false** — keep values when steps unmount |
| Final submit | `handleSubmit` validates all steps |

See [RHF multi-step](https://react-hook-form.com/advanced-usage/multi-step-forms).

## Server errors in wizards

On 422, jump to first step containing rejected field; apply `setError` on those fields ([server-errors](server-errors.md)).

## Draft / session

- **Save draft** only when API exists — no fake localStorage draft in regulated domains.
- If binding uses session draft, exclude secrets (passwords) from persisted JSON.

## Section layout

- Headings per `dx-ui` proximity; sticky footer Back | Next | Submit.
- Summary step: read-only review before final POST.

## Instant vs submit mode

Per page — pick **one** product mode ([forms-validation-ux](../../dx-ui/references/forms-validation-ux.md) Settings row). Do not mix “autosave every field” with classic Save on same screen without spec.

## Routed wizard

Each step as route segment when deep-link resume required — still one mutation on final step or progressive saves per API contract.