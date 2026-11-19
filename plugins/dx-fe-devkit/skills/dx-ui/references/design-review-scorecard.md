# Design review scorecard (hard mode)

Score each dimension **0–2** before approving UI work. **Minimum ship: 2 on trust, accessibility, feedback; none at 0.**

For **P2** screens, also score row **14** (required). For **P4** screens, also score row **15** (required). Use **—** in the output table when a conditional row does not apply.

| # | Dimension | 0 | 1 | 2 |
| - | --------- | - | - | - |
| 1 | **Template fit** | No recognizable P1–P7; or P4 used for master–detail triage | Right family but wrong job mix (list+edit+decide on one route) | Correct P1–P7 + same job matches sibling elsewhere |
| 2 | **Navigation loop** | List resets on back | Partial state | Queue persistence per product spec |
| 3 | **Overlay choice** | Wrong surface (modal home) | Debatably ok | Matches [overlays-decision-tree](overlays-decision-tree.md) |
| 4 | **Table density** | Page scrolls sideways | Scroll ok, columns chaotic | Bounded scroll + priority columns |
| 5 | **Feedback states** | Spinner only | Partial empty/error | All states per [feedback-states](feedback-states.md) |
| 6 | **Microcopy** | Generic errors; hint spam | Mostly imperative; some redundant help | reason+fix; labels visible; **no unnecessary hints** |
| 7 | **Trust / server** | Client workflow fiction | Minor risk | Server truth only |
| 8 | **Spacing hierarchy** | Uniform padding | Minor issues | Proximity clear |
| 9 | **Accessibility** | Keyboard broken | Minor gaps | WCAG checklist pass |
| 10 | **Search / filters** | No summary; list resets | Partial | [search-and-filters](search-and-filters.md) |
| 11 | **Permissions** | Client fiction / mystery meat disabled | Partial | [permissions-ux](permissions-ux.md) |
| 12 | **Messaging channel** | Wrong surface for outcome | Mixed | [notifications-and-messaging](notifications-and-messaging.md) |
| 13 | **Scope** | Undocumented new product surface | — | In approved ticket + domain spec |
| 14 | **Detail sub-template (P2 only)** | Tabs/cards on P2a-eligible content; approval without workflow surface | Sub-template ok but over-separation (cards where dividers suffice) | P2a–P2d matches job per [page-templates](page-templates.md) § P2 + [context-to-choices](context-to-choices.md) §3 |
| 15 | **Workbench layout (P4 only)** | Full embedded list as home; module sprawl | 5–9 modules but weak frequency ordering | Hub per [page-templates](page-templates.md) § P4; per-module empty/error |

## Template fit quick checks (before scoring row 1)

| Pattern | Ask |
| ------- | --- |
| P2 | Named P2a–P2d? Approval → **P2b**? Simple read → **P2a** not default tabs? |
| P4 | Home/landing, not sustained list+detail? ≤9 modules? |
| P5 | Field-count band and single save mode per [page-templates](page-templates.md) § P5? |

## Evidence

- Visual check of changed screens in development environment.
- Reference file that drove the layout decision.
- Manual keyboard steps performed.

## Output format (agent)

```markdown
## Design review — [screen]

| Dimension | Score | Note |
|-----------|-------|------|
| ... | 2 | ... |

**Blockers:** ...
**References used:** ...
```

Track remediation in the product’s issue tracker—not informal TODO lists in repository comments unless that is team policy.
