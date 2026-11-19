# Pickers & async fields

UX: [forms-validation-ux](../../dx-ui/references/forms-validation-ux.md) § Pickers and lookups.

## Search / async select

| Rule | Implementation |
| ---- | -------------- |
| Debounced search | Binding debounce ms; query in combobox `onSearch` |
| Loading | Dropdown loading state — not silent stall |
| Empty / error | Empty state copy; error retry in list |
| Value display | Label, not raw id — store `{ value, label }` or resolve label from cache |
| Clear | Clear affordance visible |

Wire through binding `ControlledField` + design-system Select/Combobox (`@fe-mantine` for Mantine APIs).

## Dependent pickers

When parent changes, reset child field:

```typescript
const region = watch('regionId');
useEffect(() => {
  setValue('siteId', null);
}, [region, setValue]);
```

Avoid infinite loops — compare previous parent value.

## Dates & times

- Module-wide display format via `fe-i18n` / binding.
- Timezone: document whether form uses local vs UTC — map in `toPayload`.

## File fields

- Client size/type UX; server authoritative ([fe-security uploads](../../fe-security/references/uploads-and-downloads.md)).
- Upload pending disables submit when mutation must include file metadata.

## Arrays / repeatables

- Use `useFieldArray` or binding pattern for dynamic rows.
- Min/max rows in Zod; add/remove actions labeled for a11y.