# Optimize INP (interactions)

INP reflects **worst** interaction latency across the visit (p75 field). Admin apps: filters, row actions, tabs, drawers, combobox search.

## Handler discipline

| Do | Don't |
| -- | ----- |
| Keep click/submit handlers short; async I/O after first paint | Sync 50ms+ work in `onClick` (parse, sort 10k rows, analytics batch) |
| `startTransition` for expensive tree updates (React 18+) | `setState` whole table dataset on each keypress without debounce |
| Debounce search inputs (module convention) | Hit API on every character when binding says debounced |
| Move telemetry to `queueMicrotask` / `requestIdleCallback` | Third-party tag firing synchronously on click |

## Rendering

- **Virtualize** when row count exceeds binding threshold (often 100+ DOM rows) — [enterprise-screens](enterprise-screens.md), [data-tables-density](../../dx-ui/references/data-tables-density.md).
- Split **controlled filter state** from full dataset — filter in worker or server when possible.
- Opening modals/drawers: lazy-load heavy children; show shell immediately.

## React Query

- Optimistic updates only when mutation is fast; avoid refetching entire list synchronously on success.
- `placeholderData` / skeleton for filter changes — don't block paint on `isFetching` for entire page ([server-state](../../fe-architecture/references/server-state.md)).

## Profiling loop

1. Reproduce interaction with CPU throttle.
2. Performance panel: find long task starting at event.
3. Fix **largest contributor** once (import cost vs render vs handler).
4. Re-test same interaction.

Optional: `npx react-doctor@latest scan <url>` for render attribution ([fe-kit external-catalog](../../fe-kit/references/external-catalog.md)).

## Memoization

Use `memo` / `useMemo` when profiling shows:

- Stable props but expensive child re-renders (wide tables), or
- Referential instability breaking virtualization.

Not a default for every leaf component.