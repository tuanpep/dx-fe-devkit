# Module UI — component packages

Use inside **`modules/<product>/ui/<role>/`** after [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md) role folders exist (`pickers/`, `actions/`, `display/`, `dialogs/`, …).

## Problem

Role subfolders fix a flat `module/ui/`, but one **shared primitive** (async lookup select, confirm flow, import wizard, data table chrome) still spreads across many siblings at the **role root**:

```text
ui/<role>/
  Primitive.tsx
  PrimitivePanel.tsx
  primitiveTypes.ts
  usePrimitiveState.ts
  primitiveLayout.ts
  …
```

That is a **flat role carpet** — hard to navigate and easy to break with partial moves.

## Component package

A **package** is one cohesive primitive with a **single public entry** at the role root:

```text
ui/<role>/
  Primitive.tsx              ← public entry: implementation OR thin re-export
  WrapperA.tsx               ← domain/product wrapper (sibling)
  WrapperB.tsx
  <kebab-package>/           ← folder name = primitive, kebab-case
    Primitive.tsx            ← implementation when entry is re-export-only
    PrimitivePanel.tsx
    PrimitiveTrigger.tsx
    primitiveTypes.ts
    usePrimitiveState.ts
    *.spec.ts
```

| Rule | Detail |
| ---- | ------ |
| **Folder name** | `kebab-case`; names the **primitive**, not a product feature |
| **Public entry** | File at **`ui/<role>/<PascalName>.tsx`** (or repo convention) — only what cross-feature consumers need |
| **Feature imports** | `…/ui/<role>/<PascalName>` — **not** `…/<kebab-package>/…` internals |
| **Wrappers** | Product-specific compositions stay **siblings**; import the public entry |
| **Cross-role** | Package code reaches sibling roles via `../../<other-role>/…` (up to `ui/`, then into role) |
| **Tests** | Specs colocated in the package; fix relative `jest.mock` paths after moves |
| **Barrel** | Optional `index.ts` inside package only if repo/Jest requires it — default to explicit files |

**Re-export pattern** (stable paths after extract):

```typescript
// ui/<role>/Primitive.tsx
export { Primitive, type PrimitiveProps } from './<kebab-package>/Primitive'
```

## When to create a package

Stop at first match:

1. **New primitive** with multiple parts (subcomponents + hook/state + types) → `role/<kebab>/` from day one.
2. **Existing carpet:** **≥ 5** files clearly owned by one export (shared name prefix, or import graph internal to the cluster) → one package PR.
3. **Role audit:** **≥ 8** implementation files at `role/` root (exclude specs, one-line re-exports) → **M-UI-FLAT**; if a cluster exists → **M-UI-PACKAGE**.

Do **not** bundle unrelated one-file widgets. Do **not** nest packages without a second primitive boundary.

## Detecting a cluster (audit)

Heuristics (any two suggests one package):

- Same **PascalCase prefix** on ≥3 files (`Foo`, `FooPanel`, `FooTrigger`).
- Same **camelCase prefix** on types/hooks (`fooTypes`, `useFooState`).
- Import graph: only `ui/` wrappers + files inside the cluster consume these modules.

Generic auditor IDs: [review-auditor.md](review-auditor.md) § Phase 5b, [depth-and-anti-flatten.md](depth-and-anti-flatten.md) § module ui role depth.

## Anti-patterns

| Pattern | Fix |
| ------- | --- |
| Feature imports `…/<kebab-package>/use*State` | Keep hook internal or export via public entry deliberately |
| Implementation duplicated at role root and in package | Role root = re-export only |
| Move without updating mocks / `../../` paths | Pair package PR with spec import fixes |
| Feature name in package folder | Belongs in **feature** `ui/`, not module shell |

## Relation to feature layers

| Location | Owns |
| -------- | ---- |
| Feature `ui/` | Screens, tables, forms for one capability |
| Module `ui/<role>/` | Chrome reused by **≥ 2** features |
| Module `ui/<role>/<package>/` | One reusable primitive + internals |
| Workspace shared UI lib | Second **product module** needs the primitive |

## Related

- [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md)
- [review-auditor.md](review-auditor.md) § Phase 5b
- [refactoring-playbook.md](refactoring-playbook.md) § component package
- [project-binding.md](project-binding.md) — repo examples
