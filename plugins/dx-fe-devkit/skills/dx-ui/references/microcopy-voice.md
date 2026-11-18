# Microcopy and voice (enterprise admin)

Ant [copywriting](https://ant.design/docs/spec/copywriting) and [buttons](https://ant.design/docs/spec/buttons). Index: [ant-spec-index](ant-spec-index.md).

**Ant button rules:** at most one **primary** per group; default safe when unsure; verb labels; reading-flow placement (conversation vs navigation order); footer actions when body is collapsed or multi-group.

## Voice attributes

| Attribute | Means |
| --------- | ----- |
| **Active** | “Save changes” not “Changes will be saved” |
| **Direct** | State what happened and what to do next |
| **Plain** | Avoid internal codenames in user-facing errors |
| **Calm** | No jokes on error pages for admin |

## Buttons

| Do | Don't |
| -- | ----- |
| Save, Delete, Export, Create | Submit, OK, Yes, Click here |
| Verb reflects outcome | Generic “Continue” without context |

Sentence case on buttons (product convention).

## Errors

Template:

```text
[What failed]. [What user can do].
```

Examples:

- “Cannot save. Fix the highlighted fields and try again.”
- “Connection lost. Check your network and retry.”

Avoid: “Oops!”, “Something went wrong”, error codes alone.

## Links

Descriptive anchor: “Learn about permissions” not “Learn more”.

## Labels and hints

- Every input has visible label.
- Placeholder is example only—not a label and not standing help text.

### No unnecessary hint / help (default off)

**Default:** label only. No helper text, info icons, “Learn more”, empty-state essays, or tooltip gloss unless the user cannot complete the task without it.

| Add hint / help only when… | Skip when… |
| -------------------------- | ---------- |
| Format/constraint is non-obvious (mask, ID rules, irreversible side effect) | Label already names the field (“Email”, “Start date”) |
| Error recovery needs a short fix path | Restating the label (“Enter your name”) |
| Icon-only control needs a name (tooltip / aria-label) | Decorative tip, onboarding blurb, or “how this works” on every field |

Rules:

- Prefer a **better label** or **validation error** over permanent hint text.
- One line max when a hint is justified; no paragraphs under fields.
- No info-icon popovers next to routine fields; no page-level help panels for standard CRUD.
- Empty states: short status + optional one CTA—not tutorials ([feedback-states](feedback-states.md)).

## Confirm dialogs

Title = action; body = consequence + entity name.

Buttons: imperative (“Delete fund”) not “Yes”/“No”.

## Status and badges

Text label always; color reinforces only.

## Tables

- Empty: “No records yet” vs “No results match your filters”
- Column headers: nouns or short phrases; consistent with domain glossary

## Localization

See [locale-and-content](locale-and-content.md) for layout and i18n hazards.
