# RTL & layout

Binding lists **RTL locales** (`ar`, `he`, `fa`, `ur`, …).

## Document direction

On locale change:

```typescript
document.documentElement.dir = i18n.dir(locale); // or binding helper
document.documentElement.lang = locale;
```

Subscribe on `languageChanged` + initial load ([provider-and-runtime](provider-and-runtime.md)).

## CSS

| Avoid | Prefer |
| ----- | ------ |
| `margin-left`, `padding-right` | `margin-inline-start`, `padding-inline-end` |
| `text-align: left` | `text-align: start` |
| `left` / `right` positioning | `inset-inline-*` |
| Physical `ml-4` only (Tailwind) | `ms-4`, `ps-4`, `text-start` when RTL shipped |

Mantine/Ant: use theme direction prop when binding sets `dir`.

## Icons & imagery

- Directional icons (chevrons, back): mirror in RTL or use neutral glyph — product rule in module `AGENTS.md`.
- Do not mirror logos or asymmetric illustrations.

## Tables & forms

- Test **one** dense table and one long form in RTL when adding new layout ([locale-and-content](../../dx-ui/references/locale-and-content.md)).
- Sticky columns: verify start/end, not only left/right.

## Bidirectional text

Mixed LTR codes inside RTL UI may need `unicode-bidi` on cell — binding pattern for ID columns.

## Tests

Manual or visual regression for RTL when binding enables — [testing-i18n](testing-i18n.md).