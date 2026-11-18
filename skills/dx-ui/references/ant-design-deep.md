# Ant Design — enterprise spec (deep)

Sources: [Design values](https://ant.design/docs/spec/values), [Layout](https://ant.design/docs/spec/layout), [Proximity](https://ant.design/docs/spec/proximity), [Navigation](https://ant.design/docs/spec/navigation), [Overview / patterns](https://ant.design/docs/spec/overview).

**Spacing SSOT:** [spacing-hierarchy](spacing-hierarchy.md) — this file summarizes Ant rules and links to local pattern refs.

## Four design values

### Natural

- ~80% of cognition via vision — layout, color, icon discipline matters.
- Interaction should match user mental model of the **task**, not the UI framework.
- Optional multi-sensory channels only where they reduce cognitive cost.

### Certain

**Designers:** modular rules, object-like tokens, restraint — “nothing left to take away.” Object-oriented and modular design; spacing and color as parameterized objects.

**Users:** consistent look and interaction **across products, terminals, systems** so training transfers.

### Meaningful

- **Result:** clear goals; immediate feedback per action; emotional design only where it helps recovery.
- **Process:** moderate challenge; no unnecessary entities; user focused on mission not chrome.

### Growing

- Connect product capability growth to user role growth; discoverable features.

## Layout system (spatial order)

Ant layout is **systematic and dynamic**, not print-fixed.

| Aspect | Ant rule |
| ------ | -------- |
| Canvas | Unified artboard width (team default **1440**) |
| Grid unit | Base **8px** |
| Column grid | **24 columns**; fixed **gutter**; fluid column width on resize |
| Adaptation | **Side nav fixed + fluid main**, or **top nav + min side margins + fluid center** |
| Scales | UI dimensions as **multiples of 8** — “common scales”; inspiration not imprisonment |

Engineering alignment: define dynamic layout area, prefer even numbers, communicate gutter and column span, bound blocks with start/end columns.

Local region contracts: [layout-design](layout-design.md).

## Proximity (vertical and horizontal)

| Format | px | Use |
| ------ | -- | --- |
| Small | 8 | Intra-unit |
| Middle | 16 | Related blocks |
| Large | 24 | Section separation |

Formula: **y = 8 + 8×n** (n ≥ 0). Extend with extra 8px multiples or guides (divider, subtitle).

Horizontal: grid at page level; **different** horizontal gaps inside components by relationship.

Full tables and Mantine mapping: [spacing-hierarchy](spacing-hierarchy.md).

## Alignment

| Surface | Guideline |
| ------- | --------- |
| Text | One left visual origin for title + body |
| Form | Colon or fixed label width — faster scan |
| Numbers | Right-align; aligned decimals for comparison |

Spec: https://ant.design/docs/spec/alignment

## Navigation (global rule)

Anything that tells users **where they are, where to go, how to get there**.

Pitfalls Ant calls out:

- Provide **visual and contextual cues** — avoid lost users
- **Consistent form and behavior**; reduce nav item count to lower learning cost
- **Minimize page transitions** per task — short path between any two pages

### Menu

| Variant | When |
| ------- | ---- |
| **Top navigation** | Landing / consumer; **2–7** first-level items; labels **&lt; 15** chars |
| **Side navigation** | Multi-level, operation-intensive, dashboard admin; extensible labels; scroll when needed |

Enterprise ops default in this skill: **side primary nav** + contextual page header — [layout-design](layout-design.md), [navigation-admin-ia](navigation-admin-ia.md).

### Breadcrumb

- Shows hierarchy; depth shown **≤ 3** ideal, **≤ 5** max
- **Avoid** when page already has sufficient nav context

### Tabs

Categorize content without full route change.

| Type | Scope |
| ---- | ----- |
| Basic | Whole-page core modes |
| Card | Bordered fragment of page |
| Pill | Small local switcher |
| Vertical | Many categories |

Labels **&lt; 15** characters when possible.

### Steps

Predefined workflow; horizontal for **2–4** steps (titles **&lt; 12** chars); vertical for long or dynamic flows.

Maps to [multi-step-flows](multi-step-flows.md).

### Pagination

Expose total, position, remainder; customizable page size on large sets; mini/simple variants inside cards or tables.

## Pattern catalog (research templates)

| Pattern | Enterprise use | Local |
| ------- | ---------------- | ----- |
| List page | Queues, admin tables | P1 [page-templates](page-templates.md) |
| Detail page | Single record | P2 |
| Form page | Create/edit | P3 |
| Workbench | Multi-pane operations | P4 [layout-design](layout-design.md) |
| Result page | Post-action outcome | P6 |
| Exception page | 403/404/500 | P7 |
| Document / visualization | Reports | [dashboards-and-viz](dashboards-and-viz.md) |

## Global interaction rules (names only)

| Rule | Local |
| ---- | ----- |
| Make it Direct | [page-templates](page-templates.md), [overlays-decision-tree](overlays-decision-tree.md) |
| Stay on the Page | [layout-design](layout-design.md), [feedback-states](feedback-states.md) |
| Keep it Lightweight | Eight principles in SKILL, [visual-foundations](visual-foundations.md) |
| Provide an Invitation | Empty states in [page-templates](page-templates.md) |
| Use Transition | [motion-feedback](motion-feedback.md) |
| React Immediately | [notifications-and-messaging](notifications-and-messaging.md) |

Full index: [ant-global-rules-index](ant-global-rules-index.md).

## Apply with Mantine / non-Ant UI

| Take | Skip |
| ---- | ---- |
| Values, proximity, layout grid, nav IA, template names | Pixel-copying Ant Pro chrome |
| Spacing tiers and 8px rhythm | Assuming Ant React component defaults without theme binding |
| List/detail/workbench vocabulary | Control-level quirks that fight your bound theme |

For sample-admin catalog Mantine: [project-binding-compliance-mantine](examples/project-binding-compliance-mantine.md).