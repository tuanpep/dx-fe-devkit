# Ant Design `docs/spec/*` — skill coverage index

Canonical URL root: https://ant.design/docs/spec/

**Machine index:** https://ant.design/llms.txt · **Runtime tokens (v6):** https://ant.design/design.md

This file maps **every Ant spec doc** to **local dx-ui references**. **Detailed decisions:** [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md). Do not duplicate vendor prose — read local refs in hard mode; use Ant URLs for gaps.

**Legend:** ✅ mapped · 🔶 partial (summary only) · ⬜ extend local ref when touching topic

---

## Introduction and values

| Ant doc | URL | Local ref | Notes |
| ------- | --- | --------- | ----- |
| Introduce | [introduce](https://ant.design/docs/spec/introduce) | [ant-design-deep](ant-design-deep.md) | Enterprise patterns, modular reuse |
| Design values | [values](https://ant.design/docs/spec/values) | [ant-design-deep](ant-design-deep.md), [principles-matrix](principles-matrix.md) (ops criteria) | Natural, Certain, Meaningful, Growing |
| Cases | [cases](https://ant.design/docs/spec/cases) | — | Portfolio only |
| Pattern overview | [overview](https://ant.design/docs/spec/overview) | [pattern-vocabulary](pattern-vocabulary.md), [ant-global-rules-index](ant-global-rules-index.md) | Templates + global rules catalog |

---

## Global styles

| Ant doc | URL | Local ref | Notes |
| ------- | --- | --------- | ----- |
| Colors | [colors](https://ant.design/docs/spec/colors) | [visual-foundations](visual-foundations.md) | System vs product palette; restrained enterprise use |
| Layout | [layout](https://ant.design/docs/spec/layout) | [layout-design](layout-design.md), [spacing-hierarchy](spacing-hierarchy.md) | 8px grid unit, 24-col, adaptation |
| Font | [font](https://ant.design/docs/spec/font) | [visual-foundations](visual-foundations.md) | 14px base density |
| Icons | [icon](https://ant.design/docs/spec/icon) | [visual-foundations](visual-foundations.md) | Icon + label for meaning |
| Dark mode | [dark](https://ant.design/docs/spec/dark) | [visual-foundations](visual-foundations.md) | Algorithm + surface ladder |
| Shadow | [shadow](https://ant.design/docs/spec/shadow) | [visual-foundations](visual-foundations.md), `design.md` elevation | Flat-first; popup tiers |
| Motion | [motion](https://ant.design/docs/spec/motion) | [motion-feedback](motion-feedback.md) | Durations / easings as tokens |
| Illustration | [illustration](https://ant.design/docs/spec/illustration) | [feedback-states](feedback-states.md) | Empty/exception art |
| Visualization page | [visualization-page](https://ant.design/docs/spec/visualization-page) | [dashboards-and-viz](dashboards-and-viz.md) | Reports scope |
| Visual (principles) | [visual](https://ant.design/docs/spec/visual) | [visual-foundations](visual-foundations.md), [dashboards-and-viz](dashboards-and-viz.md) | Charts: accuracy/clarity; admin scope |

**Implementation SSOT:** Ant Design v6 [design.md](https://ant.design/design.md) — 4px spacing scale (`4/8/16/24/32`), 14px type, three surface layers, one primary per surface. **Spec proximity** (8/16/24) still defines **hierarchy semantics**; map both in [spacing-hierarchy](spacing-hierarchy.md).

---

## Visual principles (Gestalt)

| Ant doc | URL | Local ref |
| ------- | --- | --------- |
| Proximity | [proximity](https://ant.design/docs/spec/proximity) | [spacing-hierarchy](spacing-hierarchy.md) |
| Alignment | [alignment](https://ant.design/docs/spec/alignment) | [spacing-hierarchy](spacing-hierarchy.md), [ant-design-deep](ant-design-deep.md) |
| Contrast | [contrast](https://ant.design/docs/spec/contrast) | [visual-foundations](visual-foundations.md), [accessibility-wcag](accessibility-wcag.md) |
| Repetition | [repetition](https://ant.design/docs/spec/repetition) | [design-language-glossary](design-language-glossary.md), SKILL principle Familiarity |

---

## Global rules (interaction)

| Ant doc | URL | Local ref | One-line rule |
| ------- | --- | --------- | ------------- |
| Make it Direct | [direct](https://ant.design/docs/spec/direct) | [overlays-decision-tree](overlays-decision-tree.md), [forms-validation-ux](forms-validation-ux.md) | Edit in context; inline/drag when appropriate |
| Stay on the Page | [stay](https://ant.design/docs/spec/stay) | [layout-design](layout-design.md), [multi-step-flows](multi-step-flows.md) | Overlays, inlays, virtual pages — avoid blind context switches |
| Keep it Lightweight | [lightweight](https://ant.design/docs/spec/lightweight) | [data-tables-density](data-tables-density.md) | Fitts: tools in context; hover/toggle reveal |
| Provide an Invitation | [invitation](https://ant.design/docs/spec/invitation) | [feedback-states](feedback-states.md), [page-templates](page-templates.md) | Discoverability: static + dynamic invites |
| Use Transition | [transition](https://ant.design/docs/spec/transition) | [motion-feedback](motion-feedback.md) | Maintain context; explain what changed |
| React Immediately | [reaction](https://ant.design/docs/spec/reaction) | [notifications-and-messaging](notifications-and-messaging.md), [search-and-filters](search-and-filters.md) | Instant paired feedback; live suggest/preview |

Consolidated table: [ant-global-rules-index](ant-global-rules-index.md).

---

## Global rules (domains)

| Ant doc | URL | Local ref |
| ------- | --- | --------- |
| Feedback | [feedback](https://ant.design/docs/spec/feedback) | [feedback-states](feedback-states.md), [notifications-and-messaging](notifications-and-messaging.md) | Alert, notification, message, dialog tiers |
| Navigation | [navigation](https://ant.design/docs/spec/navigation) | [navigation-admin-ia](navigation-admin-ia.md), [ant-design-deep](ant-design-deep.md) |
| Data entry | [data-entry](https://ant.design/docs/spec/data-entry) | [forms-validation-ux](forms-validation-ux.md) | Input, select, upload patterns |
| Data display | [data-display](https://ant.design/docs/spec/data-display) | [data-tables-density](data-tables-density.md), [collaboration-surfaces](collaboration-surfaces.md) | Table, card, collapse, tree |
| Copywriting | [copywriting](https://ant.design/docs/spec/copywriting) | [microcopy-voice](microcopy-voice.md) | User-centred, concise, consistent tone |
| Data format | [data-format](https://ant.design/docs/spec/data-format) | [locale-and-content](locale-and-content.md) | Numbers, money, time, redaction, `--` empty |
| Button | [buttons](https://ant.design/docs/spec/buttons) | [microcopy-voice](microcopy-voice.md), [visual-foundations](visual-foundations.md) | One primary; placement by reading flow |
| Data list | [data-list](https://ant.design/docs/spec/data-list) | [page-templates](page-templates.md), [search-and-filters](search-and-filters.md), [selection-and-bulk-actions](selection-and-bulk-actions.md) | Table vs list vs card; toolbar; drill-down |

---

## Pattern templates (classic spec)

| Ant doc | URL | Pattern | Local ref |
| ------- | --- | ------- | --------- |
| Detail page | [detail-page](https://ant.design/docs/spec/detail-page) | P2 | [page-templates](page-templates.md), [layout-design](layout-design.md) |

Other classic templates are named in [overview](https://ant.design/docs/spec/overview) and covered under **Research** below.

---

## Research channel (`research-*`)

Exploration templates — authoritative for **list/form/workbench** layout decisions.

| Ant doc | URL | Local ref | Key takeaways |
| ------- | --- | --------- | ------------- |
| Research overview | [research-overview](https://ant.design/docs/spec/research-overview) | This file | Unstable; feedback-driven |
| List page | [research-list](https://ant.design/docs/spec/research-list) | [page-templates](page-templates.md) P1, [search-and-filters](search-and-filters.md) | Query table, standard/card/search list; batch ops bottom |
| Form page | [research-form](https://ant.design/docs/spec/research-form) | [forms-validation-ux](forms-validation-ux.md), [multi-step-flows](multi-step-flows.md) | Single column most efficient; step/group/card layouts |
| Workbench | [research-workbench](https://ant.design/docs/spec/research-workbench) | [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §10, [layout-design](layout-design.md) P4 | 5–9 modules; hub nav |
| Result page | [research-result](https://ant.design/docs/spec/research-result) | [page-templates](page-templates.md) P6 | Heavy feedback; ≤2 next actions |
| Exception page | [research-exception](https://ant.design/docs/spec/research-exception) | [page-templates](page-templates.md) P7, [feedback-states](feedback-states.md) | 403/404/500; partial/loading/error matrix |
| Empty status | [research-empty](https://ant.design/docs/spec/research-empty) | [feedback-states](feedback-states.md) | Clarity + invitation to act |
| Navigation | [research-navigation](https://ant.design/docs/spec/research-navigation) | [navigation-admin-ia](navigation-admin-ia.md) | Shallow IA; 5 nav types; sidebar for enterprise |
| Message and feedback | [research-message-and-feedback](https://ant.design/docs/spec/research-message-and-feedback) | [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §11, [notifications-and-messaging](notifications-and-messaging.md) | Success/failure × stay vs redirect |

---

## Feedback taxonomy (from spec feedback)

Use when choosing surface strength:

| Ant pattern | Interrupt? | Local guidance |
| ----------- | ---------- | -------------- |
| Alert | No — static page band | Banner in [notifications-and-messaging](notifications-and-messaging.md) |
| Notification | Passive global | Top-end stack |
| Popconfirm | Local confirm | Destructive row actions |
| Message | Light, auto-dismiss | Success copy after save |
| Modal / Dialog | Blocks UI | Irreversible or critical miss risk |
| Skeleton | Loading | [feedback-states](feedback-states.md) |
| Tooltip vs Popover | Hover hint vs rich card | Overlays tree |

**Ant rule:** Necessary positive immediate feedback; omit when outcome is already visible and operation is trivial.

---

## Navigation taxonomy (spec + research)

| Type | Enterprise default | Local |
| ---- | ------------------- | ----- |
| Global — side | &gt;6 items, 1–3 levels | [navigation-admin-ia](navigation-admin-ia.md) |
| Global — top | 2–7 items, marketing/light | Rare in ops modules |
| Utility (search, bell, user) | Top-end habit | Shell binding |
| In-page — header / tabs / anchor | Module context | [layout-design](layout-design.md) |
| Drill down | List → detail route | P1 → P2 |
| Back | Back button vs breadcrumb | Breadcrumb if depth ≥3; avoid duplicate back+breadcrumb |
| Step bar | Linear create | [multi-step-flows](multi-step-flows.md) |

**Stress test:** parachute to random route — user knows where they are and where links go ([research-navigation](https://ant.design/docs/spec/research-navigation)).

---

## Data list → dx-ui workflow

When implementing queues ([data-list](https://ant.design/docs/spec/data-list)):

1. Choose **table / list / card** emphasis.
2. Define **search vs filter vs query** ([search-and-filters](search-and-filters.md)).
3. Default **title → detail** navigation; drawer/double-column only when spec criteria met.
4. **Batch** toolbar on selection ([selection-and-bulk-actions](selection-and-bulk-actions.md)).
5. **New** upper-right vs dashed inline create.
6. **Empty** + skeleton ([feedback-states](feedback-states.md)).

---

## Agent rules

1. Start from this index → open **local ref** → cite Ant URL only if local ref is 🔶.
2. For spacing: [spacing-hierarchy](spacing-hierarchy.md) — semantic T0/T1/T2; implementation from theme tokens / `design.md` scale.
3. For compliance Mantine: [project-binding-compliance-mantine](examples/project-binding-compliance-mantine.md) after pattern choice.
4. Do not import Ant React components inside dx-ui prose — pattern names only.

## Maintenance

When Ant adds `docs/spec/*.md` entries in [llms.txt](https://ant.design/llms.txt), append a row here and link or create a local ref.