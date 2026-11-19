# Page templates (recipes)

Ant spec and research: [detail-page](https://ant.design/docs/spec/detail-page), [research-list](https://ant.design/docs/spec/research-list), [research-form](https://ant.design/docs/spec/research-form), [research-workbench](https://ant.design/docs/spec/research-workbench), [research-result](https://ant.design/docs/spec/research-result), [research-exception](https://ant.design/docs/spec/research-exception). Map: [ant-spec-index](ant-spec-index.md).

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

Ant [detail-page](https://ant.design/docs/spec/detail-page): **Direct** (flat, avoid hiding), **clear hierarchy** (proximity), **concise** (reuse similar modules).

Pick a **detail sub-template** before layout. Escalate separation only when complexity requires it:

| Sub-template | Ant name | When | Structure |
| ------------ | -------- | ---- | --------- |
| **P2a Basic** | Basic detail | Low complexity, little content | One card; **non-column split lines** between groups |
| **P2b Document** | Template Document / document detail | Approval or workflow record; rich ops | Cards per module; pass/reject/transfer/sign/suspend/withdraw-style actions |
| **P2c Advanced tabs** | Advanced detail | Large, weakly related sections | Tabs (or cards) split by topic/version/phase |
| **P2d Step publish** | Publish process | Develop/collaborate across stages | Step flow to browse and act by phase |

**Separation toolkit (Ant, lowest → highest chrome):** non-column dividers → full-column dividers → cards → tabs. Prefer the lightest method that keeps related content adjacent.

### Regions (all sub-templates)

1. Header — **back** control; title or read-only identifier; status badge from server.
2. Body — sections grouped by domain (proximity first; match sub-template above).
3. Optional rail — comments, history, exchange (non-blocking layout).
4. Footer or header actions — primary workflow (labelled buttons; document template may surface multiple workflow actions).

### Behaviors

- No client workflow transitions; actions call API → invalidate queries.
- Destructive: confirm pattern scoped to allowed types.
- Loading: skeleton matching final layout (avoid layout shift).
- **Data format** and **button** global rules apply — [locale-and-content](locale-and-content.md), [microcopy-voice](microcopy-voice.md).

### Checklist

- [ ] Named P2a–P2d (or justified hybrid) before drawing regions
- [ ] Did not default to tabs/cards when basic + dividers suffice
- [ ] Workflow actions visible without burying read-only facts

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

## P4 — Workbench (hub home)

Ant [research-workbench](https://ant.design/docs/spec/research-workbench): shorten return paths, expose **common entry points**, surface **what the user must focus on now**, allow **high-frequency tasks** on the page.

**Not the same as** P1+P2 master-detail: workbench is **hub-and-spoke** navigation (often app home), not sustained dual-pane editing—use [layout-design](layout-design.md) for triage master-detail when that is the job.

### When to use

- Application **home** or role landing after sign-in.
- User knows **where they want to go** (shortcuts) or needs **discovery** (guided next task).
- Ops/product may place **focus** modules (to-dos, KPIs) on first screen.

### Module budget (Ant)

- **5–9 modules** tied to daily work; most frequent content on **first screen**.
- **Role-based** differentiated views.
- Module types (mix as product needs): help, core data, shortcuts, to-do, focus, operational promo (restrained in enterprise admin).

### Workbench vs new-user guide

| Variant | When | UX |
| ------- | ---- | --- |
| **Standard workbench** | Returning users | Shortcuts + focus modules |
| **New-user guide** | No work started yet | Purpose + start CTA; empty modules follow [feedback-states](feedback-states.md) + [invitation](https://ant.design/docs/spec/invitation) |

### Navigation modes on the workbench

1. **Known destination** — user picks a shortcut to a module (functional nav).
2. **Discovery** — user has a goal but not a module name; surface tasks/to-dos/search hub.

Arrange modules by **usage frequency** in daily work. Plan **error/partial** states per module — do not fail the whole page when one tile errors.

### Layout

- Grid of cards/sections; single scroll contract for the page shell — [layout-design](layout-design.md).
- Optional **master–detail** only when a module explicitly triages a stream (document in binding).

### Risks

- Module sprawl beyond 9; promotional noise on ops surfaces.
- Duplicating full P1 lists inside workbench tiles without a defined drill-down.

### Checklist

- [ ] 5–9 modules max; first screen shows highest-frequency work
- [ ] Role-specific layout documented
- [ ] Empty and error per module, not one global spinner

## P5 — Settings / admin

Ant [data-entry](https://ant.design/docs/spec/data-entry) / [research-form](https://ant.design/docs/spec/research-form) **settings** patterns (same ID as rare configuration surfaces):

| Field count | Layout |
| ----------- | ------ |
| **&lt;7** | Flat, no section groups |
| **7–15** | Grouped sections |
| **&gt;15** | Tabs or left section nav; **search** to jump |

Pick **instant save** vs **explicit submit** per settings page — **not both** on the same page. See [forms-validation-ux](forms-validation-ux.md).

### Layout

- Left nav or grouped sections; **search** when &gt;~15 entries.
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
