# Data tables and density

Ant: [data-display](https://ant.design/docs/spec/data-display), [data-list](https://ant.design/docs/spec/data-list), [research-list](https://ant.design/docs/spec/research-list) (query table). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §4, §6.

Enterprise users scan hundreds of rows—optimize **scannability** and **bounded scroll**.

## Four jobs a table must support

Before adding columns or chrome, confirm the table helps users:

1. **Find** — search/filter (or queue membership) reaches the right rows  
2. **Compare** — key attributes visible without opening every row  
3. **Open one** — clear path to P2 / edit  
4. **Act** — row or bulk actions for the primary workflow  

If a job is out of scope for the screen, omit its chrome (e.g. no filter bar on a fixed work queue).

## Ant table rules

| Rule | Detail |
| ---- | ------ |
| Column priority | Importance, action frequency, association |
| Cell integrity | Time, status, action bar **single line** |
| Empty cell | `—` or `--` (module convention) |
| Composition | Sort, search, filter, pagination with table |

## Layout rules

| Rule | Rationale |
| ---- | --------- |
| Table host has max width/height strategy | Avoid infinite page growth |
| Horizontal overflow **inside** table region | Shell nav/filters stay stable |
| Vertical scroll inside region or virtualized body | Keyboard focus on scroll region when needed |
| Column priority | Identifiers + status + primary actions first; optional columns hide on narrow widths |

## Column types

| Type | Pattern |
| ---- | ------- |
| Identifier | Link style to detail route |
| Status | Text + semantic color + icon (not color alone) |
| Date/time | Consistent format module-wide |
| User/person | Avatar optional; name primary |
| Actions | Icon group in row; overflow menu if >3 |
| Selection | Checkbox column; header select-all with care on paged data |

## Interaction

| Action | Placement |
| ------ | --------- |
| Open record | Row click or link column—not whole-row mystery click without affordance |
| Edit | Row icon or detail page |
| Delete/deactivate | Rarely row icon; prefer detail or bulk with confirm |
| Sort | Header; sync to query key |
| Filter | Toolbar—not per-column hidden unless power-user table |

## Pagination vs infinite scroll

| Mode | Use when |
| ---- | -------- |
| Pagination | Ops queues—users need stable page for comparison and support |
| Infinite scroll | Feed/timeline UX (uncommon in admin) |

**Stale page content:** when using cached list data, define product rules for what persists across page-size change vs filter change—document in project binding.

## Density tiers

| Tier | Row height | When |
| ---- | ---------- | ---- |
| Comfortable | Default DS | Mixed skill users |
| Compact | Reduced padding | Power users, finance ops |

**Density = task:** match the job (queue/table → compact; sparse settings → comfortable). Use **one density per page**—do not mix airy card stacks with a dense table on the same screen. Match **neighbor module** for the same role.

## Accessibility

- Table headers `<th scope="col">` or equivalent grid semantics.
- Sort buttons keyboard operable.
- Scroll region: accessible name, focusable when overflow (per design-system scroll container pattern).

## Anti-patterns

- Page-level horizontal scroll for wide grid
- Icon-only actions without tooltip/aria-label
- Client-side sort when server is source of truth for large sets (unless documented local sort)
- Dump-grid with every attribute column and no find/compare/open/act priority
