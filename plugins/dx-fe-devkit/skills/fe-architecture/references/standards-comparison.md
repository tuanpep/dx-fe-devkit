# Standards comparison (OSS → this kit)

**Do not copy folder trees literally** — map ideas through [project-binding](project-binding.md). Quick matrix: [oss-fe-matrix](oss-fe-matrix.md). Sources: [external-standards-sources](external-standards-sources.md).

## Structure

| Idea | Bulletproof React | FSD | fe-architecture |
| ---- | ----------------- | --- | --------------- |
| Feature folder | `features/x` with api, components, hooks | `features/` slice with ui, api, model | `features/<slice>/{api,data,domain,ui}` |
| Shared UI | `components/`, `lib/` | `shared/ui` | Module `ui/<role>/` + workspace libs |
| App bootstrap | App + routes | `app/` layer | App shell + module `index.ts` |
| Global entities layer | Ad hoc `types/` | `entities/` layer | `domain/` **per feature**; promote lib when shared |
| Cross-feature import | `features/x` index public API | Same layer禁止; lower layers only | `index.ts` **across** slices; direct inside slice |
| “Not everything is a feature” | Implicit | FSD docs | [feature-boundaries](feature-boundaries.md) |

## Data / server state

| Idea | Common OSS | fe-architecture |
| ---- | ---------- | --------------- |
| API calls | `features/x/api` hooks mixed | `api/` wire; hooks in `data/` |
| Cache | React Query in feature | [server-state](server-state.md) |
| Keys | Include deps | `queryKeys.ts` hierarchy |

## Delivery

| Idea | OSS | fe-architecture |
| ---- | --- | --------------- |
| Code split | Route-based | Lazy `ui/*Page` — [code-splitting](code-splitting.md) |
| Refactor order | Varies | api → data → domain → ui |

## When teams already use FSD

| FSD | Map to kit |
| --- | ---------- |
| `pages` | `ui/*Page` + module `routing/` |
| `widgets` | Large `ui/` subtree or module `ui/` when ≥2 features |
| `features` | `features/<slice>/` |
| `entities` | `domain/` + shared lib — not mandatory global folder |
| `shared` | Workspace libs + design system |

Steiger / FSD lint optional — kit uses [mental-model](mental-model.md) import rule without requiring FSD tooling.

## When teams use Bulletproof React

| BPR | Kit adjustment |
| --- | -------------- |
| `components/` per feature | Prefer `ui/`; split tables/forms as files |
| `hooks/` folder | Fold into `data/` or `ui/use*.ts` |
| `types.ts` at root | `domain/types.ts` or entity subfolders |

## TkDodo / React Query

Adopt patterns in [server-state](server-state.md) regardless of folder label — keys, `queryOptions`, no server rows in `useState`.