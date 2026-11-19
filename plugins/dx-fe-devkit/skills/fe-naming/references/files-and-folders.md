# Files & folders

**Consistency in the parent folder beats global debates.** [project-binding](project-binding.md) records file-casing choice (PascalCase page files vs kebab-case).

## Enterprise slice layout

```text
modules/<product>/                    # kebab-case product id
  features/<kebab-slice>/
    api/        *Api.ts, map*.ts
    data/       queryKeys.ts, queries.ts, mutations.ts
                  data/<entity>/       when slice is large
    domain/     types.ts, actions.ts
                  domain/<entity>/       mirror data segmentation
    ui/         *Page.tsx, *Table.tsx, use*Form.ts
  ui/<role>/<kebab-package>/            shared primitives
  routing/
```

See [fe-architecture depth-and-anti-flatten](../../fe-architecture/references/depth-and-anti-flatten.md).

## File naming by primary export

| Primary export | File (typical admin binding) |
| -------------- | ---------------------------- |
| React page/component | `OrderRecordsPage.tsx` — PascalCase |
| Hook | `useOrderCreateForm.ts` |
| Pure util / map | `mapOrderToFormValues.ts` or `formatOrderStatus.ts` |
| API module | `orderApi.ts` or `ordersApi.ts` — match neighbors |
| Query module | `queries.ts`, `mutations.ts` |
| Barrel | `index.ts` — minimal re-exports only |
| Spec | `OrderRecordsPage.spec.tsx` colocated |

**Forbidden at feature root:** `utils.ts`, `hooks.ts`, `helpers.ts` — use layer folders.

## Directory casing

| Level | Style |
| ----- | ----- |
| Product module, feature slice, ui package | **kebab-case** |
| Layer folders | fixed: `api`, `data`, `domain`, `ui` |
| App / Nx project | per monorepo — binding |

## Page & screen suffixes

| Suffix | Use |
| ------ | --- |
| `*Page.tsx` | Route targets ([code-splitting](../../fe-architecture/references/code-splitting.md)) |
| `*Table.tsx`, `*Filters.tsx` | Extracted UI |
| `*Layout.tsx` | Shell wrapping children |
| `use*Form.ts` | Form hook in `ui/` |

## Legacy

`views/`, flat `components/` — strangler to `features/` without rename-only drive-bys ([fe-architecture layout](../../fe-architecture/references/layout.md)).

## Debates (resolve in binding)

| Topic | Options |
| ----- | ------- |
| Component files | `PascalCase.tsx` vs `order-records-page.tsx` |
| Test suffix | `*.spec.tsx` vs `*.test.tsx` |

Pick one per repo; never mix in same folder.