# Selection and bulk actions

Ant: [data-list](https://ant.design/docs/spec/data-list) — selection swaps toolbar to batch mode; batch ops often **page bottom** ([research-list](https://ant.design/docs/spec/research-list)). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §4.

Tables in enterprise apps often need **multi-select** and **bulk** operations—design for clarity and accidents.

## Selection model

| Mode | Use when |
| ---- | -------- |
| **None** | Read-only triage; actions per row |
| **Single selection** | Master–detail workbench |
| **Multi-select (page)** | Bulk act on current page only |
| **Multi-select (all matching)** | Explicit “select all N matching filter”—dangerous; requires confirm |

Rules:

- Header checkbox: **indeterminate** when partial page selected.
- “Select all results” must distinguish **all on page** vs **all matching query**—never ambiguous.
- Clear selection after bulk completes or on filter change—document product rule.

## Bulk action placement

| Placement | When |
| --------- | ---- |
| **Toolbar** | Primary bulk (export, assign) when selection active |
| **Overflow menu** | Infrequent bulk |
| **Disabled until selection** | Prevents empty bulk submit |

Show **selection count** (“12 selected”) in toolbar when active.

## Destructive bulk

- Always confirm with count and consequence.
- Show **partial failure** summary if API returns per-item errors—do not silent fail.
- No optimistic remove of all rows before server ack for regulated data.

## Relation to row actions

| Row icon actions | Bulk toolbar |
| ---------------- | ------------ |
| Frequent single-record ops | Same verb names where possible (“Export”) |
| Open detail | Not duplicated as bulk without meaning |

See [data-tables-density](data-tables-density.md).

## Accessibility

- Select-all checkbox accessible name includes scope (“Select all on this page”).
- Bulk bar receives focus management when selection first made—optional, do not trap.

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Bulk delete with one-click | Confirm + entity type named |
| Hidden bulk in row menu only | Toolbar when multi-select mode exists |
| Losing selection silently on sort | Preserve or warn |
