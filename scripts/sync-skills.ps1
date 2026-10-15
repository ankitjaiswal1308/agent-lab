[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string] $Source = (Join-Path $PSScriptRoot "..\skills"),
    [string] $Destination
)

$ErrorActionPreference = "Stop"

if (-not $Destination) {
    throw "Pass -Destination explicitly after choosing the target global skill directory."
}

$sourcePath = (Resolve-Path -LiteralPath $Source).Path
New-Item -ItemType Directory -Force -Path $Destination | Out-Null

if ($PSCmdlet.ShouldProcess($Destination, "Sync skills from $sourcePath")) {
    Get-ChildItem -LiteralPath $sourcePath | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $Destination -Recurse -Force
    }
}
