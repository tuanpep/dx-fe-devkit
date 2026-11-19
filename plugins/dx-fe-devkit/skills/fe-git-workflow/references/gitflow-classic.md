# GitFlow (classic)

Use only when **binding** sets `model: gitflow`. Vincent Driessen model — [original post](https://nvie.com/posts/a-successful-git-branching-model/).

## Branch roles

| Branch | Purpose |
| ------ | ------- |
| `main` | Production history; tag releases |
| `develop` | Integration for next release |
| `feature/*` | New work; fork from `develop` |
| `release/*` | Stabilize version; fork from `develop` |
| `hotfix/*` | Production fix; fork from `main` |

## Feature

```text
develop → feature/ABC-123-orders-export → PR → develop
```

Never merge unfinished features direct to `main`.

## Release

```text
develop → release/1.4.0 → QA/fixes only → merge to main (tag) AND develop
```

Release branch: **no new features** — fixes and metadata only.

## Hotfix

```text
main → hotfix/1.3.1-security → merge main (tag) AND develop
```

Automate backmerge to `develop` in CI when possible — manual backmerge errors are common failure mode.

## When to leave GitFlow

- Team ships continuously to one production URL.
- `develop` is always conflicted with `main`.
- Release branches live for weeks.

Migrate plan: freeze `develop`, merge to `main`, adopt [trunk-and-github-flow](trunk-and-github-flow.md) + tags.

## Agents

Follow binding for which branch to target in PRs. Do not create `release/*` without user/product request.