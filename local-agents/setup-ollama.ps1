<#
  setup-ollama.ps1
  One-shot setup for the local-LLM agentic stack on THIS machine.
  Hardware : RTX 4060 Ti 16 GB VRAM | 64 GB DDR5 | Ryzen 5 7600X | Win 11 Pro
  Storage  : models live on D: (Samsung 980 1TB NVMe) -- NOT the C: boot drive.
  Imported : 2026-08-24 into agent-lab from D:\projects\local-agents
#>

# --- 1. Storage + tuning env vars (idempotent, safe to re-run) ---------------
New-Item -ItemType Directory -Force "D:\ollama\models" | Out-Null
setx OLLAMA_MODELS          "D:\ollama\models"   # keep multi-GB models off C:
setx OLLAMA_FLASH_ATTENTION "1"                  # cheaper attention -> bigger context
setx OLLAMA_KV_CACHE_TYPE   "q8_0"               # ~halve KV-cache VRAM (lets 64k fit)

Write-Host ""
Write-Host "Env vars set. Next steps:" -ForegroundColor Cyan
Write-Host "  1) Install Ollama from https://ollama.com/download  (if not already)"
Write-Host "  2) FULLY QUIT Ollama from the system tray, then relaunch (or reboot)."
Write-Host "     setx only affects NEW processes; a running server won't see it."
Write-Host "  3) Open a NEW PowerShell window and run the pull section below."
Write-Host ""

# --- 2. Pull models (run AFTER Ollama is installed + restarted) --------------
#     Current routing decisions from local-llm-agent-setup.md:

# Default local agent driver -- 64k context, native tool calls:
# ollama pull gpt-oss:20b

# Hard reasoning / vision -- cap runtime context at 16k:
# ollama pull qwen3.6

# Fast scratch model:
# ollama pull qwen2.5-7b-32k

# Embeddings for memory / RAG:
# ollama pull nomic-embed-text

# --- 3. Verify ---------------------------------------------------------------
# ollama list
# ollama run gpt-oss:20b "Reply with one word: ready"
# ollama ps

