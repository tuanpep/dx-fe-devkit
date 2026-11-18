# DX FE DevKit

Cursor **team marketplace** repo for the **dx-fe-devkit** plugin — enterprise React agent kit (architecture, admin UX, tests, i18n, security, performance, forms, Mantine MCP).

**Hub:** `@fe-kit` · [kit catalog](plugins/dx-fe-devkit/skills/fe-kit/references/kit-catalog.md)

## Layout

```text
.cursor-plugin/marketplace.json
plugins/dx-fe-devkit/
├── .cursor-plugin/plugin.json
├── skills/ · rules/ · commands/ · mcp.json
```

Official refs: [Plugins](https://cursor.com/docs/plugins), [Plugins reference](https://cursor.com/docs/reference/plugins).

## Install from Git

Dashboard **Plugins & MCPs → Team Marketplaces → Import from Repo** (or install from marketplace). Cursor resolves `source: dx-fe-devkit` with `pluginRoot: plugins` to `plugins/dx-fe-devkit/.cursor-plugin/plugin.json`.

After import, **Refresh** the marketplace if needed, then install **dx-fe-devkit** in **Customize → Plugins**.

## Local (dev / verify)

```powershell
.\scripts\link-local-plugin.ps1
```

Then **Developer: Reload Window** → enable **dx-fe-devkit** in **Customize → Plugins**.

MIT — [LICENSE](LICENSE)