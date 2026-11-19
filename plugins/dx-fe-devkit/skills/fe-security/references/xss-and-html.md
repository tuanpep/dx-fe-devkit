# XSS & HTML rendering

React escapes text by default. Risk concentrates on **escape hatches** and **URL contexts** ([OWASP XSS](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)).

## React patterns

| Safe default | Risky |
| ------------ | ----- |
| `{userText}` in JSX | `dangerouslySetInnerHTML` without sanitizer |
| Binding-approved markdown component | Piping API HTML straight into DOM |
| Design-system `Text` / `Code` | `ref.innerHTML =` |
| Validated router links | `href={unvalidatedUrl}` from query params |

React 19 blocks `javascript:` in many URL attrs — still validate **application-specific** URL schemes and open redirects.

## Rich text & HTML

1. Use **binding sanitizer** (DOMPurify config, server-side cleanse, or CMS pipeline).
2. Restrict tags/attributes in config — no `<script>`, no event handlers, cautious `style`.
3. Prefer markdown → safe render over WYSIWYG HTML when product allows.

```typescript
// Pattern only — library from binding
const clean = sanitizeHtml(untrusted, binding.htmlSanitizerConfig);
return <div dangerouslySetInnerHTML={{ __html: clean }} />;
```

Never sanitize in FE alone when product requires server canonicalization — do both if binding says so.

## Other framework bypasses (when mixed stacks)

Avoid `bypassSecurityTrust*`, Lit `unsafeHTML`, merging untrusted JSON into HTML templates.

## URLs & JSON

| Input | Rule |
| ----- | ---- |
| `javascript:`, `data:` in user-provided links | Reject unless explicit product need + binding allowlist |
| Query echo in `<title>` or meta | Treat as text, not HTML |
| `postMessage` / WebSocket payloads | Schema-validate; never `eval` |

## Testing

- Add RTL case with `<img src=x onerror=...>` string in fields that render user content.
- Security tests in binding (e.g. snapshot of sanitizer output) supersede ad hoc checks.

## dx-ui

Sensitive display uses redaction patterns — [ant-design-comprehensive-guide](../../dx-ui/references/ant-design-comprehensive-guide.md) (masking), not raw HTML.