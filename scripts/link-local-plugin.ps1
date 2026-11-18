#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$localPlugins = Join-Path $env:USERPROFILE ".cursor\plugins\local"
$linkName = Join-Path $localPlugins "dx-fe-devkit"

New-Item -ItemType Directory -Force -Path $localPlugins | Out-Null

if (Test-Path $linkName) {
  $item = Get-Item $linkName
  if ($item.LinkType -eq "Junction" -or $item.LinkType -eq "SymbolicLink") {
    Remove-Item -Force $linkName
  } else {
    Write-Error "Path exists and is not a junction: $linkName"
  }
}

New-Item -ItemType Junction -Path $linkName -Target $repoRoot | Out-Null
Write-Host "Linked: $linkName -> $repoRoot"
Write-Host "Enable plugin 'dx-fe-devkit' in Cursor Customize -> Plugins."