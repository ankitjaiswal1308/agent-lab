[CmdletBinding()]
param(
    [string] $ConfigPath = (Join-Path $PSScriptRoot "..\configs\local-model-routing.yaml")
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $ConfigPath)) {
    throw "Missing local model routing config: $ConfigPath"
}

Write-Host "Local model routing config:" -ForegroundColor Cyan
Get-Content -LiteralPath $ConfigPath
Write-Host ""
Write-Host "Manual sync targets are intentionally not configured yet." -ForegroundColor Yellow

