# Search and filters

Ant: [data-list](https://ant.design/docs/spec/data-list). Playbook: [ant-design-comprehensive-guide](ant-design-comprehensive-guide.md) §4.3.

Operational users live in **queues**. Search and filters must compose with list state and persistence—[layout-design](layout-design.md) toolbar region.

**Browse vs work queue:** heavy search/filter chrome is for browse/catalog lists. Fixed or role-scoped **work queues** keep toolbar light (tabs/views + actions)—see [page-templates](page-templates.md) P1. Put rare criteria under **Advanced**, not on first paint.

## Search vs filter

| Mechanism | Answers | Behavior |
| --------- | ------- | -------- |
| **Inquire** | Structured multi-field query | Submit once (query form) |
| **Filter** | Criteria change → results update | Chips/sidebar |
| **Search** | Keywords across attributes | Debounced smart search |
| **Sort** | Order within current result set | Column header or dropdown |

| User pattern | Design for |
| ------------ | ---------- |
| **Known item** | Exact ID/name field |
| **Exploratory** | Search + filters + scannable list |

Do not run heavy search on every keystroke without debounce; show **searching** state.

## Toolbar composition

```text
[ Search field ] [ Quick filters / chips ] [ Advanced ▼ ] [ Primary action ]
[ Active filter summary............................... ] [ Clear all ]
```

| Element | Role |
| ------- | ---- |
| Search | Free text; placeholder is hint only—not a label |
| Chips | Visible active discrete filters |
| Advanced | Opens drawer/dialog for many fields—[overlays-decision-tree](overlays-decision-tree.md) |
| Summary | Human-readable “3 filters active” |
| Clear | Removes filters; confirm if expensive refetch |

## Persistence

| Product rule | UX |
| ------------ | --- |
| Queue spec requires return from detail | Persist search/filter/sort/page in URL or restore state |
| Disposable explore | May reset on navigate away—document explicitly |

**Filter change vs page change:** define whether result list keeps previous rows visible while refetching (avoid conflating pagination cache with filter change).

## Filtered empty vs global empty

| State | Copy / action |
| ----- | ------------- |
| No rows in system | Create CTA, onboarding hint |
| No rows match filters | Clear filters, adjust summary |

See [feedback-states](feedback-states.md).

## Admin / settings search

For P5 deep nav, **settings search** jumps to section—different from data search; see [navigation-admin-ia](navigation-admin-ia.md).

## Accessibility

- Search input has visible label or `aria-label`.
- Filter chips removable via keyboard.
- Announce result count changes where assistive tech benefits.

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Hiding all filters in icon with no summary | Summary string + chips |
| Resetting filters when closing advanced panel | Apply/Cancel explicit |
| Search that looks like filter dropdown | Separate affordances |
