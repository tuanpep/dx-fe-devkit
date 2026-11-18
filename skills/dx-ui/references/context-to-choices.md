# Context → best matching choices

Use when the user gives a **feature brief**. Infer options from signals below; state the pick in one short block before layout. Prefer a sibling screen in the product when one exists.

## Output before layout

```text
Job: <one verb phrase>
Pattern: P# (+ browse | work-queue if P1)
Surface: route | modal | drawer | …
Density: compact | comfortable
Filters/fields: essentials | + advanced disclosure
Copy: labels only (hints only if non-obvious constraint)
Chain: P1 → P2 … (if multi-screen)
```

## 1. Primary job → pattern

| If the user mainly… | Pick | Not |
| ------------------- | ---- | --- |
| Finds/acts on many records | **P1** | P2 alone |
| Understands/acts on one record | **P2** | Modal as home |
| Creates or edits fields | **P3** (route if >~5 fields or >30s) | Full form in modal |
| Triages list while viewing/editing another | **P4** | Separate full-page hop only |
| Configures rare system/module options | **P5** | Ops queue chrome |
| Sees outcome of submit/batch | **P6** | Toast-only for heavy jobs |
| Hits block/error with recovery path | **P7** | Empty-list copy |

**Multi-screen features:** compose a chain (e.g. ops module = P1 → P2; catalog = P1 → P2 + P3 routes). One job per screen.

## 2. P1 list variant

| Signal | Pick |
| ------ | ---- |
| Large catalog; user searches/filters to find | **Browse list** — search + filters; advanced behind disclosure |
| Role/system defines the set to process | **Work queue** — light toolbar; optional status tabs; act from row |
| Both “find anything” and “my open items” | Default **work queue** + link/tab to browse, or two routes—not one overloaded toolbar |

## 3. Surface (route vs overlay)

| Signal | Pick |
| ------ | ---- |
| Primary entity, many fields, or long task | **Route** (P2/P3) |
| Must finish before returning (confirm, short) | **Modal** |
| Secondary but large (filters, preview, import) | **Drawer** |
| Pick one / short help | **Dropdown / popover** |
| Save/background outcome | **Toast**; heavy job → **P6** |

Full tree: [overlays-decision-tree](overlays-decision-tree.md).

## 4. Density

| Signal | Pick |
| ------ | ---- |
| Ops queue, dense table, power users | **Compact** |
| Settings, short form, occasional users | **Comfortable** |
| Same page has table + settings-like cards | **One density**—match the dominant job (usually compact for queues) |

## 5. Filters & form fields

| Signal | Pick |
| ------ | ---- |
| ≤3 common criteria / required fields | Show in **default** toolbar/form |
| Many optional criteria/fields | **Essentials first** + Advanced / later step |
| Work queue with fixed membership | **Skip** heavy filter chrome |

## 6. Form length

| Signal | Pick |
| ------ | ---- |
| Short edit / few fields | Single **P3** scroll |
| Long or unfamiliar create | **Wizard** — [multi-step-flows](multi-step-flows.md) |
| Edit existing complex object | Prefer **P2** sections + edit route/sections over one giant modal |

## 7. Common feature briefs → starter pack

| Feature context | Starter choices |
| --------------- | --------------- |
| “List X, open detail, approve/reject” | P1 work queue → P2; compact; confirm dialog for destructive; toast on success |
| “Admin CRUD catalog” | P1 browse → P2 → P3 routes; search+filters; deactivate confirm |
| “Create long request” | P3 route or wizard; essentials first; P6 or toast on success |
| “Master–detail triage” | P4; compact master; selection rules when filter changes |
| “Module settings” | P5; comfortable; search if >~15 entries |
| “Import file / batch” | P1 header action → drawer/dialog preview → progress; P6 if heavy |
| “Comments on record” | P2 + side panel/rail — [collaboration-surfaces](collaboration-surfaces.md) |

## 8. Ambiguous context

1. Match a **sibling screen** with the same job in the product.  
2. If still unclear, ask only: primary job, browse vs process queue, create length (short/long).  
3. Do not invent a new pattern when P1–P7 + overlay tree covers it.

Recipes: [page-templates](page-templates.md). Tables: [data-tables-density](data-tables-density.md).
