# Permissions and authorization (UX)

UI reflects **server authority**—does not simulate grants. Aligns with trust principle and server-owned workflow.

## Hide vs disable vs read-only

| Pattern | Use when |
| ------- | -------- |
| **Hide** | User should not know feature exists (role has no awareness requirement) |
| **Disable + tooltip** | User knows feature exists but lacks right; explain how to request |
| **Read-only detail** | View without edit; fields displayed as text, not disabled inputs maze |
| **Allow with server error** | Rare—API is final gate; show 403 with reason+fix |

Product policy chooses hide vs disable—**consistent per module**.

## Actions

| Surface | Rule |
| ------- | ---- |
| Primary button | Hidden or disabled with explanation—not clickable no-op |
| Row action | Omit icon if denied—avoid disabled row full of grey icons |
| Bulk action | Disabled when any selected row forbidden—or skip forbidden rows with summary |

## Navigation

- Omit nav entries user cannot access—[navigation-admin-ia](navigation-admin-ia.md).
- Direct URL to forbidden route: **exception** page (P7), not empty shell.

## Field-level

- Sensitive fields: mask or omit—not disabled inputs showing secrets.
- Read-only workflow state: badge from server, not editable dropdown pretending choice.

## Data-gated visibility

Some lists show rows user may open via **data rules** not menu permissions—document in product spec; UI still does not bypass IAM on **mutations**.

## Copy

- “You don’t have permission to …” + who can grant if known.
- Avoid blame tone; no error codes alone.

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Client-only permission flag in production | Server enforcement + matching UI |
| Disabled Submit that still fires API | Remove or guard |
| Showing destructive action then 403 always | Hide or disable upfront |

## Testing checklist

- Exercise UI as at least two roles in design review.
- Verify forbidden deep links and row actions.
