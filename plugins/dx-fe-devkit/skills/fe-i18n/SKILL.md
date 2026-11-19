---
name: fe-i18n
description: >-
  Enterprise React i18n: key structure, namespaces, ICU plurals, interpolation,
  RTL and logical CSS, locale verify CI, dates/numbers. Copy UX from dx-ui
  locale-and-content. Binding fe-i18n. Use when adding strings, locales, RTL,
  plural rules, missing-key CI failures, or API code labels vs translations.
---

# FE i18n

Portable skill (`plugins/dx-fe-devkit/skills`). **Stack:** [repo-binding](../fe-kit/references/repo-binding-template.md#i18n-fe-i18n) via `@fe-kit` [resolve-binding](../fe-kit/references/resolve-binding.md). **Copy UX SSOT:** [@dx-ui locale-and-content](../dx-ui/references/locale-and-content.md), [microcopy-voice](../dx-ui/references/microcopy-voice.md).

## Principles

1. **No user-visible literals** in `ui/` — keys + binding `t()` / `useTranslation` ([key-workflow](references/key-workflow.md)).
2. **Stable keys** — semantic paths, not English sentences ([key-structure](references/key-structure.md)).
3. **No concat for plurals** — ICU or library plural rules ([plurals-and-icu](references/plurals-and-icu.md)).
4. **Locale formatters** for dates/numbers — not hand-rolled per screen ([interpolation-and-formatting](references/interpolation-and-formatting.md)).
5. **Verify in CI** — binding command; all shipped locales or documented WIP policy ([key-verify](references/key-verify.md)).

## Read by task

| Situation | Read |
| --------- | ---- |
| Add / rename keys | [key-workflow](references/key-workflow.md) + [key-structure](references/key-structure.md) |
| CI / missing keys / parity | [key-verify](references/key-verify.md) |
| Plural, select, gender | [plurals-and-icu](references/plurals-and-icu.md) |
| Variables, dates, currency | [interpolation-and-formatting](references/interpolation-and-formatting.md) |
| Arabic/Hebrew, mirroring | [rtl-and-layout](references/rtl-and-layout.md) |
| Namespace files, lazy load | [namespaces-and-loading](references/namespaces-and-loading.md) |
| Bootstrap, language switch | [provider-and-runtime](references/provider-and-runtime.md) |
| API codes vs display labels | [server-and-api-labels](references/server-and-api-labels.md) |
| Tests, RTL spot-check | [testing-i18n](references/testing-i18n.md) |
| Smells | [anti-patterns](references/anti-patterns.md) |

## Workflow

```
dx-ui copy rules → new key per key-structure → all shipped locales (or WIP policy) →
binding verify command → RTL spot-check on dense UI if new layout
```

| Step | Action |
| ---- | ------ |
| 0 | Binding: library, glob, default locale, verify script, RTL list |
| 1 | Reuse `common.*` / module keys before inventing synonyms |
| 2 | Add ICU plural when count appears in message |
| 3 | Run verify locally + [verify-matrix](../fe-kit/references/verify-matrix.md) |
| 4 | Manual pass: one non-default locale on new table/form |

## Cross-skill

| Topic | Skill |
| ----- | ----- |
| Key path segments vs code names | `@fe-naming` [i18n-keys](../fe-naming/references/i18n-keys.md) (summary) |
| Form labels / errors | `@fe-forms` [i18n-and-accessibility](../fe-forms/references/i18n-and-accessibility.md) |
| Layout expansion | `@dx-ui` [locale-and-content](../dx-ui/references/locale-and-content.md) |
| String in tests | `@fe-testing` — real messages or binding test locale |

## Out of scope

Translation vendor workflow (Phrase, Lokalise), professional translation process, backend i18n, SEO hreflang marketing sites. TMS tokens live in env per security policy.

## External SSOT

| Topic | Link |
| ----- | ---- |
| react-i18next | https://react.i18next.com/ |
| ICU with i18next | https://www.i18next.com/how-to/using-icu-or-mf2 |
| ICU plurals | https://unicode-org.github.io/icu/userguide/format_parse/messages/ |