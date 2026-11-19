# Project binding schema (`fe-git-workflow`)

Repository file: section in `.cursor/skills/project-binding.md` or root `AGENTS.md`.

## Required fields

| Field | Content |
| ----- | ------- |
| **Workflow model** | `trunk` \| `github-flow` \| `gitflow` |
| **Default branch** | `main` / `master` / `develop` (merge target for features) |
| **Feature branch prefix** | e.g. `feature/`, `feat/` |
| **Commit message format** | `conventional` \| `freeform` \| link to template |
| **PR merge method** | squash / merge commit / rebase |
| **Delete branch on merge** | yes/no |
| **Release tags** | semver pattern, who creates tags |
| **Protected branches** | list + required checks |

## Optional fields

| Field | Content |
| ----- | ------- |
| **Fork / contributor flow** | external contributors |
| **Hotfix branch prefix** | `hotfix/` |
| **Release branch prefix** | `release/` |
| **Backmerge policy** | `main` → `develop` automation |
| **Signed commits** | required or not |
| **CHANGELOG** | conventional-changelog / manual |
| **Monorepo** | affected-only CI; branch scope per app |

## Example snippet

```markdown
## Git (`fe-git-workflow`)

| Field | Value |
| ----- | ----- |
| Model | github-flow |
| Default branch | main |
| Branch prefix | feat/, fix/, chore/ |
| Commits | conventional |
| Merge | squash |
```