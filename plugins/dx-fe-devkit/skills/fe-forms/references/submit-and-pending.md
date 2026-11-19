# Submit & pending

## Primary action

Align with module action pattern ([dx-ui](../../dx-ui/references/forms-validation-ux.md), module `AGENTS.md`):

| State | Primary button |
| ----- | -------------- |
| Invalid (after submit) | Enabled — user fixes fields |
| `isSubmitting` / mutation pending | **Disabled** + loading indicator |
| Success | Navigate or toast — no double submit |

```typescript
const { mutateAsync, isPending } = useUpdateOrderMutation();
const onSubmit = handleSubmit(async (values) => {
  try {
    await mutateAsync(toPayload(values));
    // onSuccess navigation
  } catch (e) {
    applyServerErrors(setError, e);
  }
});

<Button type="submit" loading={isSubmitting || isPending} disabled={isSubmitting || isPending}>
  {t('actions.save')}
</Button>
```

Use binding Button prop names (`loading` vs `isLoading`).

## `handleSubmit`

- Validates client schema first — only then calls async mutate.
- Do not call `mutate` from raw `onClick` bypassing validation except documented debug tools.

## Secondary actions

- **Cancel / Back** — not `type="submit"`.
- Destructive — separate from submit footer; confirm pattern per `dx-ui`.

## Optimistic updates

Rare on long forms — prefer pessimistic with pending disable. Lists may use optimistic row actions separately ([server-state](../../fe-architecture/references/server-state.md)).

## Unsaved navigation

`beforeunload` only when binding/product requires — prefer in-app confirm modal on route block.

## Testing

[@fe-testing forms-and-mutations](../../fe-testing/references/forms-and-mutations.md): disabled while pending, server errors on fields.