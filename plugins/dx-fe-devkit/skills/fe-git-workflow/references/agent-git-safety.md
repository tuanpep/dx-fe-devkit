# Agent git safety

Aligns with Cursor user **git safety** rules. Agents are not release managers by default.

## Never without explicit user request

- `git commit`, `git push`, `git push --force`
- `git reset --hard`, `git rebase -i`
- `git config` changes
- Merge to protected default branch
- `--no-verify` / skip hooks

## When user asks to commit

1. `git status`, `git diff` (staged + unstaged), `git log -1` for style.
2. No secrets in diff ([fe-security](../../fe-security/references/secrets-and-config.md)).
3. Message per [commits-and-messages](commits-and-messages.md) + repo history.
4. If hook fails — **new** commit; do not amend unless user rules allow.

## When user asks for PR

- Use `gh` per user **creating-pull-requests** rule.
- Do not push unless branch needs publishing — ask when unclear.

## Rebase / conflict

- Prefer user resolves hard conflicts on protected workflows.
- Explain conflict files; suggest `git status` outcome.

## Reading git state

- OK to run read-only: `status`, `diff`, `log`, `branch -vv` for architecture/tasks.

## CI artifacts

- Do not commit `playwright/.auth`, coverage noise, or local-only paths — binding `.gitignore`.