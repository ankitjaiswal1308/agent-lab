[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $Prompt
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command cursor-agent -ErrorAction SilentlyContinue)) {
    throw "cursor-agent was not found on PATH. Install Cursor CLI and run: cursor-agent login"
}

cursor-agent $Prompt

