# Router adapters (resolve from binding)

Do not guess the stack — read `fe-url-state` in project binding. Patterns below are **reference only**.

## React Router (v6+)

- **Read/write:** `useSearchParams` from `react-router`
- **Stable dependency:** `searchParams` reference is stable for `useEffect`; do **not** mutate the object in place without `setSearchParams`
- **Types:** bridge through Zod parse on `Object.fromEntries(searchParams)` or framework helpers
- **Arrays:** `setSearchParams({ brand: ['nike', 'reebok'] })` supported

Loader-based apps: consider parsing search in the route `loader` and passing typed data via `useLoaderData` to keep pages thin.

## Next.js App Router

- **Server Components (Page):** use the Page **`searchParams` prop** — preferred for initial data fetch on the server
- **Client Components:** `useSearchParams` from `next/navigation` — **read-only**; combine with `useRouter` + `usePathname` to write
- **Suspense:** wrap Client Components that call `useSearchParams` in `<Suspense>` for static/prerendered routes (build requirement)
- **Anti-pattern:** calling `useSearchParams` in a Server Component

Update pattern (client): clone `new URLSearchParams(searchParams.toString())`, mutate, `router.push(\`${pathname}?${params}\`)` or `replace` ([Next.js docs](https://nextjs.org/docs/app/api-reference/functions/use-search-params)).

Optional binding libraries: `nuqs` for typed hooks — document in binding if adopted.

## TanStack Router

- **Validate at route:** `validateSearch` on the route definition returns typed search
- **Structured state:** supports JSON-serializable nested data better than raw `URLSearchParams`
- **Decouple from pathname:** search updates without pathname changes are first-class

Align Zod schemas between TanStack `validateSearch` and shared `domain/` parsers to avoid drift.

## Vanilla / tests

`URLSearchParams` + `window.history.replaceState` in unit tests; prefer testing **parse/serialize** in `domain/` without mounting the router when possible ([testing](testing.md)).

## Auth redirects

Params named `next`, `returnUrl`, `redirect`, `relayState` are **not** generic URL state — use `@fe-security` redirect allowlists before navigation.