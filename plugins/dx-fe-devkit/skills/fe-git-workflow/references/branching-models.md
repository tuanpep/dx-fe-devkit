# Branching models

Pick **one** primary model per repo — document in binding.

## Comparison

| | Trunk-based | GitHub Flow | GitFlow |
| --- | --- | --- | --- |
| Long-lived branches | Trunk only | `main` only | `main` + `develop` + `release/*` |
| Branch lifetime | Hours–2 days | 1–3 days | Days–weeks |
| Releases | Continuous from trunk | Merge → deploy | Versioned from `release/*` |
| Feature flags | Often required for WIP | Sometimes | Less (branch isolation) |
| Conflict risk | Low with small PRs | Low–medium | Higher on long branches |
| Best fit | CD, SaaS | Most web teams | Mobile, LTS, regulated cadence |

Sources: [Atlassian TBD](https://www.atlassian.com/continuous-delivery/continuous-integration/trunk-based-development), [GitHub Flow](https://docs.github.com/get-started/using-github/github-flow), [nvie GitFlow](https://nvie.com/posts/a-successful-git-branching-model/).

## DX FE DevKit default

Enterprise **React admin** repos in this kit usually ship **GitHub Flow** or **scaled trunk-based**:

- One integration branch (`main`).
- Short `feat/*` / `fix/*` branches.
- PR + CI before merge.
- Optional semver tags for hosted releases — not a parallel `develop` line unless product requires it.

Use [gitflow-classic](gitflow-classic.md) when binding explicitly lists `develop`, `release/x.y`, and hotfix backmerge rules.

## Anti-pattern

Running GitFlow ceremony without release cadence — long-lived `develop` diverges from `main`, merge pain, “release week” heroics. Prefer trunk + flags when CD is the goal (modern guidance from GitFlow’s author and semantic-release docs).

## Decision checklist

```
- [ ] Single production version? → trunk / GitHub Flow
- [ ] Multiple supported versions in prod? → consider GitFlow or trunk + release branches from tags
- [ ] Scheduled QA freeze on release branch? → GitFlow release/*
- [ ] Deploy on every green main? → trunk-based
```