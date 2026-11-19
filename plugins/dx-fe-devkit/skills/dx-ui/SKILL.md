---
name: dx-ui
description: >-
  Enterprise admin UI design language with Ant Design docs/spec as the SSOT
  (values, proximity, layout grid, navigation, research templates, global rules).
  Page templates, tables, forms, overlays, feedback, spacing tiers, accessibility,
  microcopy, motion, and layout regions. Library-neutral pattern names; map tokens
  in per-repo project bindings (references/project-binding.md).
---

# dx-ui

**Scope:** Signed-in, task-oriented, data-dense applications—not marketing or consumer landing experiences.

**Primary spec:** Ant `docs/spec/*` — start at [ant-spec-index](references/ant-spec-index.md); for values, layout, and spacing use [ant-design-deep](references/ant-design-deep.md) and [spacing-hierarchy](references/spacing-hierarchy.md).

**Boundary:** This skill defines **design language and UX principles only**. It does not name, import, or prescribe any product-specific UI kit, framework package, or repository layout. Map patterns to your design system and engineering conventions in a **project binding skill** (maintained per product).

**Hard mode:** Before layout or components: (1) pick one P1–P7 pattern, (2) name one primary user job for the screen, (3) pick spacing tier (T0/T1/T2) per region. Read the matching reference before proposing layout or copy.

## Read by task

| Task | Reference |
| ---- | --------- |
| **Comprehensive Ant playbook** | [ant-design-comprehensive-guide](references/ant-design-comprehensive-guide.md) |
| **Full Ant `docs/spec/*` map** | [ant-spec-index](references/ant-spec-index.md) |
| Ant doc URLs (quick list) | [design-systems-index](references/design-systems-index.md) |
| Ant values → ship criteria | [principles-matrix](references/principles-matrix.md) |
| Terminology | [design-language-glossary](references/design-language-glossary.md) |
| Ant Design values and layout | [ant-design-deep](references/ant-design-deep.md) |
| Ant global rules → local refs | [ant-global-rules-index](references/ant-global-rules-index.md) |
| Color, type, icons | [visual-foundations](references/visual-foundations.md) |
| Pattern IDs (P1–P7) | [pattern-vocabulary](references/pattern-vocabulary.md) |
| **Feature brief → best choices** | [context-to-choices](references/context-to-choices.md) |
| **Layout: shell, grid, regions, scroll** | [layout-design](references/layout-design.md) |
| Page recipes | [page-templates](references/page-templates.md) |
| Tables and density | [data-tables-density](references/data-tables-density.md) |
| Search, filters, queue persistence | [search-and-filters](references/search-and-filters.md) |
| Multi-select and bulk actions | [selection-and-bulk-actions](references/selection-and-bulk-actions.md) |
| Forms and validation UX | [forms-validation-ux](references/forms-validation-ux.md) |
| Wizards and long create | [multi-step-flows](references/multi-step-flows.md) |
| Permissions hide/disable/read-only | [permissions-ux](references/permissions-ux.md) |
| Toasts, banners, modals for outcomes | [notifications-and-messaging](references/notifications-and-messaging.md) |
| App and admin navigation | [navigation-admin-ia](references/navigation-admin-ia.md) |
| Route vs overlay | [overlays-decision-tree](references/overlays-decision-tree.md) |
| Loading / empty / error | [feedback-states](references/feedback-states.md) |
| Labels, errors, buttons | [microcopy-voice](references/microcopy-voice.md) |
| Locales and string expansion | [locale-and-content](references/locale-and-content.md) |
| WCAG enterprise floor | [accessibility-wcag](references/accessibility-wcag.md) |
| Spacing and hierarchy | [spacing-hierarchy](references/spacing-hierarchy.md) |
| Motion | [motion-feedback](references/motion-feedback.md) |
| Dashboards and charts (scope) | [dashboards-and-viz](references/dashboards-and-viz.md) |
| Comments, rails, activity | [collaboration-surfaces](references/collaboration-surfaces.md) |
| Design review scoring | [design-review-scorecard](references/design-review-scorecard.md) |
| Audit / refactor existing UI | `@dx-ui-review` |
| Attach to your stack (template) | [project-binding-template](references/project-binding-template.md) |
| Active product binding (when present) | [project-binding](references/project-binding.md) |
| **Example: Mantine module binding** | [project-binding-compliance-mantine (example)](references/examples/project-binding-compliance-mantine.md) |

## Spacing tiers (Ant proximity)

Use in reviews and implementation plans before debating pixels.

| Tier | px | Use |
| ---- | -- | --- |
| T0 | 8 | Same visual unit |
| T1 | 16 | Related blocks |
| T2 | 24 | Sections |

Extended steps and token mapping: [spacing-hierarchy](references/spacing-hierarchy.md).

## Design workflow

0. **Playbook** → [ant-design-comprehensive-guide](references/ant-design-comprehensive-guide.md) for Ant decisions and P1–P7 checklists.
1. **Match context → choices** → [context-to-choices](references/context-to-choices.md) (job, P#, surface, density, filters). For **P2 detail**, pick Ant sub-template **P2a–P2d** from [page-templates](references/page-templates.md). Then [pattern-vocabulary](references/pattern-vocabulary.md) + [page-templates](references/page-templates.md). Do not mix list + edit + decide on one screen.
2. **Layout** → [layout-design](references/layout-design.md) (shell, columns, scroll contract) + Ant grid notes in [ant-design-deep](references/ant-design-deep.md).
3. **Surface** → [overlays-decision-tree](references/overlays-decision-tree.md).
4. **Find data** → [search-and-filters](references/search-and-filters.md) (skip heavy filters on fixed work queues).
5. **Density** → one density per page; [data-tables-density](references/data-tables-density.md), [selection-and-bulk-actions](references/selection-and-bulk-actions.md).
6. **Forms** → essentials first; [forms-validation-ux](references/forms-validation-ux.md), [multi-step-flows](references/multi-step-flows.md).
7. **Permissions** → [permissions-ux](references/permissions-ux.md).
8. **States & messaging** → [feedback-states](references/feedback-states.md), [notifications-and-messaging](references/notifications-and-messaging.md).
9. **Visual & language** → space/border before elevation; [visual-foundations](references/visual-foundations.md), [microcopy-voice](references/microcopy-voice.md), [locale-and-content](references/locale-and-content.md).
10. **Accessibility** → [accessibility-wcag](references/accessibility-wcag.md).
11. **Review** → [design-review-scorecard](references/design-review-scorecard.md) (P2/P4: score rows 14–15).

## Eight convergent principles

| # | Principle | Test |
| - | --------- | ---- |
| 1 | **Focus** | One primary job per screen; task completable without decorative noise |
| 2 | **Familiarity** | Same job uses the same pattern across the product |
| 3 | **Trust** | Destructive acts confirmed; errors recoverable |
| 4 | **Proximity** | Grouping visible through spacing, not boxes alone |
| 5 | **Progressive depth** | Default view shows essentials; advanced filters/fields behind disclosure |
| 6 | **Feedback** | Every action has an appropriate result state |
| 7 | **Accessibility** | Keyboard, labels, contrast, non-color status |
| 8 | **Restraint** | No unnecessary hint/help; remove chrome that does not serve the task; space/border over shadow cards |

Ant design values: [ant-design-deep](references/ant-design-deep.md), [principles-matrix](references/principles-matrix.md).

## Agent rules

- **Floorplan first:** from the feature brief, use [context-to-choices](references/context-to-choices.md) and state job + P# + surface + density before any region or component choice.
- Ground recommendations in a **reference file** from this skill.
- Match **existing product patterns** for the same job before inventing a new layout.
- Keep **one density** and **one primary action** per decision surface.
- **Clean copy:** no helper text, info icons, or placeholders-as-labels unless the task fails without them ([microcopy-voice](references/microcopy-voice.md)).
- Do not encode **business rules** in UI without an approved product or domain specification.
- Do not reference **specific component library exports** inside this skill’s guidance—use pattern names (e.g. “data table”, “primary button”) only.

## Quick anti-patterns

| Avoid | See |
| ----- | --- |
| Marketing hero in application shell | [page-templates](references/page-templates.md) |
| Primary entity housed only in a modal | [overlays-decision-tree](references/overlays-decision-tree.md) |
| Mixing jobs on one screen (list + edit + decide) | [page-templates](references/page-templates.md) |
| Mixed density on one page (airy cards + dense table) | [spacing-hierarchy](references/spacing-hierarchy.md), [data-tables-density](references/data-tables-density.md) |
| Cards/shadows for grouping instead of proximity | [visual-foundations](references/visual-foundations.md) |
| Every filter/field visible by default | [forms-validation-ux](references/forms-validation-ux.md), [search-and-filters](references/search-and-filters.md) |
| Helper text / info icons on routine fields | [microcopy-voice](references/microcopy-voice.md) |
| Placeholder used as label or standing help | [microcopy-voice](references/microcopy-voice.md), [forms-validation-ux](references/forms-validation-ux.md) |
| Uniform padding on all edges | [spacing-hierarchy](references/spacing-hierarchy.md) |
| Color-only status; placeholder-only labels | [microcopy-voice](references/microcopy-voice.md), [accessibility-wcag](references/accessibility-wcag.md) |
