---
name: fe-url-state
description: >-
  Enterprise React URL search params: when to persist filters, sort, pagination,
  and tabs in the query string; parse/validate untrusted input; history replace vs
  push; React Query key sync; router-specific APIs via binding. Binding fe-url-state.
  Use for list filters, shareable views, back/forward-friendly tables, deep links,
  or syncing client state with searchParams.
---

# FE URL state (search params)

Portable skill (`plugins/dx-fe-devkit/skills`). **Router & helpers:** [repo-binding](../fe-kit/references/repo-binding-template.md#url-state-fe-url-state) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md). **Slice placement:** `@fe-architecture` [server-state](../fe-architecture/references/server-state.md).

## Principles

1. **URL for shareable navigation state** — filters, sort, page, page size, active tab, light view mode—not form drafts or secrets ([when-to-use](references/when-to-use-url-state.md)).
2. **Treat query data as untrusted** — parse + Zod (or binding schema) with safe defaults; strip unknown keys ([parse-and-validate](references/parse-and-validate.md)).
3. **Single decoder per screen** — one `parse*SearchParams` / `validateSearch` output drives UI and `queryKey` ([architecture-and-ownership](references/architecture-and-ownership.md)).
4. **History discipline** — `replace` while typing or nudging filters; `push` only for explicit “saved view” actions ([sync-patterns](references/sync-patterns.md)).
5. **Binding picks the router API** — React Router, Next App Router, or TanStack Router; do not mix patterns in one app ([router-adapters](references/router-adapters.md)).

## Read by task

| Situation | Read |
| --------- | ---- |
| Should this state live in the URL? | [when-to-use-url-state](references/when-to-use-url-state.md) |
| Zod schema, defaults, arrays, dates | [parse-and-validate](references/parse-and-validate.md) |
| Debounce, replace vs push, bidirectional sync | [sync-patterns](references/sync-patterns.md) |
| React Router / Next / TanStack specifics | [router-adapters](references/router-adapters.md) |
| Slice files, hooks, query keys | [architecture-and-ownership](references/architecture-and-ownership.md) |
| RTL tests, MSW, E2E links | [testing](references/testing.md) |
| Footguns | [anti-patterns](references/anti-patterns.md) |

## Workflow

```
Resolve binding (router + param naming) → list which keys are URL-owned →
schema + defaults in domain/ → parse on entry → wire list query queryKey(filters) →
update URL via binding adapter (replace + debounce for text) →
@fe-testing URL cases → optional @fe-security if params navigate or redirect
```

| Step | Action |
| ---- | ------ |
| 0 | Binding: router library, update API, shared serializer lib (if any), canonical param names |
| 1 | Decide URL vs memory vs server preset id ([when-to-use](references/when-to-use-url-state.md)) |
| 2 | Define typed `*ListSearch` / `*ViewSearch` schema; document param keys in binding |
| 3 | On load: parse → validated state → `defaultValues` for filter UI + `queryKey` |
| 4 | On change: update URL then derive fetch params (or derive from URL in one hook) |
| 5 | Large filter trees: store preset server-side; URL holds `presetId` only |
| 6 | Auth `next` / `returnUrl`: `@fe-security` [redirects](../fe-security/references/redirects-and-navigation.md) |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Query keys include filter object | `@fe-naming` [query-and-mutations](../fe-naming/references/query-and-mutations.md), `@fe-architecture` [server-state](../fe-architecture/references/server-state.md) |
| Filter form UX, apply/clear | `@dx-ui` [data-tables-density](../dx-ui/references/data-tables-density.md) |
| Table perf, virtualize | `@fe-performance` [enterprise-screens](../fe-performance/references/enterprise-screens.md) |
| Open redirect query params | `@fe-security` [redirects-and-navigation](../fe-security/references/redirects-and-navigation.md) |
| List/filter tests | `@fe-testing` |

## Out of scope

Marketing SEO keyword slugs, server-only cache keys, non-React routers, encoding business authorization in the URL (use API + normal authz UI).

## External references

- [TanStack Router — Search params](https://tanstack.com/router/latest/docs/guide/search-params) (typed validation, JSON-serializable state)
- [React Router — `useSearchParams`](https://reactrouter.com/api/hooks/useSearchParams)
- [Next.js — `useSearchParams`](https://nextjs.org/docs/app/api-reference/functions/use-search-params) (Client + `Suspense`; Server Page `searchParams` prop)
- [Persist filters in URL](https://www.react-query-builder.com/v2/recipes/persist-filters-in-url) (untrusted input, replaceState, preset id pattern)