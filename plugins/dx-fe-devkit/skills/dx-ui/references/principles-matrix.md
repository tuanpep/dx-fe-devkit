# Ant Design values → operational criteria

Spec: [values](https://ant.design/docs/spec/values). Depth: [ant-design-deep](ant-design-deep.md). Index: [ant-spec-index](ant-spec-index.md).

## Four Ant values (review lens)

| Value | Designer stake | User stake | Ship as |
| ----- | -------------- | ---------- | ------- |
| **Natural** | Visual clarity; interaction matches task mental model | Low cognitive cost | Scannable layout; icons + labels where meaning needs both channels |
| **Certain** | Modular rules; restrained chrome | Same patterns across surfaces | Design-system tokens; documented page template per job |
| **Meaningful** | Clear goals; immediate feedback | Mission over UI chrome | One primary action per region; async states that explain next step |
| **Growing** | Discoverable depth | User skill can grow with product | Progressive disclosure; invitation on empty states |

## Eight convergent principles (this skill)

Maps Ant global rules and cross-cutting refs to review tests — see SKILL.md table. Operational translation:

| Principle | Ship as |
| --------- | ------- |
| Focus | One primary job per screen; one primary action per region; defer secondary to overflow/menus |
| Familiarity | Same template for the same job across modules |
| Trust | Server truth; confirm destroy; audit-friendly labels |
| Proximity | T0/T1/T2 tiers; space/border before elevation — [spacing-hierarchy](spacing-hierarchy.md) |
| Progressive depth | Essentials in default view; advanced filters/fields behind disclosure |
| Feedback | Unified async wrapper for list/detail loads |
| A11y | WCAG 2.1 AA floor — [accessibility-wcag](accessibility-wcag.md) |
| Restraint | One density per page; **no unnecessary hints/help**; remove chrome that does not serve the job |

## Product-level tensions (document in binding)

| Topic | Resolution |
| ----- | ---------- |
| Page background | White canvas vs grey-card sites — pick one per product |
| Density | Match sibling screens for the same role |
| Brand personality | Patterns and tokens over pixel-copying vendor chrome |