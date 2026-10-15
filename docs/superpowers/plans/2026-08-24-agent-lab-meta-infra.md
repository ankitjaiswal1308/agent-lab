# Agent Lab Meta Infra Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Set up `D:\projects\agent-lab` as the unified meta-infrastructure repo for agent routing, shared skills, local model routing, imported local-agent material, repo templates, and external project registry.

**Architecture:** Keep `agent-lab` as the source of truth for meta-infrastructure only. Copy useful local-agent material into `local-agents/` while leaving `D:\projects\local-agents` untouched. Track external app repos by path in `projects/registry.yaml` without moving their code.

**Tech Stack:** Git, PowerShell wrapper scripts, YAML routing config, Markdown documentation, Python local tool-call harness.

---

### Task 1: Repository Guardrails

**Files:**
- Create: `.gitignore`
- Create: `README.md`
- Create: `ROUTING.md`

- [x] Initialize Git locally with `git init`.
- [x] Add ignore rules for secrets, model weights, backups, generated HTML, caches, and local editor state.
- [x] Document repo scope, boundaries, routing lanes, and manual steps.

### Task 2: Local Model Routing

**Files:**
- Create: `configs/local-model-routing.yaml`
- Create: `docs/local-model-routing.md`

- [x] Capture `gpt-oss:20b` as the default local agent driver at 64k.
- [x] Capture `qwen3.6` as hard reasoning / vision with a 16k cap.
- [x] Capture `qwen2.5-7b-32k` as fast scratch and `nomic-embed-text` as embeddings.
- [x] Mark `qwen2.5-coder:14b`, `qwen2.5-coder-14b-16k`, and `fable-assistant-32k` as excluded from agent-loop driving.

### Task 3: Imports and Templates

**Files:**
- Create: `local-agents/`
- Create: `templates/app-repo/`
- Create: `projects/registry.yaml`

- [x] Import useful local-agent setup and tool-calling material by copy or reconstruction from inspected source.
- [x] Exclude backups and generated HTML.
- [x] Add an app-repo template containing `AGENTS.md`, Cursor skills folder, and `docs/HANDOFF.md`.
- [x] Register `E:\staap` as an external app repo.

### Task 4: Verification

**Files:**
- Verify: all created files

- [ ] Run `git status --short`.
- [ ] Confirm excluded files are not present.
- [ ] Run syntax checks for PowerShell and Python if the command runner is available.

