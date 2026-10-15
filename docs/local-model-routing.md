# Local Model Routing

This document summarizes the current local Ollama routing policy. The detailed imported history is in `local-agents/docs/local-llm-agent-setup.md`.

## Defaults

| Role | Model | Context | Tool Calls | Notes |
|---|---:|---:|---|---|
| Default local agent driver | `gpt-oss:20b` | 65536 | Yes | Primary local tool-calling loop driver |
| Hard local reasoning / vision | `qwen3.6` | 16384 | Yes | Do not raise context; 32k crashed Ollama in prior testing |
| Fast scratch | `qwen2.5-7b-32k` | 32768 | Yes | Lower-latency local scratch work |
| Embeddings | `nomic-embed-text` | N/A | No | RAG and memory |

## Exclusions

Do not use these models as agent-loop drivers:

- `qwen2.5-coder:14b`
- `qwen2.5-coder-14b-16k`
- `fable-assistant-32k`

Reason: the imported tool-calling audit says these models emit tool-call JSON in message content instead of the native `tool_calls` field. Agent frameworks expecting native tool calls can silently do nothing.

## Operational Rules

- Prefer `gpt-oss:20b` for local agent loops.
- Use `qwen3.6` only when hard reasoning or vision is worth the fragility and smaller context cap.
- Discard the first cold model timing before recording throughput.
- Check `ollama --version` after model loading or CUDA issues, especially around deferred auto-updates.
- Use `GET /api/ps` and `nvidia-smi` for GPU checks; do not rely only on the `ollama ps` percentage column.

