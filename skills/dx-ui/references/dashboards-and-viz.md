# Dashboards and data visualization (scope)

Enterprise **operations** products often defer dashboards; when included, follow Ant [visualization-page](https://ant.design/docs/spec/visualization-page). Index: [ant-spec-index](ant-spec-index.md).

## When a dashboard is appropriate

| Fit | Poor fit |
| --- | -------- |
| Executive snapshot of KPIs already on server | Replacing operational queues users work daily |
| Drill-down into list filtered by chart segment | Chart as only path to mandatory workflow |
| Historical trends with clear date semantics | Real-time gaming-style animations |

Require explicit product approval before new dashboard surfaces in regulated domains.

## Layout

- **Fit for purpose** (IBM): start from decisions the chart supports, not chart type first.
- One primary question per row or card; avoid dashboard-as junk drawer.
- Filters above charts sync to underlying list when drill-down exists.

## Accessibility

- Do not convey status by color alone; provide values in text or table alternate.
- Provide data table export or accessible equivalent for critical metrics where charts are decorative summary.

## Density

- Default to legible type and spacing—compress only when users are trained power analysts.
- Prefer linked list/detail for action, chart for orientation.

## Empty and error

Same [feedback-states](feedback-states.md) model: loading skeleton for widgets, per-widget error with retry, global error banner if whole dashboard fails.

## Out of scope for thin v1 ops modules

Batch analytics, embedded BI studios, custom chart builders—document as future epic, not ad-hoc UI.
