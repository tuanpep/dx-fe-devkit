# Collaboration surfaces

Patterns for comments, activity, approval rails, and multi-party exchange—common in HCM, ITSM, CRM admin.

## Surface types

| Type | Role |
| ---- | ---- |
| **Comment thread** | Chronological discussion on a record |
| **Activity feed** | System-generated audit lines (status changes) |
| **Side rail** | Comments or exchange beside detail—user keeps record context |
| **@mention** | Notify participant—only when product supports it |
| **Attachment on comment** | Secondary uploads with server size/format rules |

## Layout

- Prefer **panel/rail on detail route** (P2) over modal thread for long-running exchange.
- Activity and comments visually distinct—users must tell human notes from system events.

## Trust

- No delete or edit beyond rules defined in product spec (e.g. edit own comment only).
- Accept/approve actions: single explicit control; show server conflict on duplicate.
- Do not fabricate read/unread or typing indicators without backend.

## Real-time

- If polling or push: show connection degradation; fall back to manual refresh.
- Avoid flashing entire thread on each poll—append or diff politely.

## Accessibility

- Thread navigable by keyboard; new messages announced without stealing focus from composer unless user opts in.

## Empty states

- No comments yet: prompt to add, not fake placeholder messages.
- Exchange disabled by workflow state: explain **why** (status), not generic disable.

## Relation to overlays

Short composer for quick note → popover or inline expand. Sustained dialogue → rail. See [overlays-decision-tree](overlays-decision-tree.md).
