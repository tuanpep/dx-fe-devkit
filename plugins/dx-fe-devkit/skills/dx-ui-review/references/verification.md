# Verification after UX refactor

Re-run after changes; compare to pre-change scorecard.

## Minimum manual (per changed screen)

| Check | Pass criteria |
| ----- | ------------- |
| Keyboard | Tab through primary path; activate main actions |
| List loop | Open detail (if applicable) → back → filters/page preserved per spec |
| Detail sub-template | P2 matches job (e.g. approval → P2b actions visible; low complexity → P2a not over-tabbed) |
| Workbench (P4) | 5–9 modules; module errors isolated; not a disguised full list home |
| Empty | Global empty vs filtered empty distinguishable |
| Error | Recoverable error shows reason+fix + retry if applicable |
| Overlay | Escape dismisses non-blocking overlays; focus returns |
| Zoom 200% | No loss of primary function |

## Scorecard re-run

Full `dx-ui` [design-review-scorecard](../../dx-ui/references/design-review-scorecard.md) for changed screens; attach in PR. Include dimensions **14** (P2) and **15** (P4) when those patterns changed.

## Regression scope

| Change type | Also smoke-test |
| ----------- | --------------- |
| List toolbar | Sort, pagination, clear filters |
| Permissions | Second role if P0/P1 touched IAM UX |
| Bulk | Select-all scope message |

## Product verify commands

Run gates listed in **project binding** (lint, build, module scripts)—not defined here.

**sample-admin catalog Mantine:** [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) § Verification.

## Evidence for handoff

- Before/after notes or screenshots
- Updated scorecard table
- List of `dx-ui` refs applied
