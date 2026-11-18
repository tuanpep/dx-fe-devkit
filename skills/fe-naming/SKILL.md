---
name: fe-naming
description: >-
  Applies widely adopted naming standards for identifiers, files, and folders in
  TypeScript/React/Nx (and similar) repos via project binding. Synthesizes Clean
  Code meaningful-name rules with Google TS, PEP 8, and Airbnb React guidance.
  Use when naming or renaming variables, functions, classes, types, tests, API
  fields, modules, or paths; reviewing unclear names; or when no local linter
  rule applies. Read references/project-binding.md for this repo first.
---

# Code naming conventions

Portable skill. **Repo paths and test/file patterns:** [references/project-binding.md](references/project-binding.md) → repo file or [project-binding-schema](references/project-binding-schema.md). Slice layout: [fe-architecture](../fe-architecture/SKILL.md). Hub: `@fe-kit`.

## Priority order

1. **This repo** — [project-binding](references/project-binding.md), module `AGENTS.md`, ESLint config, neighboring files in the same feature.
2. **Language / ecosystem** — [reference.md](reference.md).
3. **Universal semantics** — rules below.

When repo style conflicts with an external guide, follow the repo.

## Universal rules (Clean Code + style guides)

| Rule | Do | Avoid |
|------|----|--------|
| Reveal intent | `daysUntilExpiration`, `fetchUserById` | `d`, `data2`, `temp` |
| Meaningful distinction | `sourceMessage`, `destinationMessage` | `message1`, `message2` |
| Pronounceable | `generationTimestamp` | `genymdhms` |
| Searchable | `MAX_RETRIES`, `userId` | bare `5`, single-letter except tiny scopes |
| No type encoding | `name` (type is in the signature) | `strName`, `m_count`, `opt_timeout` |
| One word per concept | Always `fetch` (or always `get`) | mixing `fetch`, `retrieve`, `get` |
| Class / type = noun | `TodoItem`, `PaymentGateway` | vague `Manager`, `Data`, `Info` |
| Function / method = verb | `calculateTotal`, `save`, `isValid` | `total()`, `validation()` |
| Scope ↔ length | Short names in ≤10-line local scope only | cryptic public API names |
| Constants | Named literals at module scope | magic numbers/strings inline |
| Acronyms | `loadDnsRecord`, `HttpServer` | mixed `HTTPRequest` vs `HttpRequest` in one codebase |

**Boolean / React:** `isActive`, `hasPermission`, `canEdit`; handlers/props `onChange`, `onSubmit`. **Tests:** behavior in the name — `rejectsExpiredContract`; colocate as `*.spec.ts(x)` per [project-binding](references/project-binding.md).

## TypeScript / React (primary in this repo)

| Identifier | Casing | Example |
|------------|--------|---------|
| Class, interface, type, enum | PascalCase | `UserConfig`, `RequestStatus` |
| Function, method, variable, parameter | camelCase | `loadUsers`, `customerId` |
| Module constant | SCREAMING_SNAKE | `MAX_PAGE_SIZE` |
| React component | PascalCase | `OrderRecordsPage` |
| React hook | camelCase, `use` prefix | `useTodoList` |
| JSX instance variable | camelCase | `const reservation = <ReservationCard />` |

Sources: [Google TypeScript Guide](https://google.github.io/styleguide/tsguide.html), [Airbnb React](https://github.com/airbnb/javascript/blob/master/react/README.md).

Other languages (Java, Python, Go) when touching scripts or non-TS packages: [reference.md](reference.md).

## Files and directories

**Consistency in the parent folder beats global debates.**

| Context | Pattern in sample-admin |
|---------|--------------------------|
| Product module | `apps/admin/src/modules/<product>/` kebab-case product id |
| Feature slice | `features/<kebab-slice>/{api,data,domain,ui}` |
| Module UI packages | `ui/<role>/<kebab>/` — see [fe-architecture](../fe-architecture/SKILL.md) |
| API field names | Match shared UI/types packages and generated clients — do not invent parallel names |

## Agent workflow

### New symbol

1. Read 3–5 neighbors in the same file or feature.
2. Match casing, test suffix, and verb vocabulary (`get` vs `fetch`).
3. Prefer domain terms from types/docs on public surfaces.
4. Distinguish collections explicitly: `userIds` vs `usersById`.

### Review / rename

1. Flag magic numbers and opaque abbrevs.
2. Flag mixed layer metaphors (`Controller` vs `Manager` vs `Service`).
3. Keep renames mechanical; do not rename across repos in one change unless asked.

### Checklist

```
- [ ] Intent clear without comment?
- [ ] Matches project-binding + neighbors?
- [ ] Boolean / on* handlers correct?
- [ ] File name matches primary export here?
- [ ] spec file naming matches sibling tests?
```

## Review output

```markdown
## Summary
[One sentence: consistency with repo + standards]

## Critical
- `symbol` — [issue] → `betterName`

## Suggestions
- ...

## Conventions applied
[project-binding OR external guide]
```

## Additional resources

- [references/project-binding.md](references/project-binding.md) — repo naming SSOT
- [reference.md](reference.md) — external sources, Java/Python/Go, debates
- [examples.md](examples.md) — before/after