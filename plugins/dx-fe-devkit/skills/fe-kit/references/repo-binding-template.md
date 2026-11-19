# Repo binding template

Copy to `.cursor/skills/project-binding.md` **or** split into the per-skill paths in [resolve-binding.md](resolve-binding.md). Fill only sections your repo needs.

## Architecture (`fe-architecture`)

| Field | Notes |
| ----- | ----- |
| App source | e.g. `apps/admin/src/` |
| Module root | e.g. `modules/<product>/` |
| Feature root | `features/<slice>/` |
| Layer folders | `api/`, `data/`, `domain/`, `ui/` |
| Cross-slice import policy | `index.ts` only (default) |
| Internal import rule | Direct paths inside slice OK |
| Shared libs | Workspace packages |
| Legacy strangler path | `views/`, etc. |
| Lazy route pattern | `lazy(() => import('.../*Page'))` |
| Module Federation | expose / remote names |
| Nx app project name | |
| lint / test / build commands | |
| HTTP client / API types package | |
| Review auditor overlays | Optional per-module rules |

Schema detail: [fe-architecture project-binding-schema](../../fe-architecture/references/project-binding-schema.md).

## Git workflow (`fe-git-workflow`)

| Field | Notes |
| ----- | ----- |
| Workflow model | `trunk` \| `github-flow` \| `gitflow` |
| Default branch | e.g. `main` |
| Feature branch prefix | `feat/`, `feature/` |
| Commit format | `conventional` or freeform |
| PR merge method | squash / merge / rebase |
| Delete branch on merge | yes/no |
| Protected branches | |
| Release tag pattern | e.g. `v*.*.*` |
| Hotfix policy | trunk-only vs GitFlow |

Detail: [fe-git-workflow schema](../../fe-git-workflow/references/project-binding-schema.md).

## Naming (`fe-naming`)

| Field | Notes |
| ----- | ----- |
| Component file casing | PascalCase vs kebab — one per repo |
| Test file suffix | `*.spec.ts(x)` vs `*.test.*` |
| Module / feature path pattern | e.g. `modules/<kebab>/features/<kebab>/` |
| API types package | OpenAPI / shared client — field names fixed |
| Enum member casing | |
| i18n key namespace | e.g. `<module>.<feature>.*` |
| Naming lint command | ESLint naming rules if any |

Detail: [fe-naming schema](../../fe-naming/references/project-binding-schema.md).

## UI stack (`dx-ui`)

Table/form/dialog components, tokens, verify — [dx-ui project-binding-template](../../dx-ui/references/project-binding-template.md).

## Testing (`fe-testing`)

| Field | Notes |
| ----- | ----- |
| Test runner command | e.g. `nx run <app>:test` |
| Single-file command | `--runTestsByPath` pattern |
| E2E command (if any) | Playwright / Cypress |
| E2E base URL | Staging vs local |
| E2E auth setup | `storageState` path, setup project |
| Test wrapper (`render`) | Path to test-utils |
| `jest-setup` / setupFiles | |
| MSW location | Handlers + browser worker flag |
| MSW `onUnhandledRequest` | `error` recommended in CI |
| jest-axe | yes/no; violation allowlist |
| Colocated spec required | Per verify-matrix / module AGENTS |
| Coverage threshold | If enforced |
| Deterministic faker seed | Optional |

## i18n (`fe-i18n`)

| Field | Notes |
| ----- | ----- |
| Library | e.g. react-i18next, react-intl |
| Default / fallback locale | Usually `en` |
| Source locale for verify | Baseline for parity |
| Locale file glob | e.g. `locales/<lng>/*.json` |
| Namespace pattern | Per module vs per feature |
| Plural mode | i18next suffix vs `i18next-icu` |
| verify command | CI key parity / literals lint |
| Shipped locales list | |
| WIP locale policy | Allowed lagging locales |
| RTL locales | `ar`, `he`, … |
| Direction helper path | Updates `html[dir]` |
| Date/number formatter | Module or shared util |
| Language persistence | localStorage / profile API |

## Forms (`fe-forms`)

| Field | Notes |
| ----- | ----- |
| Form library | e.g. React Hook Form, Ant Form |
| Schema library | e.g. Zod + resolver package |
| Field wrapper components | `ControlledField`, `FormField`, etc. |
| Validation error API shape | `fieldErrors` map, RFC7807, etc. |
| `mapValidationErrors` path | Shared mapper module |
| Form action/footer component | Sticky save pattern |
| Debounce ms (search fields) | |
| Date/time timezone policy | |
| Draft / save API | If any — no fake draft otherwise |

## Security (`fe-security`)

| Field | Notes |
| ----- | ----- |
| Auth model | BFF+cookie, bearer memory, OIDC library |
| Token persistence policy | Explicit if any browser storage allowed |
| CSRF header / token pattern | For cookie session mutations |
| OAuth client id | Public; redirect URIs registered |
| CSP owner / ticket process | Who updates `connect-src`, `frame-src` |
| Redirect allowlist or path map | `returnUrl`, `next`, in-app deep links |
| HTML / markdown sanitizer | Library + config path |
| Upload max size / MIME (client UX) | Must match server rules |
| Presigned storage origins | For CSP `connect-src` |
| Trusted `postMessage` origins | Iframe / payment / chat |
| Third-party script registry | Analytics, maps, support widgets |
| Security test command | Optional checklist automation in CI |

## Performance (`fe-performance`)

| Field | Notes |
| ----- | ----- |
| Bundle budget command | CI fails on gzip/brotli over limit |
| Lighthouse CI command / config path | Representative URLs (login, heaviest list, dashboard) |
| Lighthouse URLs | Auth strategy for lab (storage state, test user) |
| Image loader / CDN | Responsive widths, modern formats |
| RUM dashboard or web-vitals integration | p75 LCP/INP/CLS; segment mobile/desktop |
| `route-ready` marks | Optional `performance.measure` names for SPA nav |
| Virtualize row threshold | When tables must window rows |
| Third-party script owners | Chat, maps, analytics deferral |