# DX FE DevKit

Cursor plugin for **enterprise React**: architecture, admin UX, tests, i18n, security, performance, forms, Mantine MCP.

**Start:** `@fe-kit` · [kit catalog](skills/fe-kit/references/kit-catalog.md)

## Skills (11)

`fe-kit` · `fe-architecture` · `dx-ui` · `dx-ui-review` · `fe-naming` · `fe-forms` · `fe-testing` · `fe-i18n` · `fe-security` · `fe-performance` · `fe-mantine`

Consumer repos: [repo-binding-template](skills/fe-kit/references/repo-binding-template.md) only — patterns ship in the plugin.

## Install

Layout: **single-plugin** at repo root (`.cursor-plugin/plugin.json` + root `plugin.json` for Agent Plugins). Official refs: [Plugins](https://cursor.com/docs/plugins), [Plugins reference](https://cursor.com/docs/reference/plugins).

### Local (dev / verify)

Cursor loads `~/.cursor/plugins/local/<name>` as a **real directory**. External junctions/symlinks are skipped.

```powershell
.\scripts\link-local-plugin.ps1
```

Then **Developer: Reload Window** → enable **dx-fe-devkit** in **Customize → Plugins**. Re-run after repo edits (local is a copy).

### Team marketplace

**Import from Repo** is reliable with multi-plugin layout:

- `.cursor-plugin/marketplace.json` (`name`, `owner`, `plugins[]` with bare `source` names)
- `plugins/<name>/.cursor-plugin/plugin.json`

This repo is still single-plugin at root (fine for local + public submit). For team Import, restructure under `plugins/dx-fe-devkit/` first — `source: "."` is rejected by current marketplace parsing.

Dashboard: **Plugins & MCPs → Team Marketplaces → Add Marketplace → Import from Repo**.

### Public marketplace

Submit at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish) after local verify.

MIT — [LICENSE](LICENSE)
