# Create & edit

## Create

| Step | Rule |
| ---- | ---- |
| `defaultValues` | Static defaults from `domain/` or constants — not `undefined` holes for controlled fields |
| Empty optional | `null` vs `undefined` per API — consistent module-wide |
| Prefill from query | e.g. duplicate flow — map query to `defaultValues` once loaded |

## Edit

| Step | Rule |
| ---- | ---- |
| Load | `useQuery` in page; show skeleton until `isSuccess` |
| Hydrate | `reset(dtoToFormValues(data))` or `values` + `key={id}` remount pattern |
| **Id change** | When route param changes, `reset` new entity — never show stale previous record |
| Concurrent edit | If binding supports version/etag, pass through mutation payload |

### Preferred: `reset` on success fetch

```typescript
const { data, isSuccess } = useOrderQuery(id);

useEffect(() => {
  if (isSuccess && data) {
    reset(mapOrderToFormValues(data));
  }
}, [isSuccess, data, id, reset]);
```

### Alternative: remount

`{isSuccess && <OrderForm key={id} defaultValues={...} />}` — valid when form is isolated child.

## Dirty state

- Track `formState.isDirty` for cancel confirm ([forms-validation-ux](../../dx-ui/references/forms-validation-ux.md)).
- After successful save: `reset(getValues())` or navigate away per product.

## Cancel

- Back link / Cancel: confirm when dirty on long forms.
- Do not call API on cancel unless “save draft” is real backend feature.

## Navigation after save

| Product | Pattern |
| ------- | ------- |
| Admin create | Detail (P2) or list — [multi-step-flows](../../dx-ui/references/multi-step-flows.md) |
| Quick add | Close drawer + invalidate list |

Mutation `onSuccess` in `data/` or page — single place documented in feature.