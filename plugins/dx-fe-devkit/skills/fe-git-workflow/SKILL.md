---
name: fe-git-workflow
description: >-
  Enterprise Git workflow: trunk-based, GitHub Flow, or GitFlow per binding;
  branch naming, Conventional Commits, PR size, releases/hotfixes, agent git
  safety. Binding fe-git-workflow in project-binding or AGENTS.md. Use when
  creating branches, commits, PRs, releases, rebasing, cherry-picks, or
  onboarding to team git policy.
---

# FE git workflow

Portable skill (`plugins/dx-fe-devkit/skills`). **Team SSOT:** [project-binding](references/project-binding.md) → consumer `AGENTS.md` / `project-binding.md` ([schema](references/project-binding-schema.md)) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md).

**Default recommendation for SaaS/admin SPAs:** short-lived branches + PR + trunk always green ([trunk-and-github-flow](references/trunk-and-github-flow.md)). Classical **GitFlow** only when binding says versioned releases / LTS lines ([gitflow-classic](references/gitflow-classic.md)).

## Principles

1. **Binding wins** — branch names, default branch, commit format, who merges.
2. **Small batches** — PRs reviewable in one sitting; align with [fe-kit verify-matrix](../fe-kit/references/verify-matrix.md).
3. **Trunk releasable** — main (or binding trunk) passes CI; no long-lived drift.
4. **Conventional Commits** when binding enables — feeds semver/changelog ([commits-and-messages](references/commits-and-messages.md)).
5. **Agent discipline** — no commit/push/force unless user asks; follow git safety user rules ([agent-git-safety](references/agent-git-safety.md)).

## Choose model (binding)

| Model | When |
| ----- | ---- |
| **Trunk-based / GitHub Flow** | Continuous delivery, single production line |
| **GitFlow** | Scheduled versions, `release/*`, multiple maintained versions |

Detail: [branching-models](references/branching-models.md).

## Read by task

| Situation | Read |
| --------- | ---- |
| Pick or explain team model | [branching-models](references/branching-models.md) |
| Day-to-day feature work | [trunk-and-github-flow](references/trunk-and-github-flow.md) |
| `develop` / `release/*` / hotfix | [gitflow-classic](references/gitflow-classic.md) |
| Branch names | [branch-naming](references/branch-naming.md) |
| Commit / PR title | [commits-and-messages](references/commits-and-messages.md) |
| PR scope, review, merge | [pull-requests](references/pull-requests.md) |
| Version tags, hotfix, backmerge | [releases-and-hotfixes](references/releases-and-hotfixes.md) |
| Agent commit/push/rebase rules | [agent-git-safety](references/agent-git-safety.md) |

## Workflow (feature)

```
Read binding model → branch from correct base → small commits →
verify-matrix gates → PR → squash/merge per policy → delete branch
```

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Split large change | Cursor `split-to-prs` skill |
| PR / gh | User rules + `gh` when requested |
| Consumer repo bootstrap | `@fe-kit` [bootstrap-repo](../fe-kit/references/bootstrap-repo.md) |

## Out of scope

Git hosting admin, runner infra, signed commits PKI setup, monorepo tool choice (Nx already in fe-architecture). Document release automation owner in binding.

## External SSOT

| Topic | Link |
| ----- | ---- |
| GitFlow (original) | https://nvie.com/posts/a-successful-git-branching-model/ |
| GitHub Flow | https://docs.github.com/get-started/using-github/github-flow |
| Trunk-based | https://trunkbaseddevelopment.com/ |
| Conventional Commits | https://www.conventionalcommits.org/ |