# Trunk-based & GitHub Flow

Default playbooks when binding model is `trunk` or `github-flow`.

## Daily loop

| Step | Action |
| ---- | ------ |
| 1 | `git fetch`; branch from **latest** default branch |
| 2 | `[prefix]/[ticket]-short-topic` — [branch-naming](branch-naming.md) |
| 3 | Small commits — [commits-and-messages](commits-and-messages.md) |
| 4 | Push; open PR early (draft OK) |
| 5 | CI green + review → merge per policy |
| 6 | Delete remote branch if binding says yes |

## Integration branch

- **Only** binding default branch is production source of truth (usually `main`).
- Rebase or merge default into feature branch before merge if policy requires up-to-date PR.
- No direct pushes to protected default (humans/agents).

## Incomplete work on trunk

| Technique | When |
| --------- | ---- |
| **Feature flags** | Behavior not ready for users |
| **Thin PRs** | Vertical slice partial with tests |
| **Draft PR** | Visibility without merge |

Do not hoard weeks of commits on one branch.

## Monorepo (Nx)

- Scope CI to affected projects when binding documents `nx affected`.
- Branch still targets **repo** default; app release may be separate pipeline.

## With semantic-release

- Conventional Commits on `main` drive version — avoid GitFlow `develop` unless release plugin configured for it ([branching-models](branching-models.md)).