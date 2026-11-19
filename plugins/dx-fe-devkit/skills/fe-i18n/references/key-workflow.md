# Key workflow

Binding defines library (`react-i18next`, `react-intl`, etc.) and file layout.

## Adding a string

| Step | Action |
| ---- | ------ |
| 1 | Search existing keys in module namespace — reuse before create |
| 2 | Add key to **source locale** (usually `en`) per [key-structure](key-structure.md) |
| 3 | Mirror in all **shipped** locales or follow WIP policy — [key-verify](key-verify.md) |
| 4 | Replace literal in component with `t('...')` or `Trans` |
| 5 | Run binding verify command |

## Reuse vs duplicate

| Prefer | Avoid |
| ------ | ----- |
| One `common.actions.save` per app/module | `save`, `submit`, `confirmSave` synonyms |
| Module-level `empty.noResults` | Copy-paste empty state per list |
| Feature-specific only when meaning differs | “Delete” vs “Remove” without product reason |

Pick **one** verb for primary save per module ([fe-forms](../fe-forms/SKILL.md) copy).

## Namespaces

One namespace per product module when possible — [namespaces-and-loading](namespaces-and-loading.md). Cross-namespace `t` only via binding pattern.

## Rich text

- Links inside copy: `Trans` / `IcuTrans` with numbered tags — not raw HTML in JSON unless sanitizer pipeline ([fe-security XSS](../../fe-security/references/xss-and-html.md)).
- User-generated names in interpolation — never as HTML; React escapes text nodes.

## PR checklist

```
- [ ] No new hardcoded user-visible string in ui/
- [ ] Key added to source + shipped locales (or ticket for lagging locale)
- [ ] verify script passes
- [ ] Plural uses ICU / suffix rules — not concat
- [ ] New dense layout checked in one non-default locale
```

## dx-ui

Tone and register: [locale-and-content](../../dx-ui/references/locale-and-content.md), [microcopy-voice](../../dx-ui/references/microcopy-voice.md).