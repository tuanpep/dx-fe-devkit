# sample-admin — catalog Mantine binding

Maps **dx-ui** patterns to a sample **catalog-management** module after a Mantine migration. Design language stays in `@dx-ui`; this file names paths, primitives, and verify commands. Copy into the consumer repo and replace module names/paths.

| Also read | Purpose |
| --------- | ------- |
| Module `AGENTS.md` (in consumer repo) | Routes, domain UX, ship scope |
| Glob-scoped Cursor rule (optional) | Agent constraints under `catalog-management/**` |
| [@fe-architecture project-binding](../../fe-architecture/references/project-binding.md) | Module/feature layout, not visual primitives |

## Skill stack (catalog UI work)

```text
dx-ui                          ← what “good” means (library-neutral)
dx-ui-review                   ← audit / gap report process (when reviewing)
project-binding-compliance-mantine  ← this file (Mantine + module chrome)
fe-architecture              ← where files live (api/data/domain/ui)
catalog-management AGENTS.md    ← product boundaries and ops UX
```

## Visual stack

| Layer | Choice |
| ----- | ------ |
| Design principles | `@dx-ui` only — pattern names, not Ant React component imports in UX specs |
| Component library | **Mantine 8.3.18** — keep all `@mantine/*` on the same version |
| Imports | Prefer `@mantine/core`, `@mantine/dates` directly in implementation |
| Other host modules | Unchanged `@acme-ui/*` defaults — do not restyle the host |
| Forms | **React Hook Form** + module `ControlledField` wrapping Mantine inputs |
| Tables | **TanStack Table** state + **`DataTable`** (`ui/display/table/DataTable.tsx`) rendering Mantine `Table` |
| Dates | `@mantine/dates` + `DatesProvider` locale from app i18n inside theme provider |

## Theme boundary (Module Federation)

| Piece | Path / contract |
| ----- | ----------------- |
| Provider | `ui/theme/ComplianceMantineProvider.tsx` — route-level wrapper above lazy compliance pages; `MantineThemeProvider inherit={false}` prevents parent-theme inheritance |
| Scoped root class | `.compliance-mantine` on shell + dedicated portal target |
| CSS | `ui/theme/mantine.css` — **unlayered component** imports plus a compliance-scoped baseline; no global body reset or root-variable stylesheet on host |
| Variables | `cssVariablesSelector=".compliance-mantine"`; `withGlobalClasses={false}` |
| Portals | `Portal` default `className: compliance-mantine`; sibling portal root for clipped overlays |
| z-index | Modal 1300, Menu/Popover 1400, Tooltip 1500 (theme defaults) |
| Tooltip | Theme defaults: `openDelay` 500 / `closeDelay` 100, `offset` 4, `radius="sm"`, focus+hover events, `portalProps` → `.compliance-mantine`, Ant SM font/padding; use `Tooltip.Group` for adjacent icon actions; rich/interactive content → `Popover` |
| Elevated dropdowns | Theme defaults on `Menu` / `Popover` / `Combobox` / `Select`/`MultiSelect` `comboboxProps` / `DateInput` `popoverProps`: Ant `colorBgElevated` + `boxShadowSecondary` (theme `shadows.md`) + `borderRadiusLG` (`radius="lg"`) + `paddingXXS`; option hover/active via `mantine.css` `--compliance-control-item-bg-*` |

Do not add another full Mantine stylesheet import at feature level. Do not add host-library compatibility adapters around Mantine primitives.

Unlayered component imports prevent unlayered shell resets from automatically outranking Mantine's cascade layer. This is not a CSS sandbox: host `!important` rules, higher-specificity selectors, root `rem` sizing and ancestor clipping can still affect compliance. `withGlobalClasses={false}` disables responsive/color-scheme utility classes; do not use `hiddenFrom`, `visibleFrom`, `lightHidden` or `darkHidden` without revisiting that configuration.

## Spacing (Ant → Mantine)

Design language: [spacing-hierarchy](../../dx-ui/references/spacing-hierarchy.md) (T0/T1/T2). Tokens: `ui/theme/complianceAntdTokens.ts` (regenerate via `scripts/generate-antd-tokens.mjs`).

| dx-ui tier | Ant scalar | Mantine `theme.spacing` | Typical compliance usage |
| ---------- | ---------- | ------------------------- | ------------------------ |
| T0 | `paddingXS` (8) | `xs` | `Stack`/`Group` in toolbar, filters, in-card rows |
| compact | `paddingSM` (12) | `sm` | Empty state, tight grids (`SimpleGrid spacing="sm"`) |
| T1 | `padding` (16) | `md` | `CompliancePageHeader` action row |
| T2 | `paddingLG` (24) | `lg` | `ComplianceLayout` page stack, between detail sections |
| section tail | — | `xl` (32) | Rare shell tail only — do not default every stack to `xl` |

**Rules:** Prefer parent `Stack gap` over ad-hoc `mt` chains. Replace legacy Tailwind `gap-2`/`gap-3` in touched files with Mantine keys from the table above. Page horizontal padding should stay T1–T2 unless binding adds a shell constant.

Margins (`marginXS` … `marginLG`) mirror padding scalars — use for section **outside** a card when `Stack` gap is not available.

## Layout and scroll (`dx-ui` → layout-design, data-tables-density)

| Concern | Implementation |
| ------- | ---------------- |
| Page shell | `ComplianceLayout` — `Stack`, horizontal clip on shell (`overflow-x: clip`) |
| Layout constants | `ui/layout/complianceResponsiveLayout.ts` |
| Page shell class | `compliance-page-container` on `ComplianceLayout` |
| Detail frame | `ComplianceDetailPageFrame` (`ui/layout/ComplianceRecordExchangeLayout.tsx`) uses `compliancePageFrameStyle` for full width; **no** local max-width caps |
| Form frame | `ComplianceFormPageFrame` uses `compliancePageFrameStyle` for full width; **no** local max-width caps |
| Table horizontal scroll | `DataTable` confines overflow to its scroll host |
| List chrome | `ListToolbar`, `CompliancePageHeader`, `ComplianceFilterSection`, `ComplianceFilterDateRange` |
| Detail sections | `ComplianceDetailSection` |
| Empty / loading | `EmptyState`, `ComplianceSkeletons` |

Queue context (search, filters, page) must survive open/return. Case **detail** stays on its route, not in a modal.

## Page recipes (CRUD)

Canonical region stacks for catalog CRUD. Criteria: `@dx-ui` [page-templates](page-templates.md) + [layout-design](layout-design.md). Overlay policy stays in AGENTS.md (group dialogs; record detail route; document-prep fullscreen).

| ID | Pattern | Region stack |
| -- | ------- | ------------ |
| **R1** | List / queue (P1) | `ComplianceLayout` → `CompliancePageHeader` (title + module actions; create leftmost among positives) → optional context strip (status/scope) → `ListToolbar` → `ComplianceResultRegion` + `ComplianceQueryResults` → table (bounded scroll) |
| **R2** | Object detail (P2) | `ComplianceLayout` → `ComplianceDetailPageFrame` wide → `ComplianceBackAction` → detail header (id + status + trailing actions) → `ComplianceDetailSection` stack (T2 between) |
| **R3** | Detail + rail (P2x) | `ComplianceRecordDetailPageShell` only when exchange/comments rail is in product scope (non-draft case, explanations) |
| **R4** | Form create/edit (P3) | `ComplianceLayout` → `ComplianceFormPageFrame` (`backAction` + `title` T0; body T1) → sections (T2) → `ComplianceFormActions`; dirty-back confirm on long creates/edits |
| **R5** | Nested queue on detail | Inside `ComplianceDetailSection`: stacked `ListToolbar` → `ComplianceQueryResults` + table; section create CTA in section `actions` |
| **X1** | Create workbench | Order create: sticky header (back + title + Save draft/Submit), scroll body, full width (same as R4); dirty-back confirm |
| **X2** | Fullscreen document prep | `ComplianceDialog` `fullScreen` from order list — not a detail substitute |

**Action placement:** list module actions → header; detail edit/workflow → detail header trailing; form submit → `ComplianceFormActions` or X1 sticky; nested create → section actions.

**Title scale:** lists use `CompliancePageHeader` (h1→h3 size); detail/form identifiers use `Title` order={1} size="h2" (or create sticky header h1→h3).

## Pattern → module primitive

| dx-ui area | Module location | Mantine / notes |
| ---------- | --------------- | ----------------- |
| P1 list + toolbar | `ui/layout/ListToolbar.tsx`, `CompliancePageHeader` | `Group`, `Stack`, `TextInput` |
| P2 detail frame | `ComplianceDetailPageFrame` in `ComplianceRecordExchangeLayout.tsx` | full-width SSOT (`wide`/`narrow` both `max-w-full`) |
| P2x detail + rail | `ComplianceRecordDetailPageShell` | split + exchange rail |
| P3 form frame | `ComplianceFormPageFrame` in `ComplianceRecordExchangeLayout.tsx` | `compliancePageFrameStyle` |
| Data table | `ui/display/table/ComplianceDataTable.tsx` → `DataTable.tsx` | `Table`, `Pagination`, `Select`, `Loader` |
| Table header chrome | Theme `Table` `th` + `COMPLIANCE_TABLE_HEADER_*` in `complianceTable.ts` | `fw` 600, `sm`, muted `#f9fafb`, sentence case; `ComplianceServerSortHeader` / sort buttons must match |
| Table cell text / tooltips | `ComplianceTableText.tsx`, `complianceTable.ts` | `Tooltip`; avoid fighting Mantine cell styles |
| Identifier links | `ComplianceCodeLink.tsx` | `Anchor` (blue identifier pattern) |
| Status display (lists + detail) | Feature label/color metadata + `ComplianceStatusText` / `ComplianceDisplays` | Same semantic values (status, conclusion, handling, level, penalties, overdue) as colored text (+ optional indicator) everywhere |
| List status KPI strip | `ComplianceStatusSummary` (+ feature wrappers) | Filterable count cards; colors from status display SSOT; optional “All” card |
| Badge chips (only) | Removable tokens / overflow counts / identifier tags | e.g. recipient chips, async-select overflow, code tags — not workflow status |
| Datetime | `ComplianceDateTimeDisplay.tsx`, `formatDateTime.ts` | Display layer; locale via i18n |
| Primary / form actions | `ComplianceAction.tsx`, `ComplianceFormActions.tsx` | `Button` |
| Icon row actions | `ComplianceIconAction.tsx` | `ActionIcon` + accessible name |
| Back navigation | `ComplianceBackAction.tsx` | Labelled control, not icon-only |
| Permission-gated control | `PermissionButton.tsx` | Behavior owner — keep when migrating visuals |
| Confirm destructive | `ComplianceConfirmDialog.tsx`, `deactivateConfirm.ts` | Mantine `Modal` pattern |
| General modal / fullscreen workbench | `ComplianceDialog.tsx` | `Modal` (`fullScreen` for document-prep workbench) |
| Advanced filters | `ComplianceAdvancedFiltersDialog.tsx` | Modal + form fields |
| Import flows | `ComplianceImportMenu.tsx`, import dialogs under `ui/dialogs/` | Preserve progress + preview UX |
| RHF field bridge | `ControlledField.tsx` | `Input.Wrapper`, `Controller`, `aria-*` on Mantine inputs |
| Async entity pick | `ui/pickers/async-entity-select/` package | Combobox/search pattern; public `AsyncEntitySelect.tsx` |
| Fund / rule group / org pickers | `ui/pickers/Compliance*.tsx` | Domain wrappers over async select |
| Comment / exchange thread | `ui/collaboration/ComplianceComment.tsx` | Mantine rail; `@mantine/tiptap` RichTextEditor; HTML `commentText` display; inject module `apis` |

## Overlays (dx-ui overlays-decision-tree)

| Job | Use |
| --- | --- |
| Record detail | **Route** `/orders/:id` (and siblings) |
| Document prep from list | `ComplianceDialog` **fullscreen** secondary workbench — not a substitute for detail |
| Bulk notify from list | Dialog on list header |
| Deactivate catalog item / group / fund | `ComplianceConfirmDialog` only |

## Permissions and actions

- Preserve **event / authorization semantics** when replacing legacy action visuals (`ComplianceAction`, menus, imports).
- Do not bypass gates when swapping presentation to Mantine.
- `COMPLIANCE_PERMISSIONS_ENABLED` in `routing/keys.ts` is **UI-only** — never bypass in production.

## Allowed legacy (nonvisual or pending assessment)

May remain until explicitly replaced; **retention ≠ migration complete**:

- Host rich-text editor for mail and similar
- Nonvisual `@acme-ui/core` types (e.g. `PageableQuery` on `DataTable`)
- Domain hooks, React Query, workflow — unchanged unless ticketed

**Replaced on exchange rail:** host comment widget → module `ui/collaboration/ComplianceComment` (Mantine; inject module `apis` from feature comment API).

## Migration / review workflow

| Phase | Guidance |
| ----- | -------- |
| New or touched screen | Score with `@dx-ui`; implement with this binding + Mantine direct imports |
| PR UX review | `@dx-ui-review` — cite `dx-ui/references/*`; implementation hints from this file |
| Visual-only swap | Keep RHF, TanStack state, permissions, i18n keys, mutation payloads |
| Shared primitive | Follow `@fe-architecture` [module-ui-component-packages](../../fe-architecture/references/module-ui-component-packages.md) — **no** Mantine re-export barrels |

## Anti-patterns (compliance + Mantine)

| Avoid | Do instead |
| ----- | ---------- |
| Wrapper exporting every `@mantine/core` primitive | Import Mantine in feature or behavioral module component |
| Global Mantine reset on host shell | Scoped `mantine.css` + provider boundary |
| New host visual table wrapper | Extend `DataTable` or column defs |
| UX plan that renames all buttons “for consistency” | Tiered `@dx-ui-review` plan; one pattern family per iteration |

## Verification

| Step | Command |
| ---- | ------- |
| Catalog lint | `yarn lint:catalog-management` |
| Local build | `yarn nx run admin:build --configuration=local` |
| Focused test | `yarn nx run admin:test --runInBand --runTestsByPath <spec>` |
| Manual | `yarn start` → **4200** — keyboard path, loading/empty/error on affected route |

After UX refactor, rerun [dx-ui-review verification](../../dx-ui-review/references/verification.md) minimum checks.
