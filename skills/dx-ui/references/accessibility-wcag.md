# Accessibility — enterprise floor (WCAG 2.1 AA)

Baseline aligned with Ant [contrast](https://ant.design/docs/spec/contrast) and WCAG 2.1 AA. Index: [ant-spec-index](ant-spec-index.md).

## Non-negotiables

| Requirement | Implementation |
| ----------- | -------------- |
| Contrast | 4.5:1 body text; 3:1 large text/UI components |
| Keyboard | All actions reachable; visible focus |
| Labels | Programmatic name for every control |
| Status | Not color-only |
| Structure | Headings in order; landmarks |
| Motion | Respect `prefers-reduced-motion` |

## Keyboard patterns

| Widget | Keys |
| ------ | ---- |
| Button | Enter, Space |
| Menu | Arrows, Escape close |
| Dialog | Focus trap, Escape dismiss if non-destructive cancel allowed |
| Table scroll region | Tab to region; arrows scroll when focused |

## Tables

- Header cells associated with data cells.
- Sort controls operable and announced.

## Forms

- `aria-invalid` + error text linked via `aria-describedby`.
- Required state not conveyed by color alone.

## Overlays

- Focus moves into dialog on open; returns to trigger on close.
- Do not trap without Escape path when cancel is valid.

## Testing (minimum)

1. Tab through primary flow in a development build.
2. Zoom 200%—content reflows, no loss of function.
3. One screen reader spot-check on list + dialog if new overlay pattern.

Record manual verification steps in the product’s own ship checklist (project binding).

## References

[visual-foundations](visual-foundations.md) (contrast, type), Ant [contrast](https://ant.design/docs/spec/contrast).
