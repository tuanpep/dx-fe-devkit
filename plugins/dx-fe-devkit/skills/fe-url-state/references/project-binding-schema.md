# Project binding schema (`fe-url-state`)

Repository file: section in `.cursor/skills/project-binding.md` or skill split path.

## Required fields

| Field | Content |
| ----- | ------- |
| **Router** | `react-router` \| `next-app` \| `tanstack-router` \| other + doc link |
| **Search update API** | e.g. `useSearchParams`, `nuqs`, TanStack `Route.validateSearch` |
| **Param naming** | flat vs prefixed keys; array encoding |
| **Default page / pageSize** | Numbers for list screens |
| **Debounce ms (search)** | e.g. `300` |
| **History mode for filters** | `replace` default for filter edits |

## Optional fields

| Field | Content |
| ----- | ------- |
| **Serializer library** | `nuqs`, custom, TanStack built-in |
| **Omit default keys in URL** | yes/no (cleaner URLs) |
| **Saved view / preset param** | e.g. `presetId` |
| **Modal deep link keys** | if product uses `?modal=` |
| **Shared parse module path** | e.g. `libs/url-state/` |

## Example snippet

```markdown
## URL state (`fe-url-state`)

| Field | Value |
| ----- | ----- |
| Router | react-router 6.28 |
| Update | `useSearchParams` + `{ replace: true }` for filters |
| Arrays | repeated keys (`status=open&status=pending`) |
| Search debounce | 300ms |
| Defaults | page=1, pageSize=25 |
| Preset id key | `view` |
```