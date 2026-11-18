# Project binding template (out of scope for this skill)

**dx-ui** stays library-agnostic. Each product repository should maintain its **own** skill or AGENTS section that maps generic patterns to:

| Map | Examples of what to record (product-specific) |
| --- | --------------------------------------------- |
| Design system package | Table, form, button, dialog components |
| Layout tokens | Scroll container classes, spacing scale |
| IAM / permissions | How actions hide or disable |
| Routes | URL structure for list and detail |
| Verify | Lint, build, manual test port |
| Domain UX | Business rules → screen behavior |
| Ship scope | Features blocked without approval |

Do not duplicate vendor design principles here—link `@dx-ui` from the project binding skill instead.

## Suggested project skill shape

```text
<module>-ui-ux/
  SKILL.md              # generic ops patterns + pointer to binding
  references/
    project-binding.md  # paths, primitives, commands (product only)
    screen-patterns.md  # optional per-module routes
    domain-ux.md          # optional BIZ → UX
```

Keep **design language** in `dx-ui`; keep **names and commands** in project binding only.

## Example in this repo

Catalog management (Mantine 8.3.18): [project-binding-compliance-mantine.md](examples/project-binding-compliance-mantine.md) — pairs with an optional glob-scoped Cursor rule and module `AGENTS.md` in the consumer repo.
