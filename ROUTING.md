# Agent Routing

This repo routes work across subscription CLIs, IDE tools, design tools, local agent harnesses, and local Ollama models. It does not store API keys.

## Tool Lanes

| Lane | Default Tool | Use For | Avoid For |
|---|---|---|---|
| Orchestration and review | Claude Code / `claude` CLI | Plans, reviews, merge judgment, risk calls, handoffs | Blind mechanical edits without a written spec |
| Spec execution | Codex / Codex CLI | Implementing scoped work orders, repo setup, tests, docs, deterministic checks | Business/risk decisions and merges without approval |
| Live pair editing | Cursor / Cursor CLI | Interactive IDE edits, UI polish, owner-in-the-loop work | Headless automation unless `cursor-agent` is installed and logged in |
| Design generation | Claude Design / Open Design | Design drafts, visual exploration, UI concepts, local design output | Canonical repo state, secrets, deployment, or unreviewed app-code mutation |
| Local agent harness | OpenClaw / OpenCode | Local agent experiments, channels, model-provider harness testing | Unsupported tool-calling models or unattended live actions |
| Local model runtime | Ollama OpenAI-compatible API | Offline/local tool-calling agents, scratch work, embeddings | Cloud-only tasks, secret-dependent work, unsupported tool-calling models |

## Routing Rule

Use the most specific lane that owns the work product:

- Product judgment, review, and merge calls go to Claude Code.
- Scoped implementation and verification go to Codex.
- Live IDE edits and owner-visible polish go to Cursor.
- Design artifacts start in Claude Design or Open Design, then return to Codex or Claude Code for repo integration.
- Local agent loops use OpenClaw/OpenCode over Ollama when a harness is needed.
- Raw local model selection follows `configs/local-model-routing.yaml`.

## Codex

Use Codex for scoped implementation and verification. Do not commit unless the owner approves. Do not create remotes from this repo.

Example:

```powershell
.\scripts\ask-codex.ps1 "Inspect this repo and propose the next setup step."
```

## Claude Code

Use Claude Code for orchestration, high-level judgment, reviews, and landing decisions.

Example:

```powershell
.\scripts\ask-claude.ps1 "Review ROUTING.md for gaps before I adopt it."
```

## Cursor

Use Cursor for IDE-bound work. Manual login is required before headless use:

```powershell
cursor-agent login
```

Example:

```powershell
.\scripts\ask-cursor.ps1 "Open this repo and inspect the template structure."
```

## Design Tools

Use Claude Design and Open Design as design-production tools, not authorities for repo state. They can generate UI concepts, design notes, and local prototype material. Codex or Claude Code should review and integrate any resulting code or docs into a repo.

Open Design can use local Ollama through the OpenAI-compatible endpoint:

```text
http://localhost:11434/v1
```

Use `gpt-oss:20b` as the default local model unless a design task specifically needs a different model from `configs/local-model-routing.yaml`.

## OpenClaw and OpenCode

Use OpenClaw or OpenCode when the work is about local agent harness behavior rather than a single model call. Keep harness config docs here, but do not store secrets, channel credentials, bot tokens, or live-action risk settings.

## Local Models

Authoritative local model routing lives in `configs/local-model-routing.yaml` and is explained in `docs/local-model-routing.md`.

Current local defaults:

- Default agent driver: `gpt-oss:20b` at 64k context
- Hard reasoning and vision: `qwen3.6` capped at 16k context
- Fast scratch: `qwen2.5-7b-32k`
- Embeddings: `nomic-embed-text`

Do not use `qwen2.5-coder:14b`, `qwen2.5-coder-14b-16k`, or `fable-assistant-32k` as agent-loop drivers because they do not emit native `tool_calls`.
