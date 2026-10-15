# Hermes

Hermes is documented here for future evaluation only.

Current status:

- Not installed by this setup.
- Not configured in routing by default.
- Earlier local-agent notes mentioned Hermes as interesting for steerable tool-calling, but the current default driver is `gpt-oss:20b`.

Before adopting Hermes:

1. Verify current Ollama tags and tool-call behavior.
2. Test native `tool_calls` with `local-agents/tests/test_tool_calling.py`.
3. Add a reviewed entry to `configs/local-model-routing.yaml`.

