# External catalog (cherry-pick)

| Source | Use | Avoid |
| ------ | --- | ----- |
| [Cursor Agent Skills](https://cursor.com/docs/skills) | Layout, progressive references | Replacing your bindings |
| [react-doctor](https://www.react.doctor) | Quality loop | Architecture opinions |
| [PatternsDev/skills](https://github.com/patternsdev/skills) | Hook/compound/presentational patterns | Whole-repo install |
| [PyModel/react-frontend-skills](https://github.com/pymodel/react-frontend-skills) | TanStack Query, testing slices | Next 16 / Tailwind 4 defaults on Mantine repos |
| [mantinedev/skills](https://github.com/mantinedev/skills) | Mantine combobox/form | Overrides module binding |
| Cal.com / Bulletproof React / FSD / TkDodo | Cited in `fe-architecture/references/external-standards-sources.md` | Literal folder copy without binding |

Install CLI (example):

```bash
npx skills add PatternsDev/skills --skill hooks-pattern -a cursor -y
```

Prefer **user-level** install for generic skills; keep **product bindings** in git.