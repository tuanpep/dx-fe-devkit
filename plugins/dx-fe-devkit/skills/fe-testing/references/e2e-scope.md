# E2E scope (Playwright / binding runner)

E2E proves **wiring** the unit/integration stack cannot: real auth, cookies, CDN, WAF, multi-origin, browser engines.

## Always consider E2E when binding requires

- Auth gate + redirect with `returnUrl` ([fe-security redirects](../../fe-security/references/redirects-and-navigation.md))
- Primary create/submit flow with persistence visible after reload
- List filter + row action that changes server state (cross-session)
- Critical payment / compliance workflow flagged in product

## Defer E2E when

- Static marketing content
- Visual variants covered by integration + design review
- Logic fully exercised with MSW on same `*Page`
- Bulk CRUD duplicates integration coverage

## Auth ([Playwright auth](https://playwright.dev/docs/auth))

| Pattern | Use |
| ------- | --- |
| `setup` project + `storageState` | Shared read-only smoke account |
| Per-worker account | Parallel tests **mutate** shared server data |
| `playwright/.auth` in `.gitignore` | Never commit cookies |

Save state **after** post-login condition (URL + stable element), not immediately after click.

IndexedDB auth (Firebase): `storageState({ indexedDB: true })` when binding documents it.

Session storage: Playwright does not persist by default — binding workaround if app uses it.

## Structure

| Piece | Responsibility |
| ----- | -------------- |
| **Spec file** | User journey, assertions on visible outcomes |
| **Page object / fixture** | Locators + actions ([Playwright POM](https://playwright.dev/docs/pom)) |
| **Fixtures** | Authenticated `page` — no global `Page` singleton |

Prefer **getByRole** in E2E same as RTL.

## Stability

- `onUnhandledRequest` N/A — use network assertions sparingly; prefer UI outcomes.
- Avoid `waitForTimeout` — `expect(locator).toBeVisible()` with default timeout.
- Isolated context per test ([isolation](https://playwright.dev/docs/browser-contexts)).

## CI

Use binding `e2eCommand`, base URL, secrets in CI vault — not repo.

Shard by project; smoke subset on PR, full nightly if binding defines tiers.