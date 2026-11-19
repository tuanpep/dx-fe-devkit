# Forms & mutations

UX rules: [forms-validation-ux](../../dx-ui/references/forms-validation-ux.md). Implementation: `@fe-forms`.

## Integration scenarios

| Scenario | Assert |
| -------- | ------ |
| Submit disabled when pending | `expect(save).toBeDisabled()` |
| Submit disabled when invalid | After blur/submit per validation timing |
| Server field error | Error text linked to field (`aria-describedby` / label association) |
| Server non-field error | Banner or alert role |
| Dirty cancel | Confirm dialog if product requires |
| Edit mode id change | Form resets `defaultValues` when route id changes |

## Interaction

Use `userEvent` typing and tab — not `fireEvent.change` unless testing low-level edge case.

Long admin forms: default validation **on submit** — trigger submit with invalid data, then assert errors.

## MSW

Map API 400 body to field names binding expects — same mapper production uses in `ui/` or `data/`.

## Mutations + Query

After success:

- List updates without manual reload, or
- Navigate to detail with new id, or
- Toast with success copy

Match module spec — do not assert internal `invalidateQueries` keys.

## File upload (if applicable)

Client reject over size — integration with stub file; full upload flow often E2E when presigned URLs involved ([fe-security uploads](../../fe-security/references/uploads-and-downloads.md)).