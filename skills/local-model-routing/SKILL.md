---
name: local-model-routing
description: Choose a local Ollama model for agent-loop, reasoning, scratch, or embedding work.
---

# Local Model Routing

Use this when selecting a local model.

## Defaults

- Agent loops: `gpt-oss:20b`, 65536 context.
- Hard reasoning / vision: `qwen3.6`, 16384 context cap.
- Fast scratch: `qwen2.5-7b-32k`, 32768 context.
- Embeddings: `nomic-embed-text`.

## Hard Exclusions

Do not use these as agent-loop drivers:

- `qwen2.5-coder:14b`
- `qwen2.5-coder-14b-16k`
- `fable-assistant-32k`

They do not emit native `tool_calls`.

