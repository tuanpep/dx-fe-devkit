# Field wrappers (binding)

Binding lists **field wrapper components** — e.g. `ControlledField` (RHF `Controller` + Mantine input), or Ant Design `Form.Item` integration.

## Contract

Each wrapper should:

| Concern | Wrapper owns |
| ------- | ------------ |
| `control` / `name` | RHF registration |
| Label + required mark | Visible label — not placeholder-only |
| Error display | `error` prop from `fieldState` |
| `aria-invalid`, `aria-describedby` | Link message to input |
| Disabled / read-only | From form + permission props |

Example pattern (illustrative):

```typescript
<ControlledField
  control={control}
  name="status"
  label={t('orders.fields.status')}
  render={({ field, fieldState }) => (
    <Select
      {...field}
      data={statusOptions}
      error={fieldState.error?.message}
    />
  )}
/>
```

Use binding component — do not fork per feature.

## Read-only edit

Per [permissions-ux](../../dx-ui/references/permissions-ux.md): show text/badge, not disabled inputs maze.

## Module components

Custom inputs (compliance datetime, entity picker) expose same wrapper API — `name`, `control`, `label`, `error`.

## Ant vs Mantine

| Stack | Binding |
| ----- | ------- |
| Mantine | RHF + `Controller`; `@fe-mantine` for component props |
| Ant Design | `Form` + binding may use `Form.Item` + RHF bridge — follow repo example |

See [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) for Mantine form frame + actions pattern.

## Tables inside forms

Editable grid cells — still one form owner; avoid nested independent forms.