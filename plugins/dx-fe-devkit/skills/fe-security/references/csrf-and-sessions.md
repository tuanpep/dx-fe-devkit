# CSRF & cookie sessions

Applies when binding uses **cookie-based** session or BFF with HttpOnly cookies. Bearer-only `Authorization` headers are not CSRF-proof alone if cookies also authenticate — know your stack.

> XSS defeats CSRF defenses. Ship XSS controls first ([xss-and-html](xss-and-html.md)).

## BFF pattern (common)

| Control | Role |
| ------- | ---- |
| `SameSite=Strict` (or `Lax` per binding) | Limits cross-site cookie sends |
| Custom header on mutations (`X-CSRF`, `X-Requested-With`, etc.) | Simple requests from foreign origins omit header |
| Double-submit or synchronizer token | Binding library provides token + header name |
| CORS | API accepts only SPA origin |

FE must use the **shared API client** so every POST/PUT/PATCH/DELETE includes the header.

## Implementation checklist

- [ ] Read CSRF token from cookie/meta/binding endpoint on bootstrap if required
- [ ] Refresh token rotation handled without dropping in-flight mutations
- [ ] Login and logout are state-changing — include CSRF when binding says so
- [ ] File upload via cookie auth includes same protections (multipart + header)

## Safe methods

Do not perform deletes or state changes via GET query links (emails, crawlers).

## When not applicable

Pure bearer token in `Authorization` with **no** auth cookies: CSRF class differs; still prevent XSS token theft ([auth-tokens](auth-tokens.md)).

## Server pairing

FE checklist is insufficient without backend validation of token + session binding ([OWASP CSRF](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Request_Forgery_Prevention_Cheat_Sheet.html)).