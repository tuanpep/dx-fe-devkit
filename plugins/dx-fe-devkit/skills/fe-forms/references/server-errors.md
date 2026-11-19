# Server errors

Map HTTP **400/422** (and binding-specific shapes) to field errors. UX: [forms-validation-ux](../../dx-ui/references/forms-validation-ux.md) § Server errors.

## Binding mapper

One function per API error contract — e.g. `mapValidationErrors(payload): FieldErrors`:

| API shape | Map to |
| --------- | ------ |
| `{ fieldErrors: { name: message } }` | RHF field `name` (camelCase per binding) |
| RFC 7807 `errors[]` with `field` | Normalize keys |
| Non-field `detail` / `message` | `root` error |

Implement in `api/` or `domain/` (pure map); call from form `onSubmit` in `ui/`.

## React Hook Form

| Server says | API |
| ----------- | --- |
| Field invalid | `setError(name, { type: 'server', message }, { shouldFocus: i === 0 })` |
| Global failure | `setError('root.server', { type: 'server', message })` |
| Network / 500 | `setError('root.server', { message: t('errors.network') })` |

Render `root` with `role="alert"` ([RHF server errors](https://react-hook-form.com/advanced-usage/server-errors)).

```typescript
function applyServerErrors(
  setError: UseFormSetError<FormValues>,
  payload: unknown,
) {
  const mapped = mapValidationErrors(payload);
  Object.entries(mapped.fields).forEach(([name, message], index) => {
    if (isFormField(name)) {
      setError(name, { type: 'server', message }, { shouldFocus: index === 0 });
    }
  });
  if (mapped.global) {
    setError('root.server', { type: 'server', message: mapped.global });
  }
}
```

## Copy

- User-facing messages only — no stack traces, codes alone, or internal keys.
- Prefer server message when safe; map known codes via `fe-i18n` when binding defines catalog.

## 403 / 404

- **403:** permission UX — not always a field error; banner + [permissions-ux](../../dx-ui/references/permissions-ux.md).
- **404 edit:** route to exception page; do not throw unhandled in submit.

## Clear behavior

- Field server errors clear when user edits field (RHF default).
- `root` clears on next submit attempt.

## Multi-step

On 422, navigate to step owning first rejected field ([multi-step-and-sections](multi-step-and-sections.md)).