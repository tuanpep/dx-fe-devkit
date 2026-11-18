# Audit workflow

## Inputs required

| Input | Why |
| ----- | --- |
| Screen name / route / user job | Classify P1–P7 |
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
| A | Assign pattern ID — `dx-ui` pattern-vocabulary |
| B | Sketch regions — layout-design vs actual (text diagram ok) |
| C | Overlay audit — overlays-decision-tree |
| D | States — loading, empty, error, filtered empty — feedback-states |
| E | Toolbar — search, filters, summary — search-and-filters |
| F | Table/form — data-tables-density, forms-validation-ux; compliance impl → [project-binding-compliance-mantine](../../dx-ui/references/examples/project-binding-compliance-mantine.md) |
| G | Permissions — permissions-ux |
| H | Messaging — notifications-and-messaging |
| I | Copy — microcopy-voice sample (errors, buttons) |
| J | A11y spot — accessibility-wcag minimum |
| K | Score — design-review-scorecard |

### 3. Flow-level pass (multi-screen)

| Loop | Check |
| ---- | ----- |
| List → detail → back | Queue persistence |
| Save → destination | P6 vs toast appropriate? |
| Bulk job | Progress + summary |

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
| Detail | page-templates P2, collaboration-surfaces if rail |
| Form | forms-validation-ux, multi-step-flows if stepped |
| Settings | navigation-admin-ia P5 |
| Dashboard | dashboards-and-viz scope check |
