# Test levels (Testing Trophy)

```
        E2E          few critical journeys
      ─────────
    integration    most feature/page confidence
  ─────────────────
      unit           pure domain, small utils
  ─────────────────
     static          TypeScript, ESLint, binding verify scripts
```

## Static

- Types, lint, i18n key verify, binding CI — run on every PR.
- Cheapest signal; does not replace behavioral tests.

## Unit

| Target | Where |
| ------ | ----- |
| Pure domain rules | `features/<slice>/domain/*.spec.ts` |
| Formatters, guards with no DOM | colocate or `domain/` |
| Reducers / state machines | same folder as source |

No DOM unless testing is cheaper as integration.

## Integration (default for UI)

Render component or page with **real** providers (Query, i18n, theme, router) via binding `render` helper.

| Mock | Do not mock |
| ---- | ----------- |
| HTTP (MSW) | React Query hooks |
| Heavy animation libs (if binding allows) | Child components “for speed” on same screen |
| `window.matchMedia` etc. in setup | Entire `data/` layer |

Covers: list load, filter, form submit, error banner, empty state.

## E2E

Small set of **irreplaceable** paths — real browser, real env or staging API per binding ([e2e-scope](e2e-scope.md)).

| Good E2E | Poor E2E |
| -------- | -------- |
| Auth gate + deep link | Every table column visible |
| Payment-grade create flow | CSS snapshot of static page |
| Cross-module smoke | Logic already covered by MSW integration |

## Decision table

| Change | Minimum level |
| ------ | ------------- |
| `domain/` transition rule | Unit |
| New `ui` component behavior | Integration |
| New `*Page` primary workflow | Integration (+ E2E if binding mandates) |
| API client wiring only | MSW handler test optional; integration preferred |
| Copy / i18n key | Static verify + integration if layout breaks |

## Anti-patterns

- Testing implementation (`useState` call count, private methods).
- Snapshot entire page trees on every PR.
- E2E for logic fixable with MSW integration alone.