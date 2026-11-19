# Third-party scripts & embeds

Document every new script in binding **third-party / CSP** section.

## Script tags & widgets

- Load from known URL; integrity (`SRI`) when binding supports pinned versions.
- Prefer npm package bundled with app over random CDN snippets.
- Chat, maps, payment — isolate behind feature flag and lazy boundary ([fe-performance enterprise-screens](../../fe-performance/references/enterprise-screens.md)).

## iframe

| Rule | Detail |
| ---- | ------ |
| `sandbox` | When embedding untrusted HTML — binding attr set |
| `referrerPolicy` | Follow binding |
| Size / origin | Only approved origins in `frame-src` |

## Module Federation

Remotes are same trust tier as shell code supply chain — pin versions, verify remote URL in binding ([nx-and-mf](../../fe-architecture/references/nx-and-mf.md)).

## `postMessage` ([OWASP HTML5](https://cheatsheetseries.owasp.org/cheatsheets/HTML5_Security_Cheat_Sheet.html))

**Send**

- Exact `targetOrigin` — never `*` for sensitive payloads.

**Receive**

```typescript
function onMessage(event: MessageEvent) {
  if (event.origin !== binding.trustedEmbedOrigin) return;
  if (!isAllowedMessage(event.data)) return;
  // use data — never eval, never innerHTML
}
```

- Exact origin match — no substring `indexOf`.
- Schema-validate `event.data` (discriminated union / zod per binding).
- Remove listener on unmount.

## Links

`target="_blank"` → `rel="noopener noreferrer"` ([spa-checklist](spa-checklist.md)).

## Subresource integrity

When loading third-party **static** scripts outside bundle, coordinate SRI hash updates on version bump.