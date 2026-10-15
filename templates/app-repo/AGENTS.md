# AGENTS.md

This app repo uses `D:\projects\agent-lab` as the meta-infrastructure source of truth.

## Boundaries

- Keep app source code in this repo.
- Do not commit secrets, env files, model weights, generated HTML, or backups.
- Do not create remotes, commit, merge, or deploy without owner approval.

## Agent Lanes

- Claude Code: orchestration, review, risk/judgment, merges.
- Codex: scoped implementation from written work orders.
- Cursor: live pair editing and IDE-bound UI polish.
- Claude Design / Open Design: design drafts and prototypes, reviewed before repo integration.
- OpenClaw / OpenCode: local agent harness experiments and provider routing.
- Local Ollama: local/offline tool-calling loops using `agent-lab` local model routing.

## Handoff

Use `docs/HANDOFF.md` for cross-agent status, blockers, and next actions.
