# Hooks & components

## Component names

- PascalCase noun phrase describing **user-visible role**: `OrderRecordsPage`, `ComplianceFormPageFrame`.
- Not `OrderRecordsComponent`, `PageOrder` (redundant suffix unless module pattern requires `Page`).
- One default export component per file when file is PascalCase-named for that export.

## Splitting

| Extract when | Name pattern |
| ------------ | ------------ |
| Table on page | `OrderRecordsTable.tsx` |
| Toolbar | `OrderRecordsToolbar.tsx` |
| Row actions | `OrderRowActions.tsx` |
| Page > ~250 lines | split before inventing `*PageInner` |

## Hook names

| Kind | Pattern | Layer |
| ---- | ------- | ----- |
| Query | `useOrderQuery`, `useOrderListQuery` | `data/` |
| Mutation | `useCreateOrderMutation` | `data/` |
| Screen composition | `useOrderListPageState` | `ui/` if thin; else split |
| Form | `useOrderCreateForm` | `ui/` |
| Domain (rare) | `use` only when returns React state — prefer pure functions in `domain/` |

**Rules:** Only real hooks use `use` prefix (Rules of Hooks). Do not name plain functions `useFoo` outside React.

## Props types

- Colocate `OrderTableProps` above component or in `types.ts` when shared within slice.
- Extend design-system props with `Omit`/`Pick` — name `OrderTableProps`, not `Props`.

## Children / slots

- `renderActions`, `footer`, `toolbar` — descriptive slot props.
- Avoid `comp`, `child`, `node` in public props unless binding wrapper pattern.

## Module shared UI

Under `modules/<product>/ui/<role>/<kebab>/`:

- Package folder kebab-case: `date-time-display/`
- Export PascalCase from `index.ts`: `ComplianceDateTimeDisplay`

See [module-ui-component-packages](../../fe-architecture/references/module-ui-component-packages.md).