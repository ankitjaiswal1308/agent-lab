# Local LLM Agentic Stack - Setup and Decisions

Imported useful setup material from `D:\projects\local-agents\docs\local-llm-agent-setup.md`.

Last source update noted: 2026-08-21.

## Machine Profile

| Component | Spec | Notes |
|---|---|---|
| GPU | NVIDIA RTX 4060 Ti, 16 GB VRAM | Binding constraint for model sizing |
| RAM | 64 GB DDR5 | Supports CPU offload |
| CPU | AMD Ryzen 5 7600X | Orchestration and offloaded layers |
| OS | Windows 11 Pro | Native Ollama and CUDA |
| Model storage | `D:\ollama\models` | Keeps model weights off C: |

## Ollama Environment

The imported setup script configures:

```powershell
OLLAMA_MODELS=D:\ollama\models
OLLAMA_FLASH_ATTENTION=1
OLLAMA_KV_CACHE_TYPE=q8_0
```

Restart Ollama after changing these values because `setx` only applies to new processes.

## Current Model Roster

| Role | Model | Context | Status |
|---|---|---:|---|
| Default local agent driver | `gpt-oss:20b` | 65536 | Use by default |
| Hard reasoning / vision | `qwen3.6` | 16384 | Do not raise above 16k |
| Fast scratch | `qwen2.5-7b-32k` | 32768 | Fast local scratch |
| Embeddings | `nomic-embed-text` | N/A | RAG and memory |

## Native Tool-Calling Audit

Use as agent-loop drivers:

- `gpt-oss:20b`
- `qwen3.6`
- `qwen2.5:7b-instruct`
- `qwen2.5-7b-32k`

Do not use as agent-loop drivers:

- `qwen2.5-coder:14b`
- `qwen2.5-coder-14b-16k`
- `fable-assistant-32k`

The excluded models emit tool-call JSON in message content instead of the native `tool_calls` field.

## Operational Notes

- `gpt-oss:20b` was recorded as the recommended default after re-verification.
- `qwen3.6` was recorded as useful but fragile; source notes say 32k context hard-crashed the Ollama daemon.
- Cold model calls can distort throughput measurements. Discard the first cold timing.
- Check `ollama --version` when CUDA or OOM behavior changes, especially around deferred auto-updates.
- Prefer `GET /api/ps` and `nvidia-smi` over the `ollama ps` percentage column alone.

