# Local LLM Agent Setup

This is the agent-lab copy of the useful local-agent setup decisions imported from `D:\projects\local-agents`.

The source project recorded this machine profile:

- GPU: NVIDIA RTX 4060 Ti with 16 GB VRAM
- RAM: 64 GB
- CPU: AMD Ryzen 5 7600X
- OS: Windows 11 Pro
- Ollama model storage: `D:\ollama\models`

## Environment

The imported setup script configures:

```powershell
OLLAMA_MODELS=D:\ollama\models
OLLAMA_FLASH_ATTENTION=1
OLLAMA_KV_CACHE_TYPE=q8_0
```

`setx` only affects new processes. Fully quit and relaunch Ollama, or reboot, after changing these values.

## Current Routing Decisions

The latest imported decision set supersedes older June 2026 notes:

- `gpt-oss:20b` is the default local agent driver at 64k context.
- `qwen3.6` is useful for hard reasoning and vision but must stay capped at 16k context.
- `qwen2.5-7b-32k` is the fast scratch model.
- `nomic-embed-text` is the embedding model.
- `qwen2.5-coder:14b`, `qwen2.5-coder-14b-16k`, and `fable-assistant-32k` are not agent-loop drivers because they do not emit native `tool_calls`.

## Verification Harness

The imported Python harness in `local-agents/tests/test_tool_calling.py` exercises a minimal loop:

1. Send a user prompt and tool schemas to local Ollama.
2. Confirm the model emits native `tool_calls`.
3. Execute the local Python tool.
4. Feed the result back to the model.
5. Confirm a sensible final answer.

Run it only when Ollama is available locally:

```powershell
python .\local-agents\tests\test_tool_calling.py
```

