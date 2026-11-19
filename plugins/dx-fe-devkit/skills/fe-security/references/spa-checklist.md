# SPA checklist (release gate)

Binding-specific values live in `project-binding`. Detail: topic references linked from [SKILL.md](../SKILL.md).

## XSS & rendering

- [ ] No `dangerouslySetInnerHTML` without binding **sanitizer** ([xss-and-html](xss-and-html.md))
- [ ] User markdown/HTML uses approved component + config (allowlist tags/attrs)
- [ ] No `eval`, `new Function`, or dynamic script injection from user/API strings
- [ ] URL props in links use validated href builder (not raw query concatenation)

## Navigation & redirects

- [ ] `returnUrl` / `next` / `redirect` validated per binding allowlist or server id map ([redirects-and-navigation](redirects-and-navigation.md))
- [ ] Client `navigate()` to external origins only via explicit product flow (interstitial if required)
- [ ] OAuth / SSO redirect URIs match registered exact URIs — no client-side “prefix” checks

## Auth & session

- [ ] Token storage matches binding auth model ([auth-tokens](auth-tokens.md))
- [ ] Refresh / silent renew does not log tokens or persist to insecure storage
- [ ] Logout clears client session state and calls server revoke when binding requires
- [ ] API client sends credentials per binding (cookie vs `Authorization` header)

## CSRF (when cookie session)

- [ ] State-changing requests include binding CSRF header/token ([csrf-and-sessions](csrf-and-sessions.md))
- [ ] GET (and safe reads) do not mutate state

## Authorization

- [ ] Sensitive actions still return 403 from API — UI is not sole gate ([authorization-ui](authorization-ui.md))
- [ ] No permission flags compiled from untrusted client input
- [ ] Direct URL to forbidden route shows exception UX ([permissions-ux](../../dx-ui/references/permissions-ux.md))

## Uploads & downloads

- [ ] Client enforces binding max size / MIME UX only; server validates ([uploads-and-downloads](uploads-and-downloads.md))
- [ ] Preview of uploads does not execute file as script (use blob URLs with correct type discipline)
- [ ] Download links from API use short-lived signed URLs when binding specifies

## Secrets & config

- [ ] No API keys, shared secrets, or private endpoints in `NX_PUBLIC_*` / Vite public env ([secrets-and-config](secrets-and-config.md))
- [ ] Client bundles reviewed when new env vars added

## Third party & embeds

- [ ] New scripts/widgets documented; loaded per CSP policy ([third-party-and-embeds](third-party-and-embeds.md))
- [ ] `target=_blank` links use `rel="noopener noreferrer"`
- [ ] `postMessage`: exact `targetOrigin`, allowlisted `event.origin`, schema-validated payload

## Headers (coordination)

- [ ] CSP changes requested from binding **CSP owner** — FE lists new `connect-src` / `frame-src` needs ([csp-and-headers](csp-and-headers.md))
- [ ] No reliance on `unsafe-inline` scripts for app features in production