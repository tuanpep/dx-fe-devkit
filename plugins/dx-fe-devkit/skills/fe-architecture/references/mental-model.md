# Mental model

Architecture for **modular React** codebases (Nx, Vite, CRA, Module Federation). Map folder names via repo `AGENTS.md`.

## Goals (ordered)

1. **Correctness** — UI reflects server truth; client rules match API contracts.
2. **Change isolation** — One capability changes without rewiring unrelated screens.
3. **Navigability** — Predictable layers; no horizontal tech dumps for new code.
4. **Load performance** — Route-level splitting aligned with URLs ([code-splitting.md](code-splitting.md)).
5. **Gradual migration** — Legacy keeps working; new work does not extend flat patterns.

## Non-goals

- Full DDD tactical patterns unless product requires them.
- Global FSD `entities/` for the whole app — promote via shared libs when needed.
- Per-feature remote/MF exposes unless deploy boundaries require them.

## Overrides

Module or app `AGENTS.md` wins for that scope. This skill wins for **folder structure and imports** unless a module contract says otherwise.

## Scopes

```text
Host / shell (optional)
  └── App (deployable or MF remote)
        ├── Module (product boundary)
        │     └── Feature (capability)
        │           └── Layer: api | data | domain | ui
        └── Legacy area (views/pages) — extract layers when touched
```

| Idea | Typical folder |
| ---- | ---------------- |
| Bounded context | `modules/<product>/` or product package |
| Vertical slice | `features/<slice>/` |
| Composition root | App route table, module `routing/` |
| Public API | Feature `index.ts` (cross-slice only) |

Uses **`data/`** + **`api/`** (not separate `application/` / `infrastructure/` names).

## Dependency rule

```text
design-system, shared libs  →  module ui/shared/data  →  feature layers
ui       →  data, domain, module shared
data     →  api, domain
api      →  domain (types), http helpers
domain   →  same-feature domain only
```

**Forbidden:** `domain` → React / query hooks / HTTP client; `ui` → raw HTTP; feature A → feature B **private** paths; module A → module B internals; feature → app route wiring.

See [public-api.md](public-api.md), [external-standards-convergence.md](external-standards-convergence.md) §4.

## Ten rules (review)

1. Thin composition roots — app/module wire only ([layout.md](layout.md)).
2. Capability-first folder names — PO language, not `hooks/`.
3. Inward dependencies — `domain` center, `ui` edge.
4. Server truth — queries/mutations in `data/` ([server-state.md](server-state.md)).
5. Explicit public surfaces — cross-slice via `index.ts` ([public-api.md](public-api.md)).
6. Split aligned with URLs — lazy concrete pages, not barrels ([code-splitting.md](code-splitting.md)).
7. Promote on **second product-module** consumer — shared libs, not premature ([layout.md](layout.md) § libs).
8. Product `AGENTS.md` overrides in that product.
9. Refactor extract order: `api` → `data` → `domain` → `ui` ([architectural-smells.md](architectural-smells.md)).
10. No empty layer folders — add when the ticket needs them ([layer-responsibilities.md](layer-responsibilities.md)).

## Enforcement (today)

| Mechanism | Typical |
| --------- | ------- |
| ESLint import zones / Nx boundaries | Varies — tighten over time |
| This skill + `AGENTS.md` | Primary for agents |
| Review smells | [architectural-smells.md](architectural-smells.md) |
| Deep audit | [review-auditor.md](review-auditor.md) |

Conceptual FSD checks (no Steiger required): no upward layer imports; no feature-root `utils/`; cross-slice via public API only.

## Related

- [layout.md](layout.md)
- [oss-fe-matrix.md](oss-fe-matrix.md)
