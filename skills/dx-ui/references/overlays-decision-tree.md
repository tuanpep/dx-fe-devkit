# Overlays — decision tree

Choose surface **before** wireframing.

```text
Is the user working on a PRIMARY entity for >30s or multiple fields?
├─ YES → Route (P2 or P3)
└─ NO → Continue
    │
    Does the user need to finish this before returning to prior task?
    ├─ YES → Modal (blocking)
    └─ NO → Continue
        │
        Is content large (filters, composer, multi-step) but secondary?
        ├─ YES → Drawer / side panel
        └─ NO → Popover / dropdown / small dialog
```

## Surface reference

| Surface | Blocks background | Typical content |
| ------- | ----------------- | --------------- |
| Dropdown | No | Action list, pick one |
| Popover | No | Short help, micro-form |
| Dialog | Yes | Confirm, short form |
| Drawer | Partial | Filters, email, import preview |
| Panel (layout) | No | Comments, exchange rail beside main |
| Toast / flag | No | Save outcome background |

## Stack discipline

- One modal at a time unless DS documents stacking.
- Do not open modal from modal without escape path.
- Return focus on close (WCAG / ARIA focus management).

## Enterprise examples

| Flow | Choice |
| ---- | ------ |
| Record detail | **Route** |
| Advanced filters | **Drawer/dialog** |
| Deactivate catalog row | **Confirm dialog** |
| Compose message from list | **Dialog** |
| Long-running thread | **Panel/rail** on detail |

## Anti-patterns

| Bad | Why |
| --- | --- |
| Full record UI in modal | Breaks queue loop, accessibility |
| Route for “Are you sure?” | Wastes history stack |
| Panel for legally blocking consent | User may miss—use modal |

Record product-specific overlay matrix in project binding when a module has many surfaces.
