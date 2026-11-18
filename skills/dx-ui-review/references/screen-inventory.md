# Screen inventory

Build before a module-wide refactor.

## Table template

| ID | Route / entry | Pattern | Primary job | Sibling ref | Owner slice |
| -- | ------------- | ------- | ----------- | ----------- | ----------- |
| S01 | … | P1 | Triage queue | S02 list in other module | … |

Pattern: P1–P7 from `dx-ui` pattern-vocabulary.

## Clustering

Group by **same job** to detect inconsistency:

| Job cluster | Screens | Must match |
| ----------- | ------- | ---------- |
| Operational queue | S01, S04 | Toolbar, table scroll, back loop |
| Catalog CRUD | S02, S03 | Form footer, confirm deactivate |

## Drift signals

| Signal | Likely gap |
| ------ | ---------- |
| Same job, different overlay choice | overlays-decision-tree |
| Same job, different empty copy | feedback-states |
| One list has filter summary, one not | search-and-filters |

## Output

Attach inventory to gap report appendix; score highest-traffic screens first.
