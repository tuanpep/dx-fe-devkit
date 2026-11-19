# Plurals & ICU

Align with binding plugin: default **i18next JSON suffixes** *or* **i18next-icu** — never both patterns on same key.

## i18next suffix style (common)

```json
"items": "{{count}} items",
"items_one": "{{count}} item",
"items_other": "{{count}} items"
```

```typescript
t('items', { count: n });
```

Ship all plural forms required by `Intl.PluralRules` for each locale (e.g. `few`, `many` for Russian).

## ICU plugin style

When binding uses `i18next-icu`:

```json
"items": "{count, plural, =0 {No items} one {# item} other {# items}}"
```

- Use `{name}` not `{{name}}` — see [i18next ICU docs](https://www.i18next.com/how-to/using-icu-or-mf2).
- Suffix keys (`key_one`) **do not** apply.

## Never

```typescript
// bad
t('items') + ` (${count})`;
count === 1 ? t('item') : t('items');
```

## Select / gender (when product requires)

```icu
{role, select, admin {Administrator} other {User}} access
```

Use sparingly in admin UIs — prefer neutral copy when possible ([microcopy-voice](../../dx-ui/references/microcopy-voice.md)).

## Ordinal

Use library support (`_ordinal_one` in i18next or ICU `offset`) — binding documents pattern.

## verify

Placeholder and plural branch parity across locales — [key-verify](key-verify.md).