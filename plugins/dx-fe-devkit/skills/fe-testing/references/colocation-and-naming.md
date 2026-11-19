# Colocation & naming

File patterns: binding + `@fe-naming` [project-binding](../../fe-naming/references/project-binding.md).

## Placement

| Source | Spec |
| ------ | ---- |
| `ui/OrderListPage.tsx` | `ui/OrderListPage.spec.tsx` (same folder) |
| `ui/components/OrderStatusBadge.tsx` | colocated `*.spec.tsx` |
| `domain/orderTransitions.ts` | `domain/orderTransitions.spec.ts` |
| `data/queries.ts` | Prefer page spec; `queries.spec.ts` only for complex hook without UI |
| `api/client.ts` | Rare — cover via MSW integration |

Do not centralize all specs under `__tests__/` unless binding legacy requires it.

## Names

Behavior-focused — `@fe-naming`:

| Good | Weak |
| ---- | ---- |
| `rejects submit when name is empty` | `form test 1` |
| `shows forbidden message when API returns 403` | `handles error` |
| `filters orders by active status` | `OrderListPage works` |

## What to cover in new UI PR

Per [verify-matrix](../../fe-kit/references/verify-matrix.md): **UI component** → lint + colocated spec **if binding requires**.

Minimum integration:

- Happy path
- One error path (empty, 403, or validation)

## Snapshot policy

- Avoid large snapshots.
- Small snapshots ok for stable i18n or error message maps when binding allows.

## MSW handler tests

Handler colocated with `api/` — optional `handlers.spec.ts` for contract asserts; still add UI integration for user impact.