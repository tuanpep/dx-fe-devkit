# Measurement workflow

Commands come from binding only. This doc describes **what** to measure, not repo-specific scripts.

## Layers

| Layer | Catches | When |
| ----- | ------- | ---- |
| **Build budget** | JS/CSS asset or entrypoint over limit | Every PR build |
| **Lighthouse CI** | Lab CWV + resource counts on fixed URLs | PR / nightly on represent URLs |
| **RUM (field)** | p75 LCP/INP/CLS by route/device | Production + release compare |
| **Custom user timings** | SPA route-ready, table-ready | INP-heavy apps ([spa-rum-and-transitions](spa-rum-and-transitions.md)) |

## Lab (local or CI)

1. Pick URLs from binding: login → default landing, heaviest list, heaviest form/dashboard.
2. **Mobile** throttle + CPU slowdown (DevTools or Lighthouse settings).
3. Run Lighthouse **3+ times**; use median ([Lighthouse CI](https://github.com/GoogleChrome/lighthouse-ci)).
4. Save report when fixing regressions (artifact URL from CI).

### Assertion style (examples for binding owners)

Lighthouse CI can assert scores and metrics (`largest-contentful-paint`, `cumulative-layout-shift`, `interactive` / INP proxies in lab). Resource budgets via assertions or `budget.json` — see [Unlighthouse budget guide](https://unlighthouse.dev/learn-lighthouse/lighthouse-ci/budgets).

Set budgets **slightly above current median** (+10–20%) to block regressions without blocking baseline cleanup.

## Field

- Report **p75** at least, segmented mobile/desktop.
- For authenticated apps, ensure RUM samples post-login routes (sampling rate in binding).
- Compare release versions; alert on metric + bundle size together.

## SPA caveat

CrUX and standard CWV APIs align to **full navigation**. Client-side route changes do not start a new CWV session. Use:

- `performance.mark('route:<name>:start')` at navigation intent
- `performance.measure('route-ready', …)` when primary content ready (data + skeleton resolved)

Assert in Lighthouse CI with `user-timings:` when marks exist in lab URLs.

## Checklist before shipping a perf fix

- [ ] Same device class and URL as baseline
- [ ] Metric improved (not only Lighthouse score)
- [ ] No binding budget regression
- [ ] Functional: filter, sort, modal, keyboard table nav still work (`dx-ui`)