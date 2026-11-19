# Naming standards — references and edge cases

Task hub: [SKILL.md](SKILL.md). Repo-specific: [references/project-binding.md](references/project-binding.md).

## Authoritative external sources

| Source | Scope | URL |
|--------|--------|-----|
| Google Style Guides (index) | Multi-language hub | https://google.github.io/styleguide/ |
| Google TypeScript | TS/TSX identifiers, no Hungarian notation | https://google.github.io/styleguide/tsguide.html |
| Google Java | Java packages, tests `*Test` | https://google.github.io/styleguide/javaguide.html |
| Google Go | Go formatting + naming | https://google.github.io/styleguide/go/ |
| PEP 8 | Python | https://peps.python.org/pep-0008/ |
| Airbnb JavaScript | Base JS style | https://github.com/airbnb/javascript |
| Airbnb React | Component filename PascalCase, hooks camelCase | https://github.com/airbnb/javascript/blob/master/react/README.md |
| Clean Code Ch. 2 | Meaningful names (language-agnostic) | Robert C. Martin, *Clean Code* |

## Casing tables (non-TS languages)

### Java

| Identifier | Casing | Example |
|------------|--------|---------|
| Class, interface, enum, record | PascalCase | `HashIntegrationTest` |
| Method, field, parameter, local | camelCase | `getConnectionIndex` |
| Constant (`static final`) | SCREAMING_SNAKE | `MAX_CONNECTIONS` |
| Test class | `*Test` suffix | `MigrationVersionTest` |

### Python

| Identifier | Casing | Example |
|------------|--------|---------|
| Class, exception | PascalCase | `ShoppingCart` |
| Function, method, variable | snake_case | `calculate_total` |
| Constant (module level) | SCREAMING_SNAKE | `MAX_OVERFLOW` |

### Go

| Identifier | Casing | Example |
|------------|--------|---------|
| Exported | PascalCase | `ServeHTTP` |
| Unexported | camelCase | `parseConfig` |

## Debates (pick one per repo)

| Topic | Option A | Option B |
|-------|----------|----------|
| React component files | `PascalCase.tsx` | `kebab-case.tsx` |
| Enum members | SCREAMING_SNAKE | PascalCase |
| Private fields | plain camelCase | `_field` |

In the active repo, resolve via [references/project-binding.md](references/project-binding.md) and folder neighbors.

## REST / JSON

- Query/body fields follow backend contract and shared generated types — not local renames.
- Path segments often kebab-case or plural nouns per API spec.

## Linters

Prefer fixing toward the repo ESLint config when skill text and linter disagree.

- TS: `@typescript-eslint/naming-convention`, `react/jsx-pascal-case`

## Database migrations

Do not rename columns in applied migrations. New tables follow the repo’s migration docs and ownership rules.