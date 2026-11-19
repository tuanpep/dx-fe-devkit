# i18n keys

Copy tone: [@dx-ui microcopy-voice](../../dx-ui/references/microcopy-voice.md). Full workflow: `@fe-i18n` [key-structure](../../fe-i18n/references/key-structure.md).

## Namespace pattern (typical)

```text
<module>.<feature>.<surface>.<name>
catalog.orderRecords.list.title
catalog.orderRecords.form.fields.status
catalog.orderRecords.form.validation.required
common.actions.save
errors.network
```

| Segment | Meaning |
| ------- | ------- |
| Module | Product module id — kebab or camel per binding |
| Feature | Slice id |
| `list` / `form` / `detail` | Screen role |
| `fields`, `actions`, `empty`, `errors` | Group |

## Rules

- **Stable** keys — do not encode English sentence as key (`clickHereToSave`).
- Lowercase dot segments; no spaces.
- Pluralization via i18n library plural rules — not `item` vs `items` duplicate keys unless needed.
- Reuse `common.*` for shared actions — do not copy `Save` per feature.

## Relation to code symbols

| Code | i18n |
| ---- | ---- |
| `t('catalog.orderRecords.list.title')` | User-facing |
| `OrderRecordsPage` | Component PascalCase — unrelated to key string |

## RTL

Locales like `ar`, `he` — key names stay LTR English; binding verify script ([fe-i18n](../../fe-i18n/SKILL.md)).