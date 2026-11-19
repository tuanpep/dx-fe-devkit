# Enterprise screens (tables, charts, editors)

UX rules: `@dx-ui`. Structure: `@fe-architecture`.

## Data tables

| Concern | Performance approach |
| ------- | -------------------- |
| Many rows | Virtualized body or paged fetch — not full DOM for 5k rows |
| Filter / sort | Debounced server query; local filter only when row set bounded in binding |
| Column resize | Throttle drag updates |
| Row expand | Lazy render expanded panel; one expanded row policy if heavy |
| Selection | Avoid re-rendering all rows — stable row keys, targeted state |

Align layout with [data-tables-density](../../dx-ui/references/data-tables-density.md): scroll region, not unbounded page height.

## Dashboards

- One `lazy` boundary per heavy widget (chart/map).
- Stagger below-fold widget data fetch after first paint (`requestIdleCallback` or intersection).
- Shared chart library loaded once per dashboard chunk, not per widget file statically from shell.

## Forms (create/edit)

- Heavy pickers (map, rich text): in-page lazy + modal skeleton ([fe-forms](../../fe-forms/SKILL.md)).
- Validation stays sync-light — async rules debounced.

## Module Federation

Coarse remote per product; **internal** route lazy for savings ([code-splitting](../../fe-architecture/references/code-splitting.md)). Avoid per-feature MF exposes unless deploy isolation requires it.

## Verification triggers

From [verify-matrix](../../fe-kit/references/verify-matrix.md): **Large table / page** → budget / Lighthouse if configured + manual INP spot-check on filter and row open.