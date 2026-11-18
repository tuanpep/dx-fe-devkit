# Locale and interface content

General rules for enterprise products with multiple languages—no product-specific key prefixes.

## String externalization

- User-visible text lives in resource files, not hardcoded in views.
- Use interpolation/plural rules supported by your i18n stack—avoid string concatenation for counts.

## Expansion and layout

- Translated labels often **longer** than source language—allow wrap, flexible columns, and min-width constraints that survive translation.
- Test at least one non-default locale on every new dense table or form.

## Register and tone

- Enterprise admin: direct, calm, active voice ([microcopy-voice](microcopy-voice.md)).
- Define product-level rules for formal vs informal address per locale.

## Dates, numbers, currency

Ant [data-format](https://ant.design/docs/spec/data-format). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §7.

| Type | Display rule |
| ---- | ------------ |
| Numbers in grids | Right-align; group thousands per locale |
| Currency | Symbol + amount; huge values `M` / `B` |
| Absolute datetime | One module convention (list vs detail) |
| Relative time | Bucketed for notifications/feeds |
| No value | `--` |
| Redaction | Policy-based partial `*` — never invent ad hoc |

- Use locale formatters — do not hand-format per screen.

## Domain terminology

- Stable codes from APIs; human labels from translation or domain maps—consistent glossary across modules.

## Accessibility of content

- Language of page declared correctly for assistive tech when locale switches.
- Do not encode meaning in language-specific puns or idioms for critical errors.
