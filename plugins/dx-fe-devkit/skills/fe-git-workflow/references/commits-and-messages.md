# Commits & messages

Binding: `conventional` vs `freeform`.

## Conventional Commits (recommended)

```text
<type>(<optional scope>): <short description>

[optional body]

[optional footer: BREAKING CHANGE:, Refs: TICKET-123]
```

| Type | Use |
| ---- | --- |
| `feat` | User-visible capability |
| `fix` | Bug fix |
| `refactor` | No behavior change |
| `docs` | Docs only |
| `test` | Tests only |
| `chore` | Tooling, deps |
| `perf` | Performance |
| `ci` | CI config |

| Footer | Use |
| ------ | --- |
| `BREAKING CHANGE:` or `feat!:` | Major semver |
| `Refs: ABC-123` | Tracker link when required |

**Why:** [Conventional Commits](https://www.conventionalcommits.org/) → semver + changelog automation.

## Scope

Align with module or Nx project when helpful: `feat(catalog): add order export`.

## Body

- Explain **why**, not file list (diff shows what).
- One logical change per commit when possible — easier bisect.

## Agent-authored commits

- Only when user explicitly requests commit.
- Draft message from `git diff` — match repo recent style (`git log -5`).
- Never commit secrets, `.env`, auth files ([fe-security](../../fe-security/references/secrets-and-config.md)).

## PR title

Often **same as squash commit** — use conventional single line when binding uses squash merge.

## Co-authored-by

Add only when user provides attribution policy.