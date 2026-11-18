# SPA checklist

- [ ] No `dangerouslySetInnerHTML` without sanitizer from binding
- [ ] URL `returnUrl` / `redirect` validated against allowlist
- [ ] Links with `target=_blank` use `rel="noopener noreferrer"`
- [ ] File uploads: type/size from binding; no execution in browser
- [ ] Secrets not in `NX_PUBLIC_*` or client bundles
- [ ] Permissions enforced server-side — UI hide is not authorization
- [ ] Third-party scripts documented; prefer no inline script without nonce (CSP)