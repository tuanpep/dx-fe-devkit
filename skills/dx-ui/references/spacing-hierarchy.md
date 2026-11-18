# Spacing and visual hierarchy

**Primary source:** Ant Design [Proximity](https://ant.design/docs/spec/proximity), [Layout](https://ant.design/docs/spec/layout). Coverage index: [ant-spec-index](ant-spec-index.md).

**Two layers (do not conflate):**

| Layer | Source | Role |
| ----- | ------ | ---- |
| **Hierarchy semantics** | Spec proximity — 8 / 16 / 24 px tiers, **y = 8 + 8×n** | What gap *means* (same unit vs section) |
| **Implementation scale** | [Ant Design design.md](https://ant.design/design.md) — `4 / 8 / 16 / 24 / 32` on a **4px grid** | Theme `padding*` / Mantine `spacing.*` in code |

Use semantic tiers when designing; snap implementation to the product token scale (compliance: Ant `generate()` → Mantine keys in [project-binding-compliance-mantine](examples/project-binding-compliance-mantine.md)).

## Base unit and formula

| Rule | Value |
| ---- | ----- |
| Grid unit | **8px** — even numbers for layout and component math |
| Vertical rhythm | **y = 8 + 8×n**, n ≥ 0 |
| Layout inspiration | Multiples of 8 with rhythmic steps; not a substitute for proximity judgment |

Ant names three **vertical tiers** (fixed px in spec):

| Tier | px | Ant name | Role |
| ---- | -- | -------- | ---- |
| T0 | 8 | Small | Same visual unit — label to control, icon to text, fields in one cluster |
| T1 | 16 | Middle | Related blocks — field groups, card header to body, toolbar cluster to table |
| T2 | 24 | Large | Section break — between cards, between page regions, before unrelated content |

Extended vertical steps (still **8×n** when stacking hierarchy):

| Step | px | Typical use |
| ---- | -- | ----------- |
| 0 | 0 | Flush chrome (dividers, table edge) |
| 1 | 8 | T0 |
| 2 | 16 | T1 |
| 3 | 24 | T2 |
| 4 | 32 | Page shell stack tail; rare section tail |
| 5 | 40 | Large form section or hero metric band |
| 6 | 48 | Exception/result vertical breathing room |

When T0/T1/T2 are not enough, **add or subtract multiples of 8** or add **guides** (subtitle, divider, background) — do not invent off-grid px for hierarchy.

## Proximity rule (Gestalt)

Items that **belong together** use smaller gaps; unrelated blocks use larger gaps. Uniform padding on every edge **flattens** hierarchy — vary steps intentionally.

**Density = task, one density per page:** tighter gaps for data queues/tables; looser for focused settings or single-task forms. Do not mix airy and compact rhythms on the same screen.

| Relationship | Vertical tier | Example regions |
| -------------- | ------------- | ---------------- |
| Atomic in-component | T0 (8) | `Input.Wrapper` label gap, button group |
| Sibling fields in one section | T0–T1 | Filter row, two columns in one group |
| Between groups in same section | T1 (16) | Form blocks under one heading |
| Header → first content block | T1 | Page title block to toolbar |
| Between sections on one page | T2 (24) | Detail cards, settings groups |
| Unrelated page regions | T2–32 | List table vs footer legal strip |

**Header sits closer to its content than to the previous section’s content.**

## Horizontal spacing

| Context | Rule |
| ------- | ---- |
| Page / columns | **24-column grid**, fixed **gutter** at breakpoints; dynamic content column |
| Adaptation (Ant) | **Left–right:** fixed side nav, fluid work area; **Top–bottom:** min side margins, fluid center |
| Inside component | Horizontal gaps **also** follow relationship — not one global `gap` everywhere |
| Form label column | Left-aligned text + optional colon alignment for scan speed — [alignment in ant-design-deep](ant-design-deep.md#alignment) |

Designer–engineer handoff (layout): define **dynamic region**, prefer **even** numbers, deliver **gutter + column span**, anchor blocks with start/end columns.

## Alignment (pairs with spacing)

| Surface | Rule |
| ------- | ---- |
| Text blocks | Single left visual start point |
| Numbers in tables | Right-align; consistent decimal width when comparing |
| Form labels | Colon or fixed label width so values align |

See Ant [Alignment](https://ant.design/docs/spec/alignment).

## Dividers and guides

- Prefer **whitespace** over rules.
- Dividers when groups share one background and gap alone does not separate hierarchy.
- Section **subtitle** or **Card** title is a guide — spacing below title is usually T0–T1, below section is T2.

## Grid and form columns

- Page: multi-column grid with consistent gutters for admin.
- Form: **single column** default; two columns only when labels are short and parity with neighbors is obvious.
- **Fit for purpose:** wide table for triage; narrow measure for long policy text — [layout-design](layout-design.md).

## Optical adjustment

±**one 8px step** when strict grid looks unbalanced — start from token, not arbitrary px (e.g. 14px gaps).

## Tables and density

- Cell padding consistent with module; do not shrink below design-system minimum read/touch targets.
- Horizontal table scroll stays **inside** the table region — [layout-design](layout-design.md).

## Page layout scale (Ant global layout)

Reference numbers for design boards (adapt in binding, keep 8px family):

| Token | Typical Ant usage | Notes |
| ----- | ----------------- | ----- |
| Artboard width | 1440 | Team communication default |
| Content + gutter | 24-grid | e.g. ~1168px content on 1440 top-bottom layout |
| Side nav | Fixed width band | Work area scales |
| Page padding | 16–24 | Match T1/T2 at viewport edge |

## Implementation contract

1. **No raw px in feature UI** unless scoped one-off in binding-approved skeleton/legacy.
2. Use product **spacing tokens** (Mantine `theme.spacing`, Tailwind spacing scale, etc.).
3. Map **semantic roles** (T0/T1/T2) to token keys in the **project binding** — not here.

### Ant Design algorithm tokens → semantic roles

Ant `margin*` / `padding*` from `theme.useToken()` (default algorithm):

| Ant token | px (default) | Maps to tier |
| --------- | ------------ | ------------ |
| `paddingXS` / `marginXS` | 8 | T0 |
| `paddingSM` / `marginSM` | 12 | Between T0 and T1 — tight chrome, compact groups |
| `padding` / `margin` | 16 | T1 |
| `paddingLG` / `marginLG` | 24 | T2 |

Compliance Mantine theme mirrors these in `complianceAntdScalars` — see [project-binding-compliance-mantine](project-binding-compliance-mantine.md#spacing-ant--mantine).

### Mantine `gap` / `p` / `m` shorthand (compliance)

| Semantic role | Mantine key | px (compliance theme) |
| ------------- | ----------- | --------------------- |
| T0 small | `xs` | 8 |
| Compact band | `sm` | 12 |
| T1 middle | `md` | 16 |
| T2 large | `lg` | 24 |
| Section tail / shell stack | `xl` | 32 |

**Decision quick pick:**

| UI job | Prefer |
| ------ | ------ |
| `Stack` in toolbar, filter row, header actions | `gap="xs"` |
| Page header action row | `gap="md"` |
| `ComplianceLayout` page stack | `gap="lg"` |
| Between detail sections | `lg` margin on section + `xs` inside card |
| Empty state illustration block | `gap="sm"` |

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Same `gap` on shell, section, and field | Tiered T0/T1/T2 |
| `gap-3` (12px) beside `gap-4` (16px) without role | Pick token key by relationship |
| Margin-top chains instead of parent `Stack` gap | Parent owns vertical rhythm |
| Divider between every two fields | T1 whitespace |

## Related

- Ant depth: [ant-design-deep](ant-design-deep.md)
- Regions and scroll: [layout-design](layout-design.md)
- Spec index: [ant-spec-index](ant-spec-index.md)