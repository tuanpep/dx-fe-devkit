# Branch naming

Binding prefix wins. Typical enterprise + ticket tracker:

## Patterns

| Kind | Pattern | Example |
| ---- | ------- | ------- |
| Feature | `feat/<ticket>-<kebab-topic>` | `feat/ORD-123-export-csv` |
| Bugfix | `fix/<ticket>-<kebab-topic>` | `fix/ORD-456-null-status` |
| Chore | `chore/<topic>` | `chore/bump-eslint` |
| Release (GitFlow) | `release/<semver>` | `release/2.1.0` |
| Hotfix | `hotfix/<semver>-<topic>` | `hotfix/2.0.1-auth-cookie` |

## Rules

- Lowercase kebab for topic segment.
- Ticket id when binding uses Jira/Plane (aligns with PR title).
- No personal usernames in branch names unless binding requires.
- Short but searchable — `feat/login` too vague at scale.

## Base branch

| Model | Branch from |
| ----- | ------------- |
| GitHub Flow / trunk | `main` |
| GitFlow feature | `develop` |
| Hotfix | `main` (GitFlow) |

Confirm with `git fetch` before create.

## Long-lived branches

Only binding lists: `main`, `develop`, optional `release/*`. Everything else is **temporary**.