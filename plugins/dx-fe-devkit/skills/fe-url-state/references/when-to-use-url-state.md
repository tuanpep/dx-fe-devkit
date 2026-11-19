# When to use URL search params

## Put in the URL

| State | Why |
| ----- | --- |
| List filters (status, owner, date range) | Shareable admin views, support can reproduce |
| Full-text search on a list | Bookmarkable; back restores results |
| Sort column + direction | Expected on data tables |
| Page + page size | Standard pagination UX |
| Active tab on a workbench | Deep link to “Audit” vs “Details” |
| Binary toggles (e.g. `showArchived=true`) | Small, non-sensitive |

Users should Cmd/Ctrl+click, refresh, and use back/forward without losing the view.

## Keep out of the URL

| State | Prefer |
| ----- | ------ |
| Access tokens, session ids, PII | Memory / httpOnly cookies |
| Multi-step form drafts | Component state or server draft API |
| Validation error messages | UI only |
| Huge filter AST / nested builder JSON | Server **preset id** + optional name |
| Modal open (unless product requires deep link) | Local state; opt-in `?modal=…` if binding says so |
| Transient UI (hover, focus, accordion) | Local state |

## URL length

Browsers enforce practical limits (~2k characters varies). If serialized filters approach limits, persist on server and store only `presetId` (or `viewId`) in the query string.

## Overlap with React Query

URL owns **what to fetch**; React Query owns **cache and status**. The parsed URL object (or a stable slice of it) must appear in `queryKey` so cache partitions match the address bar ([architecture-and-ownership](architecture-and-ownership.md)).