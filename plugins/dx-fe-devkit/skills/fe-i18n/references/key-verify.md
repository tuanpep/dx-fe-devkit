# Key verify (CI)

Commands come from binding only — never invent scripts.

## Typical gates

| Check | Purpose |
| ----- | ------- |
| **Key parity** | Every key in source locale exists in shipped locales |
| **No orphan keys** | Secondary locales match source key set (optional prune policy) |
| **Placeholder parity** | Same `{name}` / `{{name}}` tokens per ICU mode |
| **Forbidden literals** | ESLint/custom rule: no JSX text outside `t()` in `ui/` |
| **ICU parse** | Invalid plural/select syntax fails build |

## Policies (binding)

| Policy | When |
| ------ | ---- |
| **All locales ship together** | Enterprise apps with fixed locale set |
| **WIP locale allowed** | Document locale code; verify excludes until ready |
| **Fallback chain** | `en` → module default; missing key shows key or English |

Do not copy English into `vi-VN` (or other) as **permanent** placeholder without translation ticket.

## Local dev

```text
# pattern only — use binding verify command
yarn i18n:verify
nx run admin:i18n-verify
```

Run before PR when touching locale JSON or `ui/` copy.

## Failure triage

| Error | Fix |
| ----- | --- |
| Missing key in `de` | Add translation or exclude locale per policy |
| Extra key in `fr` | Remove or add to `en` if intentional |
| Placeholder mismatch | Align `{userName}` spelling across files |
| ICU parse error | Fix plural branches — [plurals-and-icu](plurals-and-icu.md) |

## verify-matrix

[i18n keys change → binding verify](../../fe-kit/references/verify-matrix.md).