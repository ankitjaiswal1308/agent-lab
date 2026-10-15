# Design Tools

This repo supports design tooling without letting generated design output become canonical automatically.

## Tools

| Tool | Use For | Integration Rule |
|---|---|---|
| Claude Design | Design concepts, UI exploration, visual reasoning, product-facing drafts | Export or summarize output, then review through Claude Code or Codex before committing |
| Open Design | Local design generation through Ollama-compatible endpoints | Use local model routing; review output before app-repo integration |

## Open Design Local Endpoint

Use Ollama's OpenAI-compatible endpoint when running local design generation:

```text
http://localhost:11434/v1
```

Preferred model:

```text
gpt-oss:20b
```

If a design workflow needs vision or harder local reasoning, use `qwen3.6` with the 16k context cap from `configs/local-model-routing.yaml`.

## Boundaries

- Do not store generated HTML exports unless explicitly needed.
- Do not store API keys or BYOK credentials.
- Do not let design-tool output mutate app repos without a reviewed Codex or Claude Code pass.
- Keep reusable design procedures in `skills/design-tools/`.
