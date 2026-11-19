# Anti-patterns

| Avoid | Prefer |
| ----- | ------ |
| `"Save"` literal in JSX | `t('common.actions.save')` |
| `` `${count} items` `` | Plural rule — [plurals-and-icu](plurals-and-icu.md) |
| English key `Click here to save` | Semantic key path |
| Duplicate keys for save/submit | One module convention |
| `new Date().toLocaleDateString()` per file | Shared formatter |
| `margin-left` for RTL product | Logical properties |
| Copy EN → vi as final text | Verify + translation |
| API English description as only label | Code → key map |
| HTML in JSON without pipeline | `Trans` + sanitizer policy |
| Load all 40 locale files in main | Lazy namespaces |

## Legacy migration

When touching a file: extract literals incrementally; binding may track inventory script. Do not big-bang whole module without plan.

## Security

Translation files are code — review for script injection in CI if binding enables payload scan ([key-verify](key-verify.md) advanced policies).