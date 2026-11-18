# Pattern vocabulary (expanded)

Canonical names aligned with Ant [overview](https://ant.design/docs/spec/overview) and `research-*` templates; ERP/HCM product vocabulary. Index: [ant-spec-index](ant-spec-index.md).

## Page archetypes

| ID | Name | Primary goal | Key affordances |
| -- | ---- | ------------ | ---------------- |
| P1 | **Queue / list** | Find and act on many | Toolbar, filters, table, pagination, bulk |
| P2 | **Object detail** | Understand one record | Back, title, sections, workflow actions |
| P3 | **Form (create/edit)** | Valid entry | Sections, validation, save/cancel |
| P4 | **Workbench** | Multi-object context | Master-detail, optional third pane |
| P5 | **Settings / admin** | Rare configuration | Section nav, search, role scope |
| P6 | **Result** | Post-submit clarity | Outcome, next step CTA |
| P7 | **Exception** | Failure recovery | Reason, fix, escape hatch |

## State dimensions (orthogonal to page type)

| Dimension | Values |
| --------- | ------ |
| Permission | allowed / read-only / hidden |
| Data | loading / ready / stale-refresh |
| Outcome | empty-global / empty-filtered / error |
| Workflow | server states only—no client fiction |

## Navigation loops (must be designed explicitly)

| Loop | Requirement |
| ---- | ----------- |
| List → detail → back | List **state preserved** when product defines a queue |
| Detail action → stay on detail | Refetch; show toast; no arbitrary redirect |
| Modal filter → apply | Toolbar summary updates; list does not silently reset |
| Settings search → jump | Focus target section |

## Cross-cutting composites

| Composite | Built from |
| --------- | ---------- |
| **Operational module** | P1 + P2 + dialogs (P3 fragments) |
| **Catalog admin** | P1 + P2 + P3 + deactivate confirm |
| **Collaboration rail** | P2 + side panel (comments, exchange) |
| **Import/export** | P1 header menus + progress dialog + preview |

## Ant pattern aliases

| Ant name | ID |
| -------- | -- |
| List page | P1 |
| Detail page | P2 |
| Form page | P3 |
| Workbench | P4 |
| Result / Exception | P6 / P7 |

From a feature brief, pick options with [context-to-choices](context-to-choices.md). Recipes: [page-templates](page-templates.md). Overlay choice: [overlays-decision-tree](overlays-decision-tree.md).
