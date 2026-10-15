# Skills Sharing

`agent-lab` stores shared skill source material under `skills/`.

## Layout

- `skills/routing/` for deciding which agent or model should handle a task.
- `skills/review/` for code, plan, and work-quality review procedures.
- `skills/bootstrap/` for new repo and agent setup procedures.
- `skills/local-model-routing/` for Ollama and local model policy.

## Sync Policy

- Keep canonical skill material in this repo.
- Sync outward to global Codex, Claude Code, or Cursor locations only after reviewing the diff.
- Do not sync secrets, env files, model weights, or app code.
- Treat global sync as optional until the skill files stabilize.

The placeholder script is `scripts/sync-skills.ps1`.

