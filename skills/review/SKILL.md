---
name: agent-lab-review
description: Review agent-lab routing, templates, docs, and setup changes before adoption.
---

# Agent Lab Review

Use this for repo-infrastructure review before adopting or syncing global changes.

## Checklist

- No secrets, env files, model weights, backups, generated HTML, or app code are included.
- CLI scripts do not create remotes or commits without explicit approval.
- Local model routing matches `configs/local-model-routing.yaml`.
- External app repos are referenced in `projects/registry.yaml`, not copied into this repo.
- Manual steps are documented when login or global sync is required.

