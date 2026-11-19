---
name: fe-security
description: >-
  Enterprise React SPA security: XSS/HTML, auth token handling (BFF vs bearer),
  CSRF with cookie sessions, open redirects, uploads, CSP coordination, secrets
  in bundles, postMessage, third-party scripts. Binding section fe-security.
  Use for login/OAuth, URL params, rich text, file pickers, iframe/MF embeds,
  new API clients, or verify matrix auth/upload/HTML changes.
---

# FE security

Portable skill (`plugins/dx-fe-devkit/skills`). **Repo facts:** [repo-binding](../fe-kit/references/repo-binding-template.md#security-fe-security) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md).

**Frontend role:** prevent obvious client-side footguns; never replace server enforcement. UI hide ≠ authorization ([authorization-ui](references/authorization-ui.md), [@dx-ui permissions-ux](../dx-ui/references/permissions-ux.md)).

## Principles

1. **Server is authoritative** — every mutation and sensitive read validated API-side; 403 is acceptable; client flags are UX only.
2. **Assume XSS can happen** — minimize blast radius: no long-lived tokens in `localStorage` when binding chooses BFF/cookie model ([auth-tokens](references/auth-tokens.md)).
3. **Validate outbound navigation** — redirects, `window.open`, OAuth `redirect_uri`, deep links ([redirects-and-navigation](references/redirects-and-navigation.md)).
4. **Binding wins** — sanitizer library, redirect allowlist, auth stack, CSP owner, upload limits documented once per repo.
5. **Defense in depth** — XSS breaks CSRF mitigations ([OWASP CSRF](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Request_Forgery_Prevention_Cheat_Sheet.html)); fix both classes.

## Read by task

| Change or review | Read |
| ---------------- | ---- |
| Rich text, markdown, HTML render, `dangerouslySetInnerHTML` | [xss-and-html](references/xss-and-html.md) |
| Login, refresh, token storage, API client attach | [auth-tokens](references/auth-tokens.md) |
| Cookie session / BFF mutations | [csrf-and-sessions](references/csrf-and-sessions.md) |
| `returnUrl`, `next`, query deep link, `navigate(` | [redirects-and-navigation](references/redirects-and-navigation.md) |
| File input, drag-drop, presigned upload | [uploads-and-downloads](references/uploads-and-downloads.md) |
| Inline script, analytics tag, `connect-src` break | [csp-and-headers](references/csp-and-headers.md) |
| `NX_PUBLIC_*`, env in bundle, feature flags | [secrets-and-config](references/secrets-and-config.md) |
| Hide button, route guard, role UI | [authorization-ui](references/authorization-ui.md) |
| iframe, MF remote, `postMessage`, chat widget | [third-party-and-embeds](references/third-party-and-embeds.md) |
| PR / release gate | [spa-checklist](references/spa-checklist.md) |

## Workflow

```
Resolve binding auth model → classify feature (HTML / nav / upload / session) →
apply reference doc → walk spa-checklist items for that area →
fe-kit verify-matrix (checklist; security tests if binding defines them)
```

| Step | Action |
| ---- | ------ |
| 0 | Read binding: auth model, sanitizer, redirect allowlist, CSRF header name, CSP owner |
| 1 | Identify trust boundary crossed (user HTML, URL param, cross-origin, file bytes) |
| 2 | Implement using binding libraries/patterns — do not invent crypto or allowlists |
| 3 | Confirm server still enforces (coordinate if API missing checks) |
| 4 | [verify-matrix](../fe-kit/references/verify-matrix.md): Auth / upload / HTML → checklist |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Permission UX copy / hide-disable | `@dx-ui` [permissions-ux](../dx-ui/references/permissions-ux.md) |
| Public env, layer smells | `@fe-architecture` [architectural-smells](../fe-architecture/references/architectural-smells.md) |
| MF remotes, shell | `@fe-architecture` [nx-and-mf](../fe-architecture/references/nx-and-mf.md) |
| Forms file fields | `@fe-forms` |

## Out of scope

WAF rules, IAM policy design, pen-test execution, backend-only crypto, mobile native. Document handoffs to security/platform in binding when FE touches only half the control.

## External SSOT (cite, do not duplicate)

| Topic | Link |
| ----- | ---- |
| XSS | [OWASP XSS Prevention](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html) |
| CSRF | [OWASP CSRF Prevention](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Request_Forgery_Prevention_Cheat_Sheet.html) |
| CSP | [OWASP CSP](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html) |
| OAuth browser apps | [RFC 10017 (browser-based apps)](https://www.rfc-editor.org/rfc/rfc10017.html) |
| Open redirect | [OWASP WSTG unvalidated redirect](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Injection/24-Server-side_URL_Redirect) |
| File upload | [OWASP File Upload](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html) |