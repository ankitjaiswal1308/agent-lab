[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $Prompt,

    [string] $ReasoningEffort = "medium"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
    throw "codex CLI was not found on PATH."
}

codex exec -c "model_reasoning_effort=$ReasoningEffort" $Prompt

