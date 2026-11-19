# Secrets & client config

Anything in the client bundle or `NX_PUBLIC_*` / `VITE_*` is **public**.

## Never ship in client

- API shared secrets, HMAC keys, private keys
- Internal admin URLs that bypass auth when visited
- Service account credentials
- “Security through obscurity” feature flags that grant write access

## Acceptable public config

- OAuth **client id** (public client)
- Analytics measurement IDs when product accepts visibility
- Feature toggle **names** — not secret values that unlock server paths
- Known API **base URL** for environment

## Build pipeline

- Scan PRs that add new `process.env.NX_PUBLIC` / `import.meta.env` references.
- Source maps: binding policy for public vs private hosting (maps can leak paths).

## Logs & errors

- Do not log PII, tokens, or full authorization headers in browser console in production builds.
- Error boundaries: user-safe message; correlation id from server ok.

## Architectural smell

[fe-architecture architectural-smells](../../fe-architecture/references/architectural-smells.md): public env vars only in FE; never confuse with server secrets.