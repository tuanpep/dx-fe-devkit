# Page templates (recipes)

Ant research: [research-list](https://ant.design/docs/spec/research-list), [research-form](https://ant.design/docs/spec/research-form), [research-result](https://ant.design/docs/spec/research-result). Map: [ant-spec-index](ant-spec-index.md).

**One job per screen:** pick a single primary job (find, review, create/edit, configure, confirm outcome). Do not combine browse-list + full edit + decision modal chrome on the same route.

**List sub-templates:** query table (dense fields), standard list, card list, search list, member management, **work queue** — pick before layout.

**Form layout gradient (Ant):** basic single column → weak grouping → in-area grouping → card grouping (>2 screens).

## P1 — List / queue

### Browse list vs work queue

| Variant | When | Chrome |
| ------- | ---- | ------ |
| **Browse / catalog** | Large set; user must find by criteria | Search + filters (advanced behind disclosure); URL state |
| **Work queue** | Fixed or role-scoped set to process | Light or no filter bar; optional status tabs (All / Open / …); act from row |

Do not ship heavy filter chrome on a work queue that already defines membership.

### Regions (top → bottom)

1. **Page header** — title; optional breadcrumb; primary module action (create, import).
2. **Toolbar** — browse: debounced search; filter chips or “Advanced filters”; filter summary. Queue: keep minimal (views/tabs + IAM actions).
3. **Async chrome** — skeleton → table OR empty OR error+retry.
4. **Table region** — scroll **inside** container; sticky header optional; row actions compact.
5. **Pagination** — page size control; preserve page vs filter rules per product spec.

### Behaviors

- URL or store encodes filters, sort, page when users share/support/debug (browse lists).
- Bulk actions in toolbar or selection bar—confirm destructive bulk.
- Row primary navigation → **route** to P2 (not modal) for main entities.

### Checklist

- [ ] Chose browse vs work-queue chrome deliberately
- [ ] Filtered empty ≠ global empty
- [ ] Error without cached rows shows retry
- [ ] Horizontal scroll does not scroll entire page shell

## P2 — Object detail

### Regions

1. Header — **back** control; title or read-only identifier; status badge from server.
2. Body — sections grouped by domain (proximity first; cards only when binding requires).
3. Optional rail — comments, history, exchange (non-blocking layout).
4. Footer actions — primary workflow (labelled buttons).

### Behaviors

- No client workflow transitions; actions call API → invalidate queries.
- Destructive: confirm pattern scoped to allowed types.
- Loading: skeleton matching final layout (avoid layout shift).

## P3 — Form (create/edit)

### Regions

- Sections with headings; field groups via proximity.
- **Essentials first** — required/common fields in the default view; advanced/rare fields behind disclosure or a later step.
- Inline errors at field; summary for submit-level errors if API returns multiple.
- **Form actions** sticky or footer: Save, Cancel—imperative labels.

### Behaviors

- Validate in domain layer before API when architecture requires.
- Disable double-submit while mutation pending.
- On success: navigate to detail or list per product rule—not random toast-only.

## P4 — Workbench

### When to use

User compares records while editing another; or triages from stream.

### Layout

- **Master** list (narrower or left).
- **Detail** center.
- **Context** right optional (metadata, preview).

### Risks

- State explosion—define selection and what happens when master filter changes while detail open.

## P5 — Settings / admin

### Layout

- Left nav or grouped sections; **search** when >~15 entries.
- Role-based nav pruning—hide sections user cannot access.
- Danger zone visually separated with extra confirm.

## P6 — Result

After submit or batch job:

- Outcome title states result in plain language.
- Primary CTA: next step (view record, return to list).
- Secondary: retry or dismiss.
- Use P6 route for heavy jobs; lightweight success may use toast only—[notifications-and-messaging](notifications-and-messaging.md).

## P7 — Exception

403, 404, 5xx, business rule block:

- Reason + fix; link to home or support if defined.
- No humorous tone for enterprise admin.
- Distinct from **filtered empty** on list—see [feedback-states](feedback-states.md).

## Composition examples

| Product flow | Template chain |
| ------------ | -------------- |
| Operations queue | P1 → P2; filters in drawer |
| Catalog admin | P1 → P2; P3 on routes |
| Secondary message from list | P1 + overlay only |

Project-specific routes and examples: document in [project-binding-template](project-binding-template.md).
