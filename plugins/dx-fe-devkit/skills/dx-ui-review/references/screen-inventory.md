# Screen inventory

Build before a module-wide refactor.

## Table template

| ID | Route / entry | Pattern | Sub-template | Primary job | Sibling ref | Owner slice |
| -- | ------------- | ------- | ------------ | ----------- | ----------- | ----------- |
| S01 | … | P1 | — | Triage queue | S02 list in other module | … |
| S02 | … | P2 | P2b document | Approve record | S03 catalog detail | … |

Pattern: P1–P7 from `dx-ui` [pattern-vocabulary](../../dx-ui/references/pattern-vocabulary.md). **Sub-template:** P2a–P2d when pattern is P2 (Ant [detail-page](https://ant.design/docs/spec/detail-page)); use `—` otherwise.

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
| Same approval job, different detail chrome | page-templates P2 — compare sub-template column |
| “Home” is full table in one module | P4 vs P1 — page-templates § P4 |

## Output

Attach inventory to gap report appendix; score highest-traffic screens first.
