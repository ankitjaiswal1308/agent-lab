# agent-lab

Unified meta-infrastructure repo for local and subscription-based agent workflows.

This repository is the source of truth for:

- Codex / Codex CLI, Claude / Claude Code, Cursor / Cursor CLI routing
- Claude Design, Open Design, OpenCode, OpenClaw, and Ollama handoff notes
- Shared agent skills and repo templates
- Local LLM and Ollama model routing
- Imported local-agent setup material from `D:\projects\local-agents`
- Project registry entries for external app repos such as `E:\staap`

## Boundaries

- This repo stores infrastructure, templates, docs, configs, and routing policy.
- App source code stays in its own app repository.
- No API keys, env files, model weights, or generated model artifacts belong here.
- `D:\projects\local-agents` remains untouched until this import is verified.
- Hermes and Obsidian are documented only; they are not installed or configured here yet.
- Design-tool output is not canonical until reviewed and integrated through an app repo.

## Key Files

- `ROUTING.md` defines human, CLI, design-tool, and local-agent routing policy.
- `configs/agent-tooling.yaml` inventories supported agent/design/local tools.
- `configs/local-model-routing.yaml` defines local model roles and exclusions.
- `docs/design-tools.md` covers Claude Design and Open Design routing.
- `projects/registry.yaml` tracks external repositories without moving their code.
- `scripts/` contains thin CLI wrappers and sync placeholders.
- `skills/` stores shared skill source material.
- `templates/app-repo/` contains a starter meta layer for future app repos.
- `local-agents/` contains imported useful material from the old local-agent workspace.

## First Manual Steps

1. Run `cursor-agent login` if Cursor CLI is installed and should participate in routing.
2. Optionally run a future global skill sync from this repo once the skill layout is finalized.
3. Keep app repos registered in `projects/registry.yaml`; do not move their code here.
