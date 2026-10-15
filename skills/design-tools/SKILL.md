---
name: design-tools-routing
description: Route design work across Claude Design, Open Design, Codex, Claude Code, Cursor, and Ollama.
---

# Design Tools Routing

Use this when a task mentions Claude Design, Open Design, UI concepts, or design generation.

## Procedure

1. Use Claude Design or Open Design for design exploration and artifact generation.
2. Use Ollama's OpenAI-compatible endpoint for local Open Design workflows when local execution is required.
3. Use Codex to integrate reviewed design output into source files.
4. Use Claude Code to review design direction, risk, and handoff quality.
5. Use Cursor for owner-in-the-loop visual polish.

## Boundaries

- Generated design output is not canonical until reviewed and integrated.
- Do not store BYOK credentials or env files.
- Do not commit generated HTML unless explicitly approved.
