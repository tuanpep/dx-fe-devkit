# Multi-step flows (wizards and long create)

When create/edit cannot fit one scrollable form (P3), split into **steps**—still prefer **route** over modal for long flows.

## When to step

| Signal | Pattern |
| ------ | ------- |
| >15 fields with distinct phases | Stepper (horizontal or vertical) |
| Legal/order dependencies between sections | Locked steps until prior valid |
| Optional branches | Step visible only when condition met |

If <10 fields, use **sections** in one page instead—[forms-validation-ux](forms-validation-ux.md).

## Stepper UX

| Element | Rule |
| ------- | ---- |
| **Progress** | Steps numbered; current clear; completed marked |
| **Navigation** | Next disabled until step valid; Back preserves entry |
| **Summary** | Final step reviews read-only summary before submit |
| **Cancel** | Confirm if dirty |
| **Save draft** | Only if backend supports—no fake draft UX |

## Validation per step

- Validate **current step** on Next—not entire wizard silently.
- Show step-level error summary if multiple fields fail.

## Layout

- Step label in page header; content single column default—[layout-design](layout-design.md).
- Sticky footer: Back | Next or Submit.

## Exit and resume

- Deep link to resume step only if product supports saved incomplete records.
- On success: route to detail (P2) or list per spec—not ambiguous toast-only.

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| 10-step wizard for simple catalog row | Single form |
| Modal wizard for 20+ fields | Routed wizard |
| Losing data on Back without warning | Dirty check |
| Identical fields duplicated across steps | Summary step references prior input |
