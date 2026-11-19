# Anti-patterns

| Anti-pattern | Fix |
| ------------ | --- |
| `useState` for list filters with no URL sync | URL-first or document why ephemeral |
| Storing JWT / user id in query | Remove; use session |
| Passing raw `searchParams.get('x')` to API | Parse + validate first |
| Different param names per list screen | Binding table of canonical names |
| `useEffect` that `setSearchParams` on every render | Derive defaults once; guarded updates |
| Mutating `URLSearchParams` without setter | Always call router setter / `router.replace` |
| Pushing history on each search keystroke | Debounce + `replace` |
| 50-key filter builder in URL | Server preset + `presetId` |
| `JSON.parse` user query without schema | Zod `safeParse` |
| Duplicate parse logic in page + loader | Single `domain/` parser |
| Next `useSearchParams` without `Suspense` on static pages | Add boundary or read Server `searchParams` |
| Open redirect via `?next=` | `@fe-security` safe path helper |

## React Router note

`searchParams` is mutable if you call `.set` without `setSearchParams` — URL and React tree can diverge. Treat as read-only; clone when building the next string.

## Performance

Avoid parsing entire URL on every parent re-render — memoize on `searchParams.toString()` or use router subscription APIs from binding.