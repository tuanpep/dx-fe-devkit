# Client validation

Binding: schema library (usually **Zod**) + resolver (e.g. `zodResolver` for RHF).

## Schema placement

- Shared with server when binding has a shared package — same shape on both sides.
- Feature-only schemas in `domain/` next to types.
- Types: `z.infer<typeof schema>` for submit handler input.

## RHF + Zod defaults (admin)

| Setting | Admin default |
| ------- | ---------------- |
| `mode` | `onSubmit` — per [forms-validation-ux](../../dx-ui/references/forms-validation-ux.md) |
| `reValidateMode` | `onBlur` or `onChange` after first submit — binding choice |
| High-cost fields | `onBlur` on individual fields via schema + touch |

Avoid validating every keystroke unless product documents support load win.

## Resolver

```typescript
useForm({
  resolver: zodResolver(orderCreateSchema),
  defaultValues: orderCreateDefaults,
});
```

Rules live in **schema**, not duplicated in `register(..., { required: true })`.

## Numbers, dates, empty strings

- HTML number inputs: `valueAsNumber` or `z.coerce.number()`.
- Optional number: distinguish `""` vs `undefined` per API contract.
- Dates: bind module formatter; store API format in schema transform.

## Dependent fields

Use Zod `refine` with `path` on both fields for “confirm password” patterns.

## Async client checks

Unique name / code:

```typescript
register('code', {
  validate: async (value) => {
    if (!value) return true;
    const free = await checkCodeAvailable(value);
    return free || t('validation.codeTaken');
  },
});
```

Show field loading indicator per `dx-ui` async validation row. Debounce via binding.

## Security note

Client schema can be bypassed — server must validate all submissions ([fe-security](../../fe-security/SKILL.md) is not a substitute for API rules).