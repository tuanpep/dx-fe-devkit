# Ant Design — comprehensive implementation guide

**Purpose:** Agent- and designer-oriented playbook distilled from Ant `docs/spec/*` and v6 [design.md](https://ant.design/design.md). **Index of every spec page:** [ant-spec-index](ant-spec-index.md). **Do not** paste Ant React APIs here — pattern names and decisions only.

**Read order for a new screen:** values (below) → pattern ID ([pattern-vocabulary](pattern-vocabulary.md)) → this guide’s section → local ref (forms, tables, …) → project binding.

---

## 1. Four values → decisions

| Value | Ant meaning | When designing, ask | Reject when |
| ----- | ----------- | ------------------- | ----------- |
| **Natural** | Conventions users already know | Does this match OS + enterprise patterns? | Novel chrome for familiar tasks |
| **Certain** | State is always obvious | Can user answer “where am I / what happened?” | Hidden loading; ambiguous selection scope |
| **Meaningful** | Emphasis only for action | Is every primary button the real commit? | Decorative color; two primaries |
| **Growing** | Discover depth over time | Empty states invite next step? | Features with zero affordance |

---

## 2. Token layer (v6 `design.md` — map in project binding)

### 2.1 Spacing (4px grid implementation)

| Token step | px | Typical role |
| ---------- | -- | -------------- |
| unit / xs | 4 / 4 | Fine inset |
| sm | 8 | T0 proximity |
| md | 16 | T1 |
| lg | 24 | T2 |
| xl | 32 | Section tail |

**Semantics** (spec proximity 8/16/24): [spacing-hierarchy](spacing-hierarchy.md).

### 2.2 Surfaces (three layers)

| Layer | Role | Rule |
| ----- | ---- | ---- |
| Layout bg | Page canvas | Wraps all content |
| Container | Cards, tables, forms | Where users work |
| Elevated | Modal, dropdown, popover | Same fill as container; **shadow** separates |

Flat-first: borders and tone before shadow.

### 2.3 Typography

- Base **14px** — density for consoles.
- Weights **400** (body) / **600** (titles, table headers) only.
- Stack: system UI fonts → `Noto Sans` → emoji fallbacks.

### 2.4 Color roles

| Role | Use |
| ---- | --- |
| Primary | **One** dominant action per surface |
| Semantic (success/warning/error/info) | Status, alerts |
| Preset palette (blue, green, …) | Tags, charts — **not** primary chrome |

Text on tints: prefer rgba black steps (`0.88` / `0.65` / `0.45` / `0.25`) on tinted surfaces.

### 2.5 Shape

| Surface class | Radius |
| ------------- | ------ |
| Controls (input, button) | 6px |
| Cards, modal | 8px |
| Tags, tooltip | 4px |

No pill buttons; no mixed radii on parent/child.

### 2.6 Motion

| Duration | Use |
| -------- | --- |
| Fast 0.1s | Hover, focus, press |
| Mid 0.2s | Collapse, fade |
| Slow 0.3s | Modal, drawer |

Use named easings only — no custom beziers.

### 2.7 Do / don’t (from design.md)

- One primary button per surface.
- Snap gaps to spacing scale — no `11px`/`13px` in product code.
- Preset colors for categorization only.
- Hook/static themed feedback: themed context required for global message/modal.

---

## 3. Gestalt (visual principles)

| Principle | Ant rule | dx-ui ref |
| --------- | -------- | --------- |
| Proximity | Smaller gap = same unit | [spacing-hierarchy](spacing-hierarchy.md) |
| Alignment | One left origin; numbers right | spacing-hierarchy, tables |
| Contrast | Hierarchy via size/weight/color | [visual-foundations](visual-foundations.md) |
| Repetition | Same job → same pattern | [pattern-vocabulary](pattern-vocabulary.md) |

---

## 4. Data list — end-to-end playbook

Sources: [data-list](https://ant.design/docs/spec/data-list), [research-list](https://ant.design/docs/spec/research-list).

### 4.1 Choose list emphasis

| Type | Goal | When |
| ---- | ---- | ---- |
| **Table** | Browse matrix; compare columns | Many fields visible without opening detail |
| **Vertical list** | Overview in tight space | Sidebar, drawer, narrow panel |
| **Card grid** | Equal visual weight per object | No required browse order; marketing-like ops |

### 4.2 Page layout (single column default)

Top-to-bottom:

1. **Exclusive zone** (optional) — heavy stats / complex query not fitting toolbar.
2. **List toolbar** — search, filter, primary new, utilities ([search-and-filters](search-and-filters.md)).
3. **List body** — table / list / cards.
4. **Batch bar** — appears on selection (page bottom per research-list).
5. **Pager** — default; hide when &lt; one page.

Two-column: move **filter module to sidebar** when many filter fields and width allows.

### 4.3 Search modes

| Pattern | User knows | UI |
| ------- | ---------- | -- |
| Known item | Exact name/ID | Focused search field |
| Exploratory | Broad target | Multi-attribute search + filters |

Higher search frequency → higher efficiency (debounce, shortcuts, URL sync).

| Mechanism | Behavior |
| --------- | -------- |
| **Inquire** | Multi-condition query; submit once |
| **Filter** | Adjust → results update |
| **Search** | Keywords across attributes |

### 4.4 Pagination policy

| Mode | When |
| ---- | ---- |
| **Pagination** (default) | Ops queues; restore scroll/position on back |
| **Same-page load** | Feed-like; targets often near top |
| **View all** | Jump to full list page |

Cache browse position; mark scrolled/viewed items when product requires.

### 4.5 Open detail — decision tree

```text
Detail fits one screen without scroll?
├─ YES → inline expand on same page (height ≤ one viewport)
└─ NO → continue
    Shareable URL / immersive task?
    ├─ YES → full route (P2)
    └─ NO → Drawer
        Need switch across many items?
        └─ YES → master–detail (double column / workbench)
```

Default: **title click → detail**.

### 4.6 Create

| Pattern | Placement | After save |
| ------- | --------- | ---------- |
| Primary new | Upper-right | New row first + brief highlight |
| Dashed inline new | Start/end of list | Object at insert position |

Popup/drawer/page per task weight — [overlays-decision-tree](overlays-decision-tree.md).

### 4.7 Delete tiers

| Tier | UX |
| ---- | -- |
| Reversible | Delete + undo |
| Confirm | Popconfirm / dialog |
| High risk | Extra verification step |

### 4.8 Empty

No data vs no search hits — different copy and CTA ([feedback-states](feedback-states.md)).

---

## 5. Data entry

Source: [data-entry](https://ant.design/docs/spec/data-entry).

### 5.1 Labels and hints

- Novices: plain **Label** text; experts: domain terms OK if consistent.
- Sensitive fields: explain **why** collected.
- Contextual completion: defaults, structured formats, hints — avoid empty guesswork.

### 5.2 Control selection

| Control | Ant constraint |
| ------- | -------------- |
| Radio | **2–5** visible options; one value |
| Checkbox | Multi; or single state toggle |
| Switch | Immediate state change; inline on/off labels |
| Dropdown | **&gt;5** options; sorted; full labels visible |
| Slider | Intensity/grade when exact number optional |
| Date picker | Visual date/range browse |

### 5.3 Upload

| Pattern | Use |
| ------- | --- |
| Click | Single file, no preview |
| Thumbnail list | Images; hide button at max count |
| Drag-drop | Batch; show format/size limit + progress |

State limits in UI copy (type, max size).

---

## 6. Data display

Source: [data-display](https://ant.design/docs/spec/data-display).

| Component | Enterprise rule |
| --------- | ----------------- |
| **Table** | Priority order; sort/search/filter/page with table; time/status/action **one line**; empty cell `—` or `--` |
| **Collapse** | Progressive disclosure; accordion if sections unrelated |
| **Card** | Grid; **≤4 rows** of cards; ellipsis long text |
| **Tree** | Hierarchy (org, taxonomy) |
| **Timeline** | Event audit reverse-chronological |

Carousel: rare in admin; 3–5 slides with position hints if used.

---

## 7. Data format

Source: [data-format](https://ant.design/docs/spec/data-format). Detail: [locale-and-content](locale-and-content.md).

| Type | Rule |
| ---- | ---- |
| Numbers in table | **Right-align**; thousands separators per locale |
| Money | Currency symbol + amount; `M`/`B` for huge values |
| Absolute datetime | `YYYY-MM-DD HH:mm:ss` style; range ` ~ ` with spaces |
| Relative time | Bucketed (just now, N min, date if &gt;24h) for feeds |
| Empty | `--` |
| Loading | Skeleton |
| Redaction | Full `***` or partial `*` per security level |

---

## 8. Forms (research-form)

Goals: **Efficient**, **Clear**, **Safe**.

### 8.1 Layout gradient (pick one)

| Level | Layout | When |
| ----- | ------ | ---- |
| Basic | Single column, top-down | Default; fastest completion |
| Weak grouping | Short related fields on one row | Space limited |
| In-area grouping | Section titles inside one area | Many fields one topic |
| Card grouping | Cards with titles | **&gt;2 screens** of content |

**Do not** mix different control styles for the same content type on one page.

### 8.2 Templates

| Template | When |
| -------- | ---- |
| Basic form | Minimal create |
| Step form | Linear multi-step with recap before submit |
| Grouped form | Large single task, classifiable sections |
| Editable list | Repeated objects: ≤3 inline adds; 2–5 table; 6–8 collapse; **&gt;8** drawer |
| Settings | Rare edits; **&lt;7** fields no groups; **7–15** groups; **&gt;15** tabs |
| Settings mode | Instant vs submit — one mode per page |

### 8.3 Validation

- Errors **below** field; persist until fixed.
- Avoid redundant hints (“Name” field → “Enter your name”).
- Distributed save / undo / reset for long forms.

Full UX: [forms-validation-ux](forms-validation-ux.md).

---

## 9. Detail pages

Source: [detail-page](https://ant.design/docs/spec/detail-page).

**Principles:** Direct (flat, don’t hide), clear hierarchy, concise (similar modules).

| Template | When |
| -------- | ---- |
| Basic | Low complexity — one card, split lines between groups |
| Document | Approval flows, rich actions (pass/reject/transfer…) |
| Advanced tabs | Large unrelated sections |
| Step publish | Collaborate/develop workflows |

**Separation toolkit:** non-column dividers → full dividers → cards → tabs (by relevance).

Information complexity × correlation → template choice (same logic as form layout).

**Recipes and checklists:** [page-templates](page-templates.md) § P2 (P2a–P2d).

---

## 10. Workbench (P4 / home)

Source: [research-workbench](https://ant.design/docs/spec/research-workbench).

**Goals:** Shortest path to frequent tasks; hub navigation; optional ops content.

**Recipes and checklists:** [page-templates](page-templates.md) § P4.

| Module | Guidance |
| ------ | ---------- |
| Count | **5–9** modules on first screen |
| Frequency | Most-used content above fold |
| Role | Differentiated views when roles differ |

**Navigation modes:**

1. User knows destination → direct links/shortcuts.
2. User knows task not feature → discovery cards, todos, guided empty.

New-user guide: platform purpose + demo for complex objects ([feedback-states](feedback-states.md) empty).

Layout: [layout-design](layout-design.md).

---

## 11. Feedback and messaging — unified matrix

Sources: [feedback](https://ant.design/docs/spec/feedback), [research-message-and-feedback](https://ant.design/docs/spec/research-message-and-feedback).

### 11.1 Strength ladder

| Surface | Blocks? | Duration | Use |
| ------- | ------- | -------- | --- |
| Tooltip | No | Hover | Icon gloss |
| Popover | No | Until dismiss | Rich hint + actions |
| Message | No | ~3s auto | Lightweight success |
| Notification | No | Until dismiss | Important global |
| Alert (page) | No | Static band | Policy, outage |
| Popconfirm | Local | Until choice | Row destroy |
| Modal | Yes | Until dismiss | Critical / irreversible |
| Skeleton | N/A | Loading | &gt;~2s wait |

**Ant:** Positive feedback only when not already obvious; omit trivial ops.

### 11.2 Outcome × context

| Outcome | Stay on page | Navigate / redirect |
| ------- | ------------- | ------------------- |
| **Success** (minor) | Global message | — |
| **Success** (major flow end) | Inline + illustration | Result page P6 |
| **Failure** (field) | Form validation | — |
| **Failure** (critical) | Alert | — |
| **Failure** (needs decision) | Notification / modal | Exception P7 |
| **Background job** | Notification | Notification center |

Detail: [notifications-and-messaging](notifications-and-messaging.md), [feedback-states](feedback-states.md).

---

## 12. Global interaction rules (six)

| Rule | Meaning | Primary refs |
| ---- | ------- | ------------ |
| **Direct** | Edit in context; inline when safe | [overlays-decision-tree](overlays-decision-tree.md) |
| **Stay** | Overlays/inlays vs route change | [layout-design](layout-design.md) |
| **Lightweight** | Tools near target; reveal on hover | [data-tables-density](data-tables-density.md) |
| **Invitation** | Static + dynamic discoverability | [page-templates](page-templates.md) |
| **Transition** | Motion explains change | [motion-feedback](motion-feedback.md) |
| **Reaction** | Immediate paired feedback | [search-and-filters](search-and-filters.md) |

Table: [ant-global-rules-index](ant-global-rules-index.md).

---

## 13. Visualization (when used)

Source: [visual](https://ant.design/docs/spec/visual), [visualization-page](https://ant.design/docs/spec/visualization-page).

Principles: **Accuracy**, **Effective** (data-ink), **Clarity**, **Aesthetics**.

Choose chart type by intent (time series, comparison, distribution, process, proportion). Title + note source; legend/axis/labels required.

Scope for ops products: [dashboards-and-viz](dashboards-and-viz.md).

---

## 14. Pattern checklists (P1–P7)

### P1 List / queue

- [ ] Table vs list vs card chosen (§4.1)
- [ ] Toolbar + optional sidebar filters (§4.2)
- [ ] Search mode matches user mental model (§4.3)
- [ ] Pagination + back restores position (§4.4)
- [ ] Detail open mode decided (§4.5)
- [ ] Batch bar on selection (§4.7)
- [ ] Empty vs filtered empty (§4.8)

### P2 Detail

- [ ] Basic vs tabbed vs document template (§9)
- [ ] Separation by relevance not decoration
- [ ] Data format rules for numbers/dates (§7)

### P3 Form

- [ ] Layout gradient matches field count (§8.1)
- [ ] One validation model; errors below fields
- [ ] Safe cancel/draft if API supports

### P4 Workbench

- [ ] 5–9 modules; role view (§10)
- [ ] Known vs discovery navigation paths

### P5 Settings

- [ ] Grouping thresholds 7 / 15 / tabs (§8.2)
- [ ] Instant vs submit mode explicit

### P6 Result

- [ ] ≤2 next actions; heavy feedback OK

### P7 Exception

- [ ] Ideal / partial / loading / error / empty matrix

---

## 15. Catalog Mantine (sample-admin)

After pattern and tier decisions: [project-binding-compliance-mantine](examples/project-binding-compliance-mantine.md) for `theme.spacing`, `DataTable`, dialogs, headers.