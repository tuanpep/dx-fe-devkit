# Gap report template

Every gap **must** cite: `dx-ui/references/<file>.md` § concept (not line numbers).

## PR review (short)

```markdown
## UX review — [PR title]

**Scope:** [screens]
**Pattern(s):** P1 / P2 (+ P2a–P2d if detail) / …
**Sibling reference:** [name or n/a]

### Scorecard (0–2)
| Dimension | Score | Note |
|-----------|-------|------|
| 1–13 | | |
| 14 Detail sub-template | — / 0–2 | Required when pattern is P2 |
| 15 Workbench layout | — / 0–2 | Required when pattern is P4 |

### Blockers (P0)
- [ ] [Gap] → ref: `…` → proposed fix (1 sentence)

### Should fix (P1)
- …

### Notes (P2, optional)
- …

**dx-ui refs used:** [list]
```

## Full audit (initiative)

```markdown
## UX gap report — [module / epic]

### Executive summary
[2–3 sentences: consistency, trust, a11y risk]

### Inventory
[Link or embed screen-inventory table]

### Findings by screen

#### [S01] [name]
- **Pattern:** P1 (sub-template: P2b / —)
- **Scorecard:** [table incl. 14–15 when applicable]
- **Gaps:**
  1. **[Tier]** [Observation] — criterion: `dx-ui/...` — **Fix:** [minimal change]

### Cross-cutting gaps
| Theme | Screens | Ref | Single fix? |
| ----- | ------- | --- | ----------- |
| Bounded scroll | S01,S03 | data-tables-density | Shared layout primitive in project binding |

### Refactor phases
[From incremental-refactor.md]

### Verification plan
[From verification.md]
```

## Gap writing rules

| Good | Bad |
| ---- | --- |
| “List resets filters on back; violates queue persistence” | “Improve navigation” |
| Ref `search-and-filters` + `layout-design` | “Make it like Ant Design Pro” |
| One fix per gap | Bundle ten unrelated edits |
| “Tabs on simple detail” without citing P2a vs P2c | Name sub-template + `page-templates` § P2 |
