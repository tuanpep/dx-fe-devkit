# Architecture & ownership

Forms live in `features/<slice>/ui/` per [layer-responsibilities](../../fe-architecture/references/layer-responsibilities.md).

## Typical layout

| Artifact | Layer | Example |
| -------- | ----- | ------- |
| Page shell | `ui/` | `OrderCreatePage.tsx` |
| Form hook + wiring | `ui/` | `useOrderCreateForm.ts` |
| Submit payload type | `domain/` | `OrderDraft`, `toCreatePayload()` |
| Client schema | `domain/` or shared lib | `orderCreateSchema` (Zod) |
| `POST`/`PATCH` | `data/mutations.ts` | `useCreateOrderMutation` |
| DTO map | `api/` | `mapOrderToDto` |
| Field wrapper usage | `ui/` | binding `ControlledField` |

**Import direction:** `ui` → `data` | `domain` → `api` — form hook calls mutation hook; mutation uses `api/`.

## Single owner

- One `useForm` instance per screen (or one per wizard via shared `FormProvider`).
- Do not mirror field values in `useState` alongside RHF — use `watch` / `getValues` sparingly.

## Domain vs UI validation

| Kind | Owner |
| ---- | ----- |
| Format (email, required, max length) | Zod schema (often `domain/`) |
| Cross-field (password confirm) | Zod `refine` / `superRefine` |
| Legal workflow transition | `domain/actions` or guards — UI disables/hides |
| “Username taken” | Server async; `setError` or `validate` on field |

Do not encode IAM in Zod — permissions from server + [permissions-ux](../../dx-ui/references/permissions-ux.md).

## Edit flows

- Load entity via `data/queries.ts` in page.
- Pass `defaultValues` only when query **success** — skeleton until then ([create-and-edit](create-and-edit.md)).

## Module shared

Repeated field clusters (address block, date range) → module `ui/<role>/<package>/` per [fe-architecture depth](../../fe-architecture/references/depth-and-anti-flatten.md), not copy-paste per feature.