# Audit workflow

## Inputs required

| Input | Why |
| ----- | --- |
| Screen name / route / user job | Classify P1–P7 (+ P2a–P2d when P2) |
| In-scope vs out-of-scope | Prevent scope creep |
| Sibling reference screen (if any) | Familiarity principle |
| Product/domain constraints | No invented rules |

## Steps

### 1. Scope boundary

```markdown
## Scope
- In: [routes or features]
- Out: [explicit]
- Reference sibling: [screen id or “none—use dx-ui template only”]
```

### 2. Per-screen pass (repeat)

| Step | Action |
| ---- | ------ |
| A | Assign pattern ID — `dx-ui` [context-to-choices](../../dx-ui/references/context-to-choices.md) + [pattern-vocabulary](../../dx-ui/references/pattern-vocabulary.md) |
| A2 | If **P2**: name **P2a–P2d** — [page-templates](../../dx-ui/references/page-templates.md) § P2; if **P4**: confirm hub not master–detail |
| B | Sketch regions — layout-design vs actual (text diagram ok) |
| C | Overlay audit — overlays-decision-tree |
| D | States — loading, empty, error, filtered empty — feedback-states |
| E | Toolbar — search, filters, summary — search-and-filters |
| F | Table/form — data-tables-density, forms-validation-ux; compliance impl → [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) |
| G | Permissions — permissions-ux |
| H | Messaging — notifications-and-messaging |
| I | Copy — microcopy-voice sample (errors, buttons) |
| J | A11y spot — accessibility-wcag minimum |
| K | Score — [design-review-scorecard](../../dx-ui/references/design-review-scorecard.md) (include rows **14** / **15** when P2 / P4) |

### 3. Flow-level pass (multi-screen)

| Loop | Check |
| ---- | ----- |
| List → detail → back | Queue persistence |
| Approval detail | P2b workflow actions reachable; not buried in nested tab |
| Save → destination | P6 vs toast appropriate? |
| Bulk job | Progress + summary |
| Home (P4) | Shortcuts drill to P1/P2 routes; tiles fail independently |

### 4. Consolidate

Merge per-screen gaps into [gap-report-template](gap-report-template.md).

### 5. Prioritize

Apply [refactor-tiers](refactor-tiers.md).

## Timeboxing

| Scope size | Depth |
| ---------- | ----- |
| 1 screen | Full A–K |
| 3–5 screens | Full on changed; spot on siblings |
| Whole module | Inventory first; deep sample 2 flows |

## dx-ui map (quick)

| If screen is… | Read first |
| ------------- | ---------- |
| List | page-templates P1, search-and-filters, data-tables-density |
| Detail | page-templates P2 (+ P2a–P2d sub-template), collaboration-surfaces if rail |
| Form | forms-validation-ux, multi-step-flows if stepped |
| Workbench / home | page-templates P4 — not master–detail triage ([layout-design](../../dx-ui/references/layout-design.md)) |
| Settings | page-templates P5, forms-validation-ux |
| App navigation shell | navigation-admin-ia |
| Dashboard / charts | dashboards-and-viz scope check |
| Full Ant slug lookup | `dx-ui` [ant-spec-index](../../dx-ui/references/ant-spec-index.md) when criterion is Ant-specific |
