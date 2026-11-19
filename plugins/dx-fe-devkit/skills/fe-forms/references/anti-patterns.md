# Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| `useState` per field duplicating RHF | Single `useForm` |
| Submit enabled while mutation in flight | Disable + loading |
| Uncontrolled edit after failed load | Skeleton until query success |
| Mapping API errors ad hoc in every page | Shared `mapValidationErrors` |
| Client-only permission on submit | Hide/disable + API 403 |
| Fake save draft | Real API or omit |
| `register` rules duplicating Zod | Schema + resolver |
| `shouldUnregister: true` in multi-step | Keep values across steps |
| Entire form in `*Page.tsx` 300+ lines | `use*Form.ts` + section components |
| `reset()` without `id` dependency | Reset when route id changes |
| Raw `innerHTML` in rich text field | Binding sanitizer + `@fe-security` |

## Instant save + wizard

Do not autosave every keystroke on wizard steps meant for on-submit validation.

## Query as form source of truth

Server rows belong in Query cache — form holds **draft** only. Refresh form from query when discarding edits.

## Barrels

Form pages import mutations from `data/` paths — not lazy `index.ts` barrels that pull whole feature ([code-splitting](../../fe-architecture/references/code-splitting.md)).