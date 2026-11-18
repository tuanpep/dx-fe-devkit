# Motion and transitions

## Purpose in enterprise UI

Motion **orients** (where did content go) and **confirms** (action registered)—not decorates.

## Durations (rules of thumb)

| Type | Duration |
| ---- | -------- |
| Micro (hover, toggle) | ~100–150ms |
| Panel/dialog enter | ~200–300ms |
| Page transition | Minimal or instant for admin—users prefer speed |

## When to animate

| Animate | Skip |
| ------- | ---- |
| Overlay enter/exit | List row repaint on every keystroke filter |
| Expand/collapse section | Parallax, bouncing CTAs |
| Progress indicators | Decorative background loops |

## Reduced motion

If OS `prefers-reduced-motion: reduce`:

- Replace slide with fade or instant.
- Keep progress bars functional.

## Loading motion

- Skeleton shimmer acceptable; do not block pointer indefinitely.
- Determinate progress for known-length jobs (import).

## Ant patterns (reference)

“Use transition”, “React immediately”—feedback should feel prompt; avoid slow easing on error states.

## Anti-patterns

- Modal bounce
- Delayed save button enable with animation only for style
- Auto-playing motion on dashboards (often out of scope anyway)
