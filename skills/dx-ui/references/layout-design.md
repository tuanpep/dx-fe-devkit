# Layout design (enterprise applications)

How to structure **space**, **regions**, and **responsive behavior** for signed-in admin and operations UIs. Ant: [layout](https://ant.design/docs/spec/layout), [research-workbench](https://ant.design/docs/spec/research-workbench). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §10. Local: [ant-design-deep](ant-design-deep.md), [spacing-hierarchy](spacing-hierarchy.md), [ant-spec-index](ant-spec-index.md).

## Layout goals

| Goal | Means |
| ---- | ----- |
| **Stable shell** | Navigation and page frame do not jump when content loads |
| **Bounded overflow** | Wide data scrolls inside a region, not the whole viewport |
| **Scannable hierarchy** | Proximity and type scale show what belongs together |
| **Predictable focus** | Landmarks and reading order match visual order |

## Application shell (level 0)

Persistent frame around routed pages:

```text
+----------------------------------------------------------+
| Banner / global header (product switch, user)             |
+----------+-----------------------------------------------+
| Primary  | Main content area                             |
| nav      | (page templates P1–P7 live here)              |
|          |                                               |
+----------+-----------------------------------------------+
```

| Region | Role |
| ------ | ---- |
| **Global header** | Identity, user, infrequent global actions |
| **Primary navigation** | Module or area switching; role-scoped visibility |
| **Main** | Single primary task per route—one main landmark |
| **Optional secondary nav** | Context within module (tabs, subnav) |

Rules:

- One obvious **main** content target per route.
- Do not place two competing primary actions in global header and page header without hierarchy (page wins for task).

**Admin variant:** add **settings nav** or searchable settings index inside main for P5—see [navigation-admin-ia](navigation-admin-ia.md).

## Page anatomy (level 1)

Common **vertical stack** for P1 list / P2 detail:

```text
Page header     title + page-level actions
Toolbar         search, filters, primary CTA (lists)
Optional        filter summary / context strip
Content         table | form sections | detail cards
Optional footer pagination | form actions
```

| Region | Typical height behavior |
| ------ | ------------------------ |
| Header + toolbar | Sticky optional on long scroll pages |
| Content | Fills remaining viewport; scroll **here** or in child region |
| Pagination / form actions | Sticky footer acceptable on long forms |

Detail pages: back + title in header; sections as cards or grouped blocks with larger **between-section** spacing than **within-section**.

## Grid and width

| Strategy | Use when |
| -------- | -------- |
| **Fluid main column** | Default admin—use horizontal padding tokens at viewport edges |
| **12-column grid** | Multi-column forms, dashboard cards, split panels |
| **Max content width** | Long prose or settings readability—center or left-align per product |
| **Fixed + fluid pair** | Master–detail workbench: narrow master list, fluid detail |

**Fit for purpose:** pick grid mode from user goal—triaging queues needs wide table; reading policy text needs narrow measure—not one global max-width.

Breakpoints:

| Viewport | Enterprise ops default |
| -------- | ------------------------ |
| Wide | Full table columns; side nav expanded |
| Medium | Collapse nav to icon; reduce nonessential columns |
| Narrow | Stack master/detail; keep filters in drawer; table still **bounded scroll** inside region |

## Master–detail and workbench (P4)

**Workbench home (Ant):** 5–9 modules on first screen; role-based tiles; **known destination** shortcuts vs **discovery** (todo, guide). See [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §10.

```text
+--------+---------------------------+-----------+
| Master | Detail                    | Context   |
| list   | primary record            | rail opt. |
+--------+---------------------------+-----------+
```

| Rule | Rationale |
| ---- | --------- |
| Master width fixed or min/max band | Prevents list from stealing detail space |
| Selection persists when possible | User compares records |
| Rail is optional third column | Comments, activity—[collaboration-surfaces](collaboration-surfaces.md) |
| Double-column detail | Ant data-list: quick switch across items without full navigation |

Minimum widths: if detail cannot render forms, collapse to **list → route detail** pattern (P1 → P2) instead of squeezing three panes.

## Scroll and overflow contract

| Layer | Scrolls? |
| ----- | -------- |
| Application shell | Ideally **no** horizontal scroll |
| Page background | Vertical scroll only if entire page is document-like |
| Table/data region | **Vertical and horizontal** overflow allowed inside container |
| Dialog body | Vertical when content exceeds viewport fraction |

**Bounded scroll:** users must always see which region moves. Pair with keyboard focus on scroll container when overflow is material—[accessibility-wcag](accessibility-wcag.md).

## Elevation and layers (conceptual)

**Surface planes** (Ant shadow / elevation semantics):

| Plane | Typical use |
| ----- | ------------- |
| **Canvas** | Page background |
| **Raised card** | Grouped content; at most one ambiguous raised focal area per view |
| **Overlay** | Modal, menu, popover, drawer |
| **Sunken well** | Optional inset region *inside* page (e.g. board columns)—not whole-page grey |

Stack overlays intentionally; avoid ad-hoc z-index ladders per feature.

## Proximity within layout

Apply [spacing-hierarchy](spacing-hierarchy.md):

- **Tight** inside a field group or table cell cluster.
- **Medium** between fields in a section.
- **Large** between unrelated page sections.

Headers sit **closer** to their content than to the previous section’s content.

## Layout × pattern matrix

| Pattern | Layout emphasis |
| ------- | ---------------- |
| P1 List | Toolbar + table region height fills viewport remainder |
| P2 Detail | Section stack; optional 2-column only for short label/value pairs |
| P3 Form | Single column default; section headings; sticky actions |
| P4 Workbench | Column split; define collapse rules |
| P5 Settings | Nav column + content column; search in nav when deep |
| P6/P7 Result/Exception | Narrow centered column acceptable |

Templates: [page-templates](page-templates.md).

## Responsive anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Whole page horizontal scroll for wide tables | Inner table region scroll |
| Hiding primary action only in collapsed nav | Expose on page header |
| Three panes on phone | Route-based detail |
| Sticky everything | Sticky toolbar OR table header—not unlabeled sticky stacks |

## Layout review checklist

```
- [ ] Shell landmarks defined (main, nav labels)
- [ ] One primary task region per route
- [ ] Overflow contract documented for table/form
- [ ] Spacing steps express section vs field grouping
- [ ] Breakpoint behavior defined for nav and columns
- [ ] Overlay stack matches decision tree
```

Use with [design-review-scorecard](design-review-scorecard.md).

## Relation to implementation

Pixel values, grid tokens, and component layout props belong in the **product design system** and **project binding skill**—not here. This file defines **regions, contracts, and splits** only.
