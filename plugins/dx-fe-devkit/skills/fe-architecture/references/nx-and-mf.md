# Nx workspace & Module Federation

Commands and MF surface come from **repo binding** (see [fe-kit repo-binding-template](../../fe-kit/references/repo-binding-template.md)).

## Typical Nx commands

```bash
nx run <project>:lint
nx run <project>:test --runInBand
nx run <project>:build --configuration=<cfg>
nx affected -t lint,test
```

## Module Federation

- Minimal remote expose (often single `./Module` entry).
- Route-level lazy loading **inside** the remote — not one MF expose per feature unless deploy requires.
- Align shared dependency versions in root `package.json`.

Details: [code-splitting](code-splitting.md), binding schema [project-binding-schema](project-binding-schema.md).