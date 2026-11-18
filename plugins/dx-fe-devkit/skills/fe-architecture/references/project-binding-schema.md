# Project binding schema (`fe-architecture`)

Copy this into **the repository** at `.cursor/skills/fe-architecture/references/project-binding.md` (or merge into root `AGENTS.md`).

## Required fields

| Section | Content |
| ------- | ------- |
| **App source** | Root path to application source (e.g. `apps/web/src/`, `src/`) |
| **Module root** | Product boundary pattern (e.g. `modules/<product>/`) |
| **Feature root** | `features/<slice>/` or equivalent |
| **Layers** | `api/`, `data/`, `domain/`, `ui/` names (fixed unless legacy) |
| **Shared libs** | Paths to workspace data-access / UI libs |
| **Legacy strangler** | Optional path for `views/`, `pages/` extraction |
| **Public API** | Feature `index.ts` rules; cross-module import policy |
| **Splitting** | Lazy route entry pattern |
| **Review auditor vars** | `<APP_SRC>`, `<MODULE_ROOT>`, `<RQ_SYMBOLS>`, etc. |
| **HTTP client / API types** | Package or path to generated types |
| **Nx** | Default app project; lint / test / build commands |

## Optional fields

| Section | Content |
| ------- | ------- |
| Module Federation | expose name, consumer import — see [nx-and-mf.md](nx-and-mf.md) |
| Per-module overlays | Extra auditor rules |
| Internal import rule | e.g. no feature barrel for internal paths |
| Tooling | Test, i18n, forms, security, perf — [repo-binding-template](../../fe-kit/references/repo-binding-template.md) |

## Example

See [examples/project-binding-sample-admin.md](examples/project-binding-sample-admin.md).