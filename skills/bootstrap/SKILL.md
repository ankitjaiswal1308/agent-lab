---
name: agent-lab-bootstrap
description: Bootstrap a new app repo with shared agent metadata from agent-lab.
---

# Agent Lab Bootstrap

Use this when creating the meta layer for a new app repo.

## Procedure

1. Copy `templates/app-repo/` into the target app repo.
2. Edit the target `AGENTS.md` with project-specific boundaries.
3. Add project handoff conventions in `docs/HANDOFF.md`.
4. Register the app in `projects/registry.yaml` if it should be tracked externally.
5. Do not move app code into `agent-lab`.

