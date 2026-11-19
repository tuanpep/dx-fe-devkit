# Releases & hotfixes

Binding owns semver, tags, and deploy pipeline.

## Semver tags (common on trunk)

```text
main @ green CI → tag v1.4.0 → deploy job
```

- Tags on **binding** branch only — usually `main`.
- Annotated tags when release notes attached.
- Changelog from Conventional Commits when tooling exists.

## GitFlow release

See [gitflow-classic](gitflow-classic.md): `release/*` → merge `main` + `develop` → tag on `main`.

## Hotfix

| Model | Flow |
| ----- | ---- |
| Trunk/GitHub | `fix/*` or `hotfix/*` → PR → `main` → tag patch → deploy |
| GitFlow | `hotfix/*` from `main` → `main` + `develop` |

Production fix **never** waits on unrelated `develop` work — branch from production line.

## Cherry-pick / backport

When multiple versions supported:

- Cherry-pick commit SHA to `release/x.y` branch per binding.
- Document in PR which versions receive fix.

Agents: cherry-pick only when user requests; verify conflict resolution.

## Consumer vs plugin repo

- **dx-fe-devkit plugin** version in `plugin.json` — separate from app semver.
- App repos: binding `release command` / CI workflow names.

## Emergency

1. Minimal fix branch.
2. Fast review path per binding.
3. Tag and deploy.
4. Post-incident: forward-fix on trunk if needed.