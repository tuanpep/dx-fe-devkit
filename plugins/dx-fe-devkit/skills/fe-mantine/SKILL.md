---
name: fe-mantine
description: >-
  Look up Mantine APIs using official LLM docs and the Mantine MCP server. Use
  for @mantine/* props, Styles API, dates, and testing. Pin versions from the
  active repo package.json; follow repo dx-ui project-binding for forms, tables,
  and theme overrides over generic Mantine examples.
---

# Mantine docs (portable)

## Version

Read **`@mantine/*` versions from the active repo** `package.json` (keep packages aligned).

Official MCP/index may describe newer majors — verify against the repo’s installed major before copying snippets.

**Product overrides:** repo `dx-ui/references/project-binding.md` or module `AGENTS.md` (see kit example `dx-ui/references/examples/project-binding-compliance-mantine.md`).

## MCP (`@mantine/mcp-server`)

Add to repo or user `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "mantine": {
      "command": "npx",
      "args": ["-y", "@mantine/mcp-server"]
    }
  }
}
```

| Tool | Use when |
| ---- | -------- |
| `search_docs` | Topic known, page unknown |
| `get_item_props` | Component or hook signature |
| `get_item_doc` | One section or full page |
| `list_items` | Browse by package |
| `get_api` | Resolve hooks/utilities |

## Static LLM docs

- https://mantine.dev/llms.txt
- https://mantine.dev/llms-full.txt

**Cursor `@Docs`:** add `https://mantine.dev/llms.txt` once per workspace.

## Optional upstream skills

```bash
npx skills add https://github.com/mantinedev/skills --skill mantine-form
```

Do not override repo binding (e.g. React Hook Form + controlled fields) without an explicit product decision.

## Prompt pattern

```text
Mantine <version from package.json>. Follow repo dx-ui project-binding.
<task>. Use Mantine MCP as needed.
```