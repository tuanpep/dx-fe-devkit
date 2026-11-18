# Feedback states (loading, empty, error, success)

Ant sources: [feedback](https://ant.design/docs/spec/feedback), [research-exception](https://ant.design/docs/spec/research-exception), [research-empty](https://ant.design/docs/spec/research-empty). Index: [ant-spec-index](ant-spec-index.md).

**Page state matrix (Ant):** ideal → partial → loading → error → empty. Empty includes guided new-user, cleared queue, and no-data search.

## Unified async model

Use one resolver pattern per surface (list, detail block):

| State | User need | UI |
| ----- | --------- | --- |
| **initial loading** | Know wait is normal | Skeleton matching layout |
| **ready** | Work | Content |
| **empty (global)** | Know system works; no rows yet | Short line + optional create CTA—no tutorial/help essay; illustration optional and rare |
| **empty (filtered)** | Adjust filters | Clear filters action—not instructional paragraphs |
| **error (no cache)** | Recover | Message + retry |
| **error (stale cache)** | Caution | Banner + retry; show stale with label |
| **background refresh** | Subtle awareness | Inline “Updating…” not full skeleton |

Outcome toasts and banners: [notifications-and-messaging](notifications-and-messaging.md).

## Skeleton rules

- Match final layout bounds—avoid jump.
- Prefer section skeletons over single spinner for whole page.
- Table: row placeholders count ≈ page size or min 3.

## Success feedback

| Action weight | Feedback |
| ------------- | -------- |
| Lightweight save | Toast |
| Navigation-changing save | Redirect + optional toast |
| Bulk job | Progress dialog → result summary |

## Error copy

Always **reason + fix**—see [microcopy-voice](microcopy-voice.md).

Map API codes:

| Code class | UX |
| ---------- | --- |
| 4xx validation | Field or form summary |
| 409 conflict | Explain conflict; no optimistic rollback UI |
| 403 | Explain lack of permission; no fake disabled button that still submits |
| 5xx / network | Retry; support reference if available |

## Empty tone

| Tone | Use |
| ---- | --- |
| `empty` | No data |
| `notFound` | Detail id invalid |
| `error` | Failed fetch |

Define empty/error **tones** once per product (e.g. global empty vs filtered empty vs fault)—document in project binding.

## Anti-patterns

- Infinite spinner with no timeout message
- Empty table with no distinction filter vs no data
- Optimistic row removal before server ack for regulated entities
