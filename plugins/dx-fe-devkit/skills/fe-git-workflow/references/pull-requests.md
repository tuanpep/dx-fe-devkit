# Pull requests

## Size

| Guideline | Rationale |
| --------- | --------- |
| Reviewable in **&lt; 30–45 min** | Quality drops on huge diffs |
| One concern | Feature **or** refactor **or** chore — split when possible |
| Kit alignment | Route change + MSW + spec in one PR is OK if one slice |

Use Cursor `split-to-prs` when user asks to split.

## PR description

```markdown
## Summary
[Why — 1–3 bullets]

## Test plan
- [ ] binding test/lint commands
- [ ] manual steps if needed
```

Match user **creating-pull-requests** rule when using `gh pr create`.

## Before open

| Check | Gate |
| ----- | ---- |
| Target branch | Binding default or `develop` (GitFlow) |
| Up to date with base | Rebase/merge if CI requires |
| verify-matrix | [fe-kit](../../fe-kit/references/verify-matrix.md) |
| No WIP commits | Squash fixups or rebase |

## Review

- Address comments with new commits or single squash per team habit.
- Do not force-push `main`/`develop`.
- Force-push **feature** branch only when user asks and no shared work lost.

## Merge

| Method | When |
| ------ | ---- |
| **Squash** | Clean history on trunk; one conventional title |
| **Merge commit** | Preserve branch topology for audit |
| **Rebase merge** | Linear history without squash |

Follow binding. Delete branch after merge when enabled.

## Draft PRs

Early feedback; mark ready when CI green and description complete.