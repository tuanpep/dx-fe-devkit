# Testing URL state

## Unit (preferred ROI)

Test `parse*` / `serialize*` in `domain/`:

- Omitted params → defaults
- Invalid enum → throw or safe fallback (per product)
- Coercion (`page=2`, `showArchived=true`)
- Unknown keys stripped

No router required.

## Integration (RTL)

| Case | Assert |
| ---- | ------ |
| Load with `?page=2` | Table requests page 2 (MSW) |
| Change filter | Location/search updates (memory router or binding test wrapper) |
| Clear filters | URL returns to default |
| replace behavior | Optional: mock history length for debounced search |

Use binding `render` helper with router `initialEntries: ['/orders?page=1']`.

## E2E (scoped)

- Open copy-pasted URL → same visible rows/filters
- Back after filter change restores prior view when using `push` for explicit actions only

## MSW

Match list handler on query params derived from **validated** search, not raw strings, so tests match production API contract.