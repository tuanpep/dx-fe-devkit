# Review & rename workflow

## New symbol

1. Read [project-binding](project-binding.md) + 3–5 neighbors in same folder.
2. Open task row in [SKILL.md](../SKILL.md).
3. Match verb vocabulary (`fetch` vs `get`) module-wide.
4. File name matches primary export ([files-and-folders](files-and-folders.md)).

## Rename PR scope

- **Mechanical** renames within one module/feature — ok.
- Cross-module public API rename — only when user requested; update imports + barrels.
- Do not rename DB columns in applied migrations ([reference.md](../reference.md)).

## Checklist

```
- [ ] Intent clear without comment?
- [ ] Matches project-binding + neighbors?
- [ ] Boolean is/has/can and on* props?
- [ ] File name matches primary export?
- [ ] Spec suffix matches siblings?
- [ ] API fields match generated types?
- [ ] queryKey includes all queryFn variables?
- [ ] No new feature-root utils.ts / hooks.ts?
```

## Review output template

```markdown
## Summary
[One sentence: consistency with repo + standards]

## Critical
- `symbol` — [issue] → `betterName`

## Suggestions
- ...

## Conventions applied
[project-binding OR external guide]
```

## When not to rename

- Drive-by “cleanup” in unrelated files in same PR as feature work.
- Renaming product terms without product/domain approval.
- Fighting ESLint without binding exception.