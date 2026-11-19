# Interpolation & formatting

Display rules: [dx-ui locale-and-content](../../dx-ui/references/locale-and-content.md) § Dates, numbers, currency; Ant [data-format](https://ant.design/docs/spec/data-format).

## Interpolation

| Rule | Detail |
| ---- | ------ |
| Named variables | `{userName}`, `{{userName}}` per binding mode |
| User content in message | Passed as value — never build HTML |
| Nested translation | `t('a', { b: t('b') })` when ICU disables `$t()` nesting |

## Numbers & currency

- Use `Intl.NumberFormat` / binding formatters — not `toFixed` in labels.
- Grids: right-align numbers; thousand separators per locale.
- Currency: symbol + amount; compact `M`/`B` per module convention.

## Dates & times

| Context | Rule |
| ------- | ---- |
| List | One module date format |
| Detail | May include time + timezone policy |
| Relative | `Intl.RelativeTimeFormat` or binding helper |
| Empty | `--` per module — not locale-specific invented |

Store API values in ISO/UTC; format at display boundary in `ui/` or shared formatter (`fe-architecture` module `ui/`).

## Escaping

- React escapes text in `t()` output.
- ICU `escapeVariables` when binding uses HTML in messages — rare in admin; prefer `Trans` components.

## API-driven labels

Status **codes** from server map to keys or domain glossary — [server-and-api-labels](server-and-api-labels.md). Do not interpolate raw API description fields without sanitization review.