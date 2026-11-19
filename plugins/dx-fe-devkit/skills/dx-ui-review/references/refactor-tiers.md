# Refactor tiers

Prioritize **user risk** and **consistency**, not visual novelty.

## P0 — Blockers (fix before merge / release)

| Category | Examples |
| -------- | -------- |
| Trust | Client workflow state; permission bypass |
| Recovery | No error path; data loss on failed save |
| A11y | Keyboard trap; no labels |
| Safety | Destructive without confirm |

Scorecard dimension at **0** on trust, a11y, or feedback usually → P0.

## P1 — Alignment (should fix in same initiative)

| Category | Examples |
| -------- | -------- |
| Pattern | Detail in modal for primary entity |
| Detail sub-template | Approval on P2c tabs only; P2a content in multi-card chrome — [page-templates](../../dx-ui/references/page-templates.md) § P2 |
| Workbench | P4 with embedded primary list or &gt;9 modules — use P1 route + hub tiles |
| Queue | Filter/page not persisted when spec requires |
| Messaging | Wrong channel (toast for validation) |
| Copy | No reason+fix |
| Layout | Page-level horizontal scroll for table |

Scorecard **1** on template fit, **detail sub-template (14)**, **workbench (15)**, navigation loop, search/filters, permissions, messaging.

## P2 — Polish (defer unless cheap)

| Category | Examples |
| -------- | -------- |
| Spacing token drift | Uniform padding |
| Motion | Decorative animation |
| Micro copy tone | Minor wording |
| Visual foundations | Icon without tooltip on rare action |

Scorecard **1** on spacing only; **2** on critical dims → P2 backlog.

## Effort cap per PR

| Tier | Guideline |
| ---- | --------- |
| P0 | Any size justified |
| P1 | Prefer ≤1 pattern family per PR (e.g. all list toolbars) |
| P2 | Only if touched for P0/P1 |

## Conflicts

If product spec contradicts `dx-ui`, **spec wins**—record as documented exception in gap report, not silent code drift.
