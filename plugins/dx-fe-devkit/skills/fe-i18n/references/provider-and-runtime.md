# Provider & runtime

Placement: app shell or module provider per [fe-architecture](../../fe-architecture/SKILL.md).

## Bootstrap

| Piece | Typical |
| ----- | ------- |
| `i18n.init` | Default locale, fallback chain, missing key handler |
| `I18nextProvider` / binding wrapper | Wraps router below auth if messages need user locale |
| Namespace preload | Default + active module |

## Language switch

- Persist choice: `localStorage` / cookie / user profile API — binding policy.
- Avoid flash: apply saved locale before first paint when possible.
- After switch: update `dir` + `lang` — [rtl-and-layout](rtl-and-layout.md).

## Missing keys

| Dev | Prod |
| --- | ---- |
| Log / highlight missing | Fallback locale or key suffix per binding |

## SSR / MF (if binding uses)

- Pass locale from host to remote when Module Federation — document in architecture binding.
- Next.js: separate policy in [stack-profiles](../../fe-kit/references/stack-profiles.md).

## User-generated locale

Rare in admin — if end-users pick language, still server-authoritative for legal copy; client only selects among shipped locales.