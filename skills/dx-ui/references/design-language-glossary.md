# Design language glossary

Neutral terms used across this skill. Use in specs and reviews; map to your design system in a project binding skill.

| Term | Meaning |
| ---- | ------- |
| **Application shell** | Persistent chrome: nav, header, user menu |
| **Page header** | Title region and primary page-level actions |
| **Toolbar** | Search, filters, bulk actions above a data set |
| **Queue / list** | Paginated or scrollable collection users triage (P1) |
| **Object detail** | Single record primary view (P2) |
| **Workbench** | Multi-pane layout: selection + detail + context (P4) |
| **Overlay** | Dialog, drawer, popover, menu—floats above page |
| **Panel** | Non-blocking side region beside main content |
| **Design token** | Semantic variable for color, spacing, type, elevation |
| **Proximity** | Spacing encodes which items belong together |
| **Bounded scroll** | Overflow contained in a region, not the whole viewport |
| **Main landmark** | Primary content region of a route (one per page) |
| **Scroll contract** | Which regions scroll on which axes—documented per template |
| **Async surface** | UI that switches among loading, ready, empty, error |
| **Server-owned state** | Workflow status from API; UI displays, does not invent |
| **Reason + fix** | Error pattern: what failed + what user can do |
| **Progressive disclosure** | Simple default; advanced controls on demand |

## Pattern IDs

P1 List · P2 Detail · P3 Form · P4 Workbench · P5 Settings · P6 Result · P7 Exception

See [pattern-vocabulary](pattern-vocabulary.md).
