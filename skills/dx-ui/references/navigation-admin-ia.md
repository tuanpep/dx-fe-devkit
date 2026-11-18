# Navigation and admin information architecture

Ant: [navigation](https://ant.design/docs/spec/navigation), [research-navigation](https://ant.design/docs/spec/research-navigation), [ant-spec-index](ant-spec-index.md).

**IA:** shallow, flat, wide; organize by topic, audience, or task — not org chart alone.

**Five nav types (research):** global (side default for &gt;6 items), back, in-page (header/tabs/anchor), drill-down (list→detail), associative (steps/prev-next).

**Stress test:** land on a deep route without home — user knows location and link destinations.

## App-level (signed-in product)

| Element | Purpose |
| ------- | ------- |
| Product nav | Modules/features user can access |
| Contextual header | Page title, actions |
| Optional breadcrumb | Deep hierarchies only—do not clutter flat modules |

## Product module level

- Route groups per business capability.
- Single public entry for cross-cutting navigation metadata (pattern name only—map in project binding).

## Admin / settings surfaces (org-scale)

Pattern from enterprise admin consoles (settings-scale products):

| Zone | Content |
| ---- | ------- |
| Overview | Health snapshot, pending requests |
| Directory | Users, groups, domains |
| Apps / integrations | Enablement, sandboxes |
| Security | Auth policies, IP allowlists |
| Search | Find setting by keyword when nav > ~15 items |

**Role-scoped nav:** omit sections entirely when forbidden—not disabled tease.

## Queue modules (operational)

Primary IA is **list routes**, not settings:

```text
/module/list → /module/:id/detail
```

Avoid burying main queue under settings nav.

## Deep linking

- Shareable list state in URL when support needs reproduction.
- **Notification deep links** only when product approves (explicitly out of scope for some modules).

## Mobile / narrow

- Collapsible nav; table scroll rules unchanged.
- Critical actions remain reachable—not hidden only in hover menus without keyboard path.

## Related

[page-templates](page-templates.md) P5, [project-binding-template](project-binding-template.md).
