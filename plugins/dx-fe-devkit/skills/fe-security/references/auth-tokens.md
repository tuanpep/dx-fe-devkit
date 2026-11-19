# Auth tokens (browser)

Follow **binding auth model**. IETF BCP: prefer keeping access tokens **out of persistent browser storage** when using OAuth in browser apps ([RFC 10017](https://www.rfc-editor.org/rfc/rfc10017.html), [Curity SPA practices](https://curity.io/resources/learn/spa-best-practices/)).

## Models (typical enterprise)

| Model | Browser holds | FE responsibilities |
| ----- | --------------- | --------------------- |
| **BFF + HttpOnly cookie** | Opaque session cookie | Call BFF origin only; include CSRF header on writes ([csrf-and-sessions](csrf-and-sessions.md)) |
| **Bearer in memory** | Access token in app memory (module session) | No `localStorage` persistence unless binding explicitly accepts risk |
| **PKCE public client** | Code exchange via binding library | No client secret in bundle; exact redirect URIs |

## Storage comparison (when binding allows choices)

| Location | Risk |
| -------- | ---- |
| `localStorage` | Survives tabs; trivial exfiltration on XSS |
| `sessionStorage` | Tab-scoped; still readable on XSS |
| Memory / closure | Better; lost on refresh unless re-auth |
| HttpOnly cookie | Not JS-readable; needs CSRF strategy |

**Do not** log tokens, paste in errors, or send to analytics.

## API client (`features/*/api`)

- Attach credentials per binding axios/fetch wrapper in one place — not per hook.
- Refresh: single module owner; backoff; clear state on hard 401 when binding says logout.
- Silent renew via hidden iframe only when binding library documents it — expect third-party cookie constraints.

## Public client rules

- Authorization Code + **PKCE** for SPA (no implicit grant).
- Register **exact** redirect URIs — no wildcard suffix tricks.

## Module Federation / micro-frontends

- Shared auth provider in shell; remotes do not implement separate token persistence.
- Cross-origin remotes: coordinate cookie domain and CSP with platform team ([nx-and-mf](../../fe-architecture/references/nx-and-mf.md)).

## Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| Copy access token from URL hash to `localStorage` | Binding library handles callback route once |
| Custom JWT decode for authorization | Use server claims via `/me` or introspection |
| Storing refresh token in SPA for convenience | BFF or binding-managed refresh |