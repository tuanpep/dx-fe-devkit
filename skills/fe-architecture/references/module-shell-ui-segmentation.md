# Module shell — large `ui/` and feature splitting

When `module/ui/` or a single feature grows large.

## `ui/` vs `shared/` vs `data/`

| Folder | Job |
| ------ | --- |
| `ui/` | JSX chrome, pickers, toolbars across features |
| `shared/` | Pure TS — no query layer |
| `data/` | Cross-feature invalidation, shared list hooks |

Pure logic does not belong in `module/ui/`.

## Role subfolders (~25+ flat files)

```text
ui/layout/  ui/actions/  ui/pickers/  ui/display/
ui/toolbar/  ui/import/  ui/fixtures/
```

Use **role** names, not feature names. New files use subfolders once segmentation exists. Avoid cosmetic-only moves if module `AGENTS.md` defers them.

## Component packages (second level)

When one primitive spans many files inside a role folder, add a **kebab-case** subfolder and a **public entry** at the role root. Full rules: [module-ui-component-packages.md](module-ui-component-packages.md).

```text
ui/<role>/Primitive.tsx       → public entry (impl or re-export)
ui/<role>/<kebab-package>/    → implementation cluster
ui/<role>/Wrapper.tsx         → product wrapper (sibling)
```

## Mega-feature vs new feature

Keep one large feature when: one team owns writes; one API family; routes stay cohesive.

Split when: separate nav/cadence; chronic private cross-imports; sub-area would exceed ~40 UI files with its own public API.

Do not split only for file count.

## Shell change checklist

- [ ] No business screen only under `module/ui/`.
- [ ] Shell uses feature `index.ts`, not private paths.
- [ ] Cross-feature invalidation in module `data/` with public keys.
- [ ] Large `ui/` uses role subfolders for new work.
