# Incremental refactor

Align legacy UI without big-bang rewrites.

## Phasing model

| Phase | Goal | Typical scope |
| ----- | ---- | ------------- |
| **0** | Inventory + score sample flows | Read-only |
| **1** | P0 across module | Trust, a11y, errors |
| **2** | P1 per **job cluster** | All P1 lists, then all P1 details |
| **3** | Shared primitives (project binding) | One async wrapper, one toolbar pattern; compliance → [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) |
| **4** | P2 polish | Optional |

## Strangler order (recommended)

1. **New screens** — full `dx-ui` compliance from day one.
2. **High-traffic lists** — toolbar, scroll contract, states.
3. **Details** — route-based, permissions, messaging.
4. **Rare settings** — last.

Do not start with shared library extraction unless two screens already share the same gap.

## One pattern family per iteration

| Iteration | Family | dx-ui refs |
| --------- | ------ | ------------------ |
| A | List chrome | page-templates P1, layout-design, search-and-filters |
| B | Async states | feedback-states, notifications-and-messaging |
| C | Tables | data-tables-density, selection-and-bulk-actions |
| D | Forms | forms-validation-ux, multi-step-flows |

Complete verification for family A before starting B on the same screens if possible.

## Phase table template

| Phase | Work | Screens | Exit criteria |
| ----- | ---- | ------- | ------------- |
| 1 | P0 gaps | S01–S05 | Scorecard no 0 on trust/a11y/feedback |
| 2a | List alignment | S01,S04 | Dim 2 on template, navigation, search |

## Handoff to implementation

UX plan ends with:

- Gap IDs → tier → file/area **hint** (not mandatory file paths unless project binding provides them)
- “Implement using project binding skill + structure conventions”
- Verification steps from [verification](verification.md)
