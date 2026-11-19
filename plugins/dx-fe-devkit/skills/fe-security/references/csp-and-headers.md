# CSP & security headers (FE coordination)

CSP is usually set at **CDN/host** by binding **CSP owner**. FE documents new origins and removes patterns that violate policy.

## Why FE cares

Strict CSP blocks XSS execution ([MDN CSP guide](https://developer.mozilla.org/en-US/docs/Web/Security/Practical_implementation_guides/CSP), [OWASP CSP](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html)). Misaligned CSP breaks uploads, websockets, or analytics until directives update.

## FE request template (for platform ticket)

When adding integration, list:

| Directive | New origins / notes |
| --------- | ------------------- |
| `connect-src` | API, BFF, WebSocket, presigned storage |
| `img-src` / `media-src` | CDN, `blob:` if previews |
| `frame-src` | Payment, docs, embedded admin tools |
| `script-src` | Avoid new third-party inline scripts |

Prefer **nonce + `strict-dynamic`** for hosted SPA when platform uses it — do not bolt nonce onto every script via middleware (attacker scripts would get nonces too).

## App code habits

- No inline `onclick="..."` — use React handlers.
- No `eval` / `new Function` in app code (blocks strict CSP).
- Dev-only `unsafe-eval` stays in dev server config, not production binding.

## Report-only rollout

Recommend Report-Only first, fix violations, then enforce — platform process in binding.

## Other headers (awareness)

| Header | FE impact |
| ------ | --------- |
| `frame-ancestors` | App cannot be framed if denied — OK for admin |
| `Referrer-Policy` | May affect OAuth debugging — follow binding |
| `Permissions-Policy` | Disable unused APIs (camera, geolocation) |

FE does not set production headers unless binding places them in static host config repo.