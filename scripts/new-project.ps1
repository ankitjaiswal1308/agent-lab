[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $Name,

    [Parameter(Mandatory = $true)]
    [string] $Path,

    [string] $Template = (Join-Path $PSScriptRoot "..\templates\app-repo")
)

$ErrorActionPreference = "Stop"

if (Test-Path -LiteralPath $Path) {
    throw "Target path already exists: $Path"
}

$templatePath = (Resolve-Path -LiteralPath $Template).Path
New-Item -ItemType Directory -Force -Path $Path | Out-Null
Get-ChildItem -LiteralPath $templatePath | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination $Path -Recurse -Force
}

Write-Host "Created project meta scaffold '$Name' at $Path" -ForegroundColor Cyan
Write-Host "Register it in projects/registry.yaml if it is an external app repo."
