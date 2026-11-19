# Testing i18n

## Unit / integration

| Approach | When |
| -------- | ---- |
| Real `en` messages in test wrapper | Default — catches missing keys |
| Single `test` locale JSON | Binding documents minimal fixtures |
| Mock `t: (k) => k` | Only when testing non-copy logic — avoid masking missing keys |

Wrap with same i18n provider as app ([fe-testing test-utils](../../fe-testing/references/test-utils-and-providers.md)).

## Assertions

- Prefer role + **translated** accessible name when product uses i18n in labels.
- Snapshot translated strings only when stable — prefer behavior assertions.

## RTL

- Optional test: render with `dir="rtl"` and assert critical control still queryable.
- Full RTL visual: manual or VR when binding ships Arabic.

## verify in CI

[key-verify](key-verify.md) is primary test — not optional for locale JSON changes.