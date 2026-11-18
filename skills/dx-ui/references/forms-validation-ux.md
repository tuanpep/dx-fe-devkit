# Forms and validation UX

Ant: [data-entry](https://ant.design/docs/spec/data-entry), [research-form](https://ant.design/docs/spec/research-form). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §5, §8.

**Layout default:** single column top-down (most efficient). Escalate: weak row grouping → in-area titles → cards when **&gt;2 screens**.

**Settings:** &lt;7 fields flat; 7–15 grouped; **&gt;15** tabs; pick **instant** vs **submit** mode per page — not both.

## Structure

| Element | Rule |
| ------- | ---- |
| Label | Visible, associated; not placeholder-only |
| Hint | **Omit by default** — add only for non-obvious format/constraint ([microcopy-voice](microcopy-voice.md)) |
| Error | Below field; reason from API or domain message (preferred over standing hints) |
| Required | Mark required fields consistently (legend or asterisk system-wide) |

## Essentials first

- Default view: fields needed for the primary job only.
- Advanced / rare / power-user fields: disclosure (“Advanced”), secondary section, or later wizard step — [multi-step-flows](multi-step-flows.md).
- Do not present every API field on first paint.
- Do not add helper copy, descriptions, or info icons to “explain” routine fields—clean layout first.

## Validation timing

| Strategy | Use when |
| -------- | -------- |
| On submit | Default for long admin forms |
| On blur | High error cost fields (email, id format) |
| Inline async | Unique name checks—show loading on field |

Avoid validating on every keystroke unless it reduces support load.

## Multi-section forms

- Progressive sections with headings; proximity within section.
- Save draft only if product/API supports—do not fake local draft for regulated domains.
- **Cancel** returns with confirm if dirty.

## Pickers and lookups

- Async search with debounce; empty and error in dropdown.
- Selected value shows label, not raw id.
- Clear selection affordance.

## Destructive fields

- Deactivate/archive separate from delete when API distinguishes.
- Confirm with entity name when possible.

## Server errors

Map HTTP validation payloads to fields; fall back to section message if unmapped.

Format: reason + fix ([microcopy-voice](microcopy-voice.md)).

## Density vs errors

More fields ≠ smaller labels—reduce fields or use sections before shrinking type.

## Implementation note

Validate business rules in the layer your architecture assigns (domain/service); wire submit actions through your design system’s primary action pattern and permission model—document in project binding.
