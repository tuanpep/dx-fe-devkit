# Design review scorecard (hard mode)

Score each dimension **0–2** before approving UI work. **Minimum ship: 2 on trust, accessibility, feedback; none at 0.**

| # | Dimension | 0 | 1 | 2 |
| - | --------- | - | - | - |
| 1 | **Template fit** | No recognizable P1–P7 | Partial | Correct template + consistency with same job elsewhere in product |
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
