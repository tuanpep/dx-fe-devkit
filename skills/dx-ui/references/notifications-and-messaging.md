# Notifications and messaging

Ant: [feedback](https://ant.design/docs/spec/feedback), [research-message-and-feedback](https://ant.design/docs/spec/research-message-and-feedback). Matrix: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §11.

How to surface outcomes without stealing focus from operational work.

## Ant strength ladder (quick)

| Weaker ← → Stronger |
| Tooltip · Popover · Message · Notification · Alert · Popconfirm · Modal |

- **&gt;2s** operations: loading + cancel option.
- Important **failure**: dialog over 3s message.
- Omit success toast when outcome is already visible.

## Channel taxonomy

| Channel | Blocks task? | Duration | Typical use |
| ------- | ------------- | -------- | ----------- |
| **Inline** | No | Persistent until fixed | Field errors, section validation |
| **Banner** | No | Until dismissed or resolved | Connection degraded, partial outage, policy notice |
| **Toast / flag** | No | Auto-dismiss 3–8s | Save succeeded, background job queued |
| **Modal** | Yes | Until dismissed | Confirm destroy, blocking error needing decision |
| **Empty / error region** | In content area | Until state changes | List fetch failed—[feedback-states](feedback-states.md) |

## Decision tree

```text
User must choose before continuing?
├─ YES → Modal (or blocking overlay)
└─ NO → Continue
    │
    Success of last explicit user action?
    ├─ YES → Toast (lightweight) OR stay on page with inline confirmation
    └─ NO → Continue
        │
        System event unrelated to current gesture?
        ├─ YES → Banner (or notification center if product has one)
        └─ NO → Inline near the control
```

## Content rules

- [reason + fix](microcopy-voice.md) for errors at every channel.
- Toasts: one sentence; no stack of five toasts for bulk operations—**summarize** (“Saved 12 of 12”).
- Banners: persistent problems only; do not rotate marketing copy in admin apps.

## Bulk and background jobs

| Job type | UX |
| -------- | --- |
| Short API call | Button loading + toast |
| Long import/export | Progress dialog then summary modal or results page (P6) |
| Background | Toast “started” + optional notification center entry when done |

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Toast for validation errors | Inline field errors |
| Modal for success only | Toast or inline |
| Error toast with no recovery path | Banner or inline with retry |
| Stealing focus on every poll update | Subtle “Updating…” in content region |

## Accessibility

- Toasts announced without moving focus unless critical.
- Banners with dismiss control keyboard reachable.
- Modal announcements follow overlay rules in [accessibility-wcag](accessibility-wcag.md).
