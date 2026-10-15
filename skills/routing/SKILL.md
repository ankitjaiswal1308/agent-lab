---
name: agent-lab-routing
description: Route work across Codex, Claude Code, Cursor, design tools, local agent harnesses, and local Ollama models.
---

# Agent Lab Routing

Use this when deciding which agent, design tool, harness, or model should handle a task.

## Procedure

1. Classify the task as orchestration, scoped execution, live pair editing, design generation, local harness work, or raw local model work.
2. Route orchestration and review to Claude Code.
3. Route scoped implementation to Codex.
4. Route IDE-bound edits and polish to Cursor after `cursor-agent login`.
5. Route design drafts and visual exploration to Claude Design or Open Design, then review before integrating.
6. Route local harness work to OpenClaw or OpenCode when the task is about agent behavior rather than one model call.
7. Route local tool-calling loops to `gpt-oss:20b` unless the task needs `qwen3.6` vision or hard reasoning.
8. Never route agent loops to models listed in `configs/local-model-routing.yaml#do_not_use_as_agent_drivers`.
