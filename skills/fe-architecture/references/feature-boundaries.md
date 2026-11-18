# Feature boundaries

## Merge features

Only when slices always ship together and suffer chronic cross-imports. Not to reduce folder count.

## Integration

Prefer query invalidation + module `data/` helpers over ad hoc global events. Compose navigation at module shell.

## Optional patterns

- **Facade:** narrow `index.ts` when many consumers need stable surface.
- **Shared lib:** when ≥2 modules need same client/UI.

## Related

- [public-api.md](public-api.md)
- [module-shell-ui-segmentation.md](module-shell-ui-segmentation.md)
