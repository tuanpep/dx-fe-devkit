# Authorization (UI layer)

Security property: **API denies unauthorized work**. UI reduces mistakes and support noise.

Full UX rules: [@dx-ui permissions-ux](../../dx-ui/references/permissions-ux.md).

## Rules

| Rule | Rationale |
| ---- | --------- |
| Route guards mirror menu visibility | Direct URL still hits API |
| Hide vs disable per module policy | Document in product spec |
| Do not fire mutation when UI shows disabled Submit | [permissions-ux](../../dx-ui/references/permissions-ux.md) anti-pattern |
| 403 from API shows actionable copy | Server message authoritative |

## Data from API

- Permission claims from `/me` or equivalent — not from editable localStorage.
- Optimistic UI still handles 403 rollback.
- “Admin” boolean in JWT visible to user is fine for UX; server re-checks on each write.

## fe-architecture placement

- Guards in module `routing/` — thin checks calling shared hook from `data/` or shell.
- No authorization matrix duplicated in every feature — promote to module `shared` when repeated.

## Security review prompts

- New bulk action: can user select rows they cannot act on?
- Export: does endpoint filter by same IAM as list?
- Field-level read: masking only on client, or server omits field?