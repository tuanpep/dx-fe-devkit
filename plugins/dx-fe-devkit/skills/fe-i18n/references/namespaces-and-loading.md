# Namespaces & loading

## Namespace scope

| Pattern | Use |
| ------- | --- |
| One JSON/file per product module | `catalog.json`, `billing.json` |
| Feature sub-nests inside file | JSON structure — not 200 tiny files unless binding says so |
| `common` | Shared actions, errors |

Map namespace to lazy route or module entry when binding supports **lazy load**:

```typescript
// illustrative
useTranslation('catalog', { useSuspense: true });
```

Load namespace when module route activates — avoid bundling all locales × all namespaces on first paint unless app is small.

## Locale files

```text
locales/
  en/
    catalog.json
  vi/
    catalog.json
```

Glob from binding. Partial locale folders OK when fallback to default is configured.

## Typed keys (optional)

Binding may generate `as const` key unions or use i18next TypeScript plugin — prefer typed `t` in new code.

## Performance

- Do not import all JSON in `main.tsx` for 20 modules.
- Split by module + lazy `import()` per binding bundler pattern.