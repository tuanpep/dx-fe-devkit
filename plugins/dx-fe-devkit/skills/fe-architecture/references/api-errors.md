# API errors → UI

Map in `data/` or `domain/` — never raw HTTP text in `ui/`. UX patterns: [dx-ui feedback-states](../../dx-ui/references/feedback-states.md).

| HTTP | UI pattern |
| ---- | ---------- |
| 400 validation | Inline field errors |
| 403 | Permission empty state |
| 404 | Not found region |
| 409 / conflict | Banner + retry |
| 5xx | Toast + preserve form draft |

Binding: error envelope / problem+json shape.