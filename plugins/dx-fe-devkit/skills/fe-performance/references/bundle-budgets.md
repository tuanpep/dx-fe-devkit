# Bundle budgets

Splitting strategy: [code-splitting](../../fe-architecture/references/code-splitting.md). Binding owns commands and numeric limits.

## Budget types

| Type | Example limit (set in binding) | Enforced by |
| ---- | ------------------------------ | ----------- |
| Initial JS (gzip/brotli) | e.g. 150–250 KB critical path | CI size action / webpack `performance` hints |
| Per-route async chunk | Heaviest list page | Build report diff on PR |
| Third-party script count | Chat + maps documented | Lighthouse `resource-summary` |
| Lab LCP / CLS | p75-aligned caps | Lighthouse CI assertions |

Numbers are **repo-specific** — start from median + buffer ([measurement-workflow](measurement-workflow.md)).

## Bundle hygiene (React enterprise)

| Practice | Detail |
| -------- | ------ |
| Route lazy targets `features/.../ui/*Page` | Never lazy barrel `index.ts` |
| In-page lazy | Charts, rich text, PDF, map — second boundary |
| Design system imports | Per-component paths per `@fe-mantine` / binding |
| Dates & i18n | One library policy; locale chunks async if large |
| Lodash / utilities | Import single functions, not whole package |
| Icons | Subset or generated sprite — avoid importing entire icon set in shell |
| Dev-only | Strip via build define; never ship Storybook tools |

## PR review signals

- New dependency in app shell or module `routing/`.
- Static import of heavy lib in shared `module/ui`.
- Duplicate polyfills across chunks (check analyzer).

## When budget fails

1. Identify chunk in analyzer — which route or import pulled it in.
2. Prefer **lazy boundary** over dependency swap if feature-local.
3. If shared, promote thin wrapper in `module/ui` with lazy inner — still respect [depth-and-anti-flatten](../../fe-architecture/references/depth-and-anti-flatten.md).

## CI references

- [Lighthouse CI](https://github.com/GoogleChrome/lighthouse-ci) — lab metrics + optional `budget.json`
- Webpack [performance hints](https://webpack.js.org/configuration/performance/) — `maxEntrypointSize`, `maxAssetSize`, `hints: 'error'` in production

Do not copy example numbers into consumer repos without measuring.