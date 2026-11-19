# Redirects & client navigation

Covers query params (`next`, `returnUrl`, `redirect`, `relayState`), programmatic `navigate`, and `window.location`.

## Open redirect (client)

Attackers abuse trusted domain links in phishing and OAuth chains ([OWASP WSTG](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Injection/24-Server-side_URL_Redirect)).

### Preferred patterns

| Pattern | Use |
| ------- | --- |
| **Server-side map** | `?target=settings` → server resolves to `/settings` |
| **Same-origin path only** | Accept string starting with single `/`, not `//`, not `\` |
| **Allowlist hosts** | Parse with `URL` API; exact scheme+host match — no `indexOf('trusted.com')` |

### Reject or normalize

- `//evil.com` (scheme-relative)
- `/\evil.com`, decoded `%09` before slashes
- `https://trusted.com.evil.com`
- Full URLs when product only needs in-app paths

```typescript
function safeInAppPath(raw: string | null, allowlist: readonly string[]): string {
  if (!raw) return allowlist[0] ?? '/';
  if (!raw.startsWith('/') || raw.startsWith('//') || raw.includes('\\')) return '/';
  try {
    const path = new URL(raw, 'https://placeholder.local').pathname;
    return allowlist.some((p) => path === p || path.startsWith(`${p}/`)) ? path : '/';
  } catch {
    return '/';
  }
}
```

Pattern illustration only — **binding allowlist** is SSOT.

## React Router

- Default unknown deep links to safe home or 404 — not external URL.
- Preserve search params only when each key is validated.

## OAuth / SSO

- Redirect URI must match **registered** values (exact string).
- Never build `redirect_uri` from unvalidated user input.

## `window.open` / downloads

- `noopener,noreferrer` when opening untrusted URLs ([spa-checklist](spa-checklist.md)).
- Prefer same-origin download handlers or signed URLs from API.

## Server redirects

When API returns `302` to attacker URL, client fetch follows — validate at API design; FE should not pass through arbitrary `Location` from JSON without binding rules.