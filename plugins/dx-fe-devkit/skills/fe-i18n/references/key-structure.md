# Key structure

Summary also in [@fe-naming i18n-keys](../../fe-naming/references/i18n-keys.md). **Binding** may override segment style.

## Path pattern (typical admin)

```text
<module>.<feature>.<surface>.<group>.<name>

catalog.orderRecords.list.title
catalog.orderRecords.list.empty.description
catalog.orderRecords.form.fields.status
catalog.orderRecords.form.validation.required
common.actions.save
common.errors.network
```

| Segment | Meaning |
| ------- | ------- |
| `module` | Product module id |
| `feature` | Slice id |
| `surface` | `list`, `form`, `detail`, `dialog` |
| `group` | `fields`, `actions`, `columns`, `errors`, `empty` |
| `name` | camelCase leaf — semantic, not English sentence |

## Rules

- Lowercase dot segments; ASCII; no spaces.
- **Stable** — renaming key is migration (grep + verify), not casual rename.
- Do not use full English sentence as key: `clickHereToSaveOrder`.
- Shared actions under `common.*` or module `actions.*`.

## JSON nesting (optional)

Some bindings nest JSON to match folders:

```json
{
  "orderRecords": {
    "list": {
      "title": "..."
    }
  }
}
```

Flat keys vs nested objects — **one style per repo** in binding.

## What not to translate in keys

Key paths stay English LTR. Locale code selects file, not key language.

## Code symbols

| Item | Convention |
| ---- | ------------ |
| `t('catalog.orderRecords.list.title')` | User string |
| `OrderRecordsPage` | PascalCase component — unrelated |

## Module vs feature ownership

| Owns keys | Scope |
| --------- | ----- |
| Feature team | `module.feature.*` |
| Platform | `common.*`, `errors.*` |
| Design system wrapper | Document in dx-ui binding if shared |