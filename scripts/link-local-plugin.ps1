#Requires -Version 5.1
<#
.SYNOPSIS
  Install dx-fe-devkit into ~/.cursor/plugins/local for local testing.

.NOTES
  Official Cursor docs (Test plugins locally): put a real directory under
  ~/.cursor/plugins/local/<name>. Symlinks/junctions are loaded only when the
  target resolves inside that folder — links to a repo elsewhere are skipped.
  So this script mirrors (copies) the plugin tree, it does not junction out.
#>
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$localPlugins = Join-Path $env:USERPROFILE ".cursor\plugins\local"
$dest = Join-Path $localPlugins "dx-fe-devkit"

$manifest = Join-Path $repoRoot ".cursor-plugin\plugin.json"
if (-not (Test-Path $manifest)) {
  Write-Error "Missing Cursor Plugin manifest: $manifest"
}

New-Item -ItemType Directory -Force -Path $localPlugins | Out-Null

if (Test-Path $dest) {
  $item = Get-Item $dest -Force
  if ($item.LinkType -eq "Junction" -or $item.LinkType -eq "SymbolicLink") {
    Remove-Item -Force $dest
  } else {
    Remove-Item -Recurse -Force $dest
  }
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null

# Mirror plugin payload only (skip git / agent tooling noise).
$include = @(
  ".cursor-plugin",
  "skills",
  "rules",
  "commands",
  "mcp.json",
  "plugin.json",
  "README.md",
  "LICENSE",
  "CHANGELOG.md",
  "AGENTS.md",
  "templates"
)

foreach ($name in $include) {
  $src = Join-Path $repoRoot $name
  if (-not (Test-Path $src)) { continue }
  $target = Join-Path $dest $name
  if ((Get-Item $src).PSIsContainer) {
    New-Item -ItemType Directory -Force -Path $target | Out-Null
    Copy-Item -Path (Join-Path $src "*") -Destination $target -Recurse -Force
  } else {
    Copy-Item -Path $src -Destination $target -Force
  }
}

Write-Host "Installed (copy): ~/.cursor/plugins/local/dx-fe-devkit"
Write-Host "Next: Developer: Reload Window, then enable 'dx-fe-devkit' in Customize -> Plugins."
Write-Host "Re-run this script after editing the repo; local is a snapshot, not a live link."
