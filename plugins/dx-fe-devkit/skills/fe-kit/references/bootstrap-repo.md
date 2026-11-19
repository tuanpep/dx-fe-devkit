# Bootstrap a consumer repo

1. Install **dx-fe-devkit** plugin (or team marketplace).
2. Root `AGENTS.md` — commands, git policy (**`@fe-git-workflow`** + binding), **`@fe-kit`** pointer.
3. Copy [repo-binding-template.md](repo-binding-template.md) → `.cursor/skills/project-binding.md` **or** into the three split paths (`fe-architecture`, `fe-naming`, `dx-ui`).
4. Optional: `.cursor/rules/<product>.mdc` for stack overrides.
5. Optional: `mcp.json` Mantine — see `fe-mantine` skill.

**Do not** vendor the whole `dx-ui/references/` tree into git.