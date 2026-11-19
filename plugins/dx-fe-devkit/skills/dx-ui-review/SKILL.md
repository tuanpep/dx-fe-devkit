---
name: dx-ui-review
description: >-
  Reviews existing enterprise application UI against dx-ui design
  language and produces evidence-based gap reports and minimal refactoring plans.
  Use when auditing screens, PR UX review, aligning legacy list/detail/form
  flows, fixing layout/feedback/permissions/messaging drift, or planning
  incremental UX refactors. Requires dx-ui for criteria (scorecard dims 14–15
  for P2 detail and P4 workbench); implementation mapping stays in project
  binding skills. Does not prescribe component libraries.
---

# DX product UI — review & refactor

**Criteria source:** `@dx-ui` (all judgments cite a specific reference there).

**This skill:** how to **audit** what exists and **plan** changes—not full design language prose.

## When to use

| Trigger | Mode |
| ------- | ---- |
| PR touches operational UI | Review only |
| Legacy screen inconsistent with siblings | Refactor plan |
| Pre-release module pass | Inventory + phased plan |
| Bug filed as “confusing UX” | Targeted audit on one flow |

## Skill stack

```text
dx-ui                 ← what “good” means (patterns + refs)
dx-ui-review          ← this skill (process + outputs)
<project-binding>     ← optional: routes, primitives, verify commands
```

**Example Mantine binding:** [project-binding-compliance-mantine](../dx-ui/references/examples/project-binding-compliance-mantine.md) — criteria still from `dx-ui` only; implementation from repo binding.

## Workflow

1. **Scope** — screens, routes, or files in scope; out of scope explicit. See [audit-workflow](references/audit-workflow.md).
2. **Inventory** — one row per screen: pattern ID, **P2 sub-template when P2**, primary user job. [screen-inventory](references/screen-inventory.md).
3. **Classify** — P1–P7 per screen via `dx-ui` [context-to-choices](../dx-ui/references/context-to-choices.md); for **P2**, name **P2a–P2d** sub-template; load matching `@dx-ui` refs (layout, templates, overlays).
4. **Score** — `dx-ui` → [design-review-scorecard](../dx-ui/references/design-review-scorecard.md) per screen or flow (rows **14–15** when pattern is P2 / P4).
5. **Gap report** — [gap-report-template](references/gap-report-template.md); every gap links `dx-ui/references/<file>.md`.
6. **Prioritize** — [refactor-tiers](references/refactor-tiers.md): P0 blockers → P1 alignment → P2 polish.
7. **Plan diff** — minimal changes; no drive-by refactors. [incremental-refactor](references/incremental-refactor.md).
8. **Verify** — [verification](references/verification.md); re-score changed screens.

Track follow-up work in the product issue tracker (e.g. `bd` where the repo uses it).

## Review-only output (PR)

Use the **short** sections in [gap-report-template](references/gap-report-template.md) “PR review”.

## Refactor output (initiative)

Use **full** gap report + phased table in [incremental-refactor](references/incremental-refactor.md).

## Agent rules

- **Read** relevant `dx-ui` reference **before** scoring—not from memory.
- Compare to **another screen with the same job** in the product when one exists (sibling), not an invented layout.
- Propose **smallest** change that fixes the gap; separate P2 unless user asks for polish pass.
- Do not rename or swap **component library** APIs in the UX plan—that belongs in implementation with project binding.
- Do not change **business behavior** without domain/product spec.

## Anti-patterns (this skill)

| Avoid | Do instead |
| ----- | ---------- |
| Generic “improve UX” bullets | Scored dimensions + cited ref |
| Rewrite entire page for one P1 gap | Tiered plan |
| Mixing code architecture into UX report | Pointer to project structure skill at implement time |
| Scoring without keyboard/empty/error check | [verification](references/verification.md) minimum |

## Examples

**List loses filters on back from detail** — P1 navigation loop; score dim 2 low; fix: persist query state; ref `dx-ui` search-and-filters + layout-design; tier P1.

**Error toast only “Failed”** — microcopy + notifications; tier P0 if blocks recovery.

**Primary record opens in modal** — overlays-decision-tree violation; tier P0 or P1 depending on product spec.

**Approval detail in tabs only** — P2 classified but sub-template wrong; score dim 14 at 0; fix: P2b document layout + workflow actions in header/footer; ref `page-templates` § P2b; tier P1.

**Login lands on full data table** — mislabeled P4; score dim 1/15 low; fix: hub modules (5–9) + route to P1 list; ref `page-templates` § P4; tier P1.
