# Anti-patterns

| Smell | Fix |
| ----- | --- |
| `data`, `info`, `item`, `object` | Domain noun |
| `Manager`, `Helper`, `Util` classes | Functions in `domain/` or named service file |
| `process`, `handle`, `do` without object | `submitOrder`, `mapDtoToForm` |
| `tmp`, `foo`, `bar` in committed code | Remove or name |
| `IUser`, `UserInterface` | `User` |
| `userID` vs `userId` mixed | `userId` camelCase |
| `OrderRecordsComponent.tsx` | `OrderRecordsPage.tsx` or `OrderRecordsTable.tsx` |
| Feature-root `constants.ts` dumping ground | Split by layer or domain entity |
| `useGetOrders` | `useOrderListQuery` |
| `handleClick` prop on component | `onClick` |
| `styled-components` file `styles.ts` hiding 500 lines of logic | Split logic to hooks |
| Test `it('renders')` only | Assert behavior |
| Parallel JSON field names vs API | Use generated types |
| `queryKeys.orders` string typo vs `orderKeys` | Single factory export |

## Layer metaphor mixing

In one feature do not mix:

- `*Service`, `*Controller`, `*Repository` **and** `api/` / `data/` slices — pick architecture vocabulary from [fe-architecture](../../fe-architecture/SKILL.md).

## Hungarian / encoding

No `strName`, `arrItems`, `boolActive` — see Google TS guide ([reference.md](../reference.md)).