# Visual foundations

Ant sources: [colors](https://ant.design/docs/spec/colors), [font](https://ant.design/docs/spec/font), [icon](https://ant.design/docs/spec/icon), [shadow](https://ant.design/docs/spec/shadow), [dark](https://ant.design/docs/spec/dark), [motion](https://ant.design/docs/spec/motion). Tokens: [design.md](https://ant.design/design.md). Index: [ant-spec-index](ant-spec-index.md).

Principle-level policy here—concrete tokens live in the product theme (compliance: Ant `generate()` → Mantine).

## Color — semantic roles

Map Ant seeds to **roles**, not decorative names:

| Role | Typical use |
| ---- | ----------- |
| **Canvas** (`bg-layout`) | Page background |
| **Surface** (`bg-container`) | Cards, panels on canvas |
| **Elevated** | Modals, dropdowns — shadow not color difference |
| **Border** | Dividers, table lines |
| **Text primary / secondary / disabled** | rgba steps on white |
| **Primary** | One dominant action |
| **Success / warning / danger / info** | Status — with text or icon |
| **Preset hues** | Tags, charts only — not primary chrome |

Rules:

- Never status **by color alone** — [accessibility-wcag](accessibility-wcag.md).
- One **primary** action surface per view ([buttons](https://ant.design/docs/spec/buttons)).
- Links vs labels: primary color reserved for navigation affordances.

## Typography

| Ant default | Enterprise use |
| ----------- | -------------- |
| 14px base | Dense tables and forms |
| 400 body / 600 strong | Headings, table headers |
| System UI stack | `-apple-system`, `Segoe UI`, `Roboto`, … |

| Level | Use |
| ----- | --- |
| **Page title** | One per route |
| **Section title** | Form/table group |
| **Body** | Default UI |
| **Caption / meta** | Timestamps, hints |

Sentence case for UI chrome unless product differs. Test **200% zoom** and contrast.

## Icons

Ant: icon + text when meaning needs both channels ([icon](https://ant.design/docs/spec/icon)).

| Context | Policy |
| ------- | ------ |
| Row actions | Icon + tooltip or aria-label |
| Primary workflow | Labelled control preferred |
| Navigation | Icon + text for infrequent modules |
| Status | Icon + text |

One metaphor per action class product-wide.

## Elevation (flat-first)

Ant is **flat-first**. **Group with proximity and borders before elevation**—whitespace and dividers first; cards/shadows only when the surface truly floats or the project binding requires a section container.

| Tier | Use |
| ---- | --- |
| Tertiary | Subtle raised card (sparing) |
| Popup | Dropdown, modal |
| Directional | Drawer edge |

Do not wrap every section in a shadowed card to “create hierarchy.” See [layout-design](layout-design.md) surface planes and [spacing-hierarchy](spacing-hierarchy.md).

## Motion

| Duration | Use |
| -------- | --- |
| Fast | Hover, focus |
| Mid | Collapse, fade |
| Slow | Modal, drawer |

Named easings only — [motion-feedback](motion-feedback.md).

## Dark / themes

If product ships dark: remap the **three surface layers** and semantic colors via algorithm — do not hardcode light-only hex in features.

## Relation to layout

Visual weight supports [spacing-hierarchy](spacing-hierarchy.md): heavier type or border only where proximity already groups content.