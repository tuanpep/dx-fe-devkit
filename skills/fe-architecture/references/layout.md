# App → module → feature layout

Module shell rules: [module-shell.md](module-shell.md). Placement: [depth-and-anti-flatten.md](depth-and-anti-flatten.md).

## Why a module layer

The **module** is the product boundary: URL space, nav, i18n, shared chrome. It **composes** `features/<slice>/`; it does not own a full workflow alone.

Comparable shapes: Nx thin app + libs; Bulletproof `src/features/*`; Cal `packages/features/*`. Pattern here:

```text
<appSrc>/
  (bootstrap, providers, optional MF entry)
  <routeTable>/                 # merges modules
  <modulesRoot>/<product>/
    index.ts                    # public to app — routes + nav
    routing/
    translations/               # if i18n is modular
    ui/ | shared/ | data/       # optional cross-feature
    features/<slice>/
      api/ | data/ | domain/ | ui/
    AGENTS.md                   # optional product contract
```

Exact names vary — bind in repo `AGENTS.md`.

## Ownership

| Layer | Must own | Must not own |
| ----- | -------- | ------------- |
| App | Route merge, global providers | Feature screens, domain rules |
| Module | URLs, nav, module i18n, shared chrome | One feature’s full workflow |
| Feature | End-to-end capability | Sister feature private files |
| `domain/` | Pure rules, types | React, HTTP |
| `data/` | Async state, keys, hooks | Heavy JSX |
| `ui/` | Screens, composition | Raw HTTP bypassing `api/` |

## Import direction

```text
app route table  →  modules/<product>/index.ts  only
module routing   →  lazy('../features/<slice>/ui/<Page>')
module ui/data   →  features/<other>/index.ts  (public API)
features         →  module shared, design-system, workspace libs
feature A        →  feature B private  ❌
module A         →  module B  ❌
```

Inside a feature: **direct relative imports** — not through own barrel.

## Where to put new code

| Adding | Location |
| ------ | -------- |
| New product area | New `modules/<product>/` + app registration |
| Screen / workflow | `features/<slice>/ui/` + module route |
| HTTP client | `features/<slice>/api/` |
| Query / list state | `features/<slice>/data/` |
| Business rule | `features/<slice>/domain/` |
| Chrome for ≥2 features | `module/ui/` |
| Cross-feature cache helpers | `module/data/` |
| Pure TS shared in module | `module/shared/` |
| Second **module** needs same code | workspace lib (see below) |
| Design system control | vendor UI package — do not fork |

## Workspace libs (promotion)

**Friction before promotion** — move when a **second product module** (or app) needs the same typed client or UI. Early promotion widens static import graph ([code-splitting.md](code-splitting.md)).

| Promote | When |
| ------- | ---- |
| `data-access` lib | Same API client in ≥2 modules |
| `ui` lib | Same presentational building blocks across modules |
| `util` lib | Pure types/helpers with no product workflow |

Use monorepo tags (`scope`, `type`) when the repo supports boundary lint.

## Routing, i18n, authority

- Module: `routing/` owns paths, lazy pages, nav config.
- Legacy apps: colocated `*.routes.ts` until strangler completes ([decision-frameworks.md](decision-frameworks.md)).
- Route `authority` / guards are **UI gates** — server must still authorize.
- Register module translations at app bootstrap when using split bundles / MF.
- User-visible strings via repo i18n convention; keep `domain/` locale-free.

## Legacy areas

Maintain behavior on touch; extract layers when editing. Do **not** add new product capabilities only under legacy trees when a module exists for that product.

## App shell (thin)

Bootstrap, provider tree, optional single MF expose. No feature APIs or workflows in the shell.

## Related

- [public-api.md](public-api.md)
- [code-splitting.md](code-splitting.md)
