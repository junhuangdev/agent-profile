# agent-profile

A shareable base profile for agent rules, style skills, and Codex runtime overlays.

Use this repo to keep public, reusable behavior in version control.
Keep machine-specific rules in a private local overlay.

This is not a full dotfiles repo.
It is a clean base layer for agent behavior.

## What This Repo Gives You

- a global `AGENTS.md` baseline
- a Codex runtime supplement
- shared response-style skills
- reusable rule templates
- install and verification scripts

## How It Works

1. Put shareable behavior in `home/`
2. Put machine-specific behavior in `.local/overrides/home/`
3. Run `install.sh` to sync the merged result into the target environment
4. Run `doctor.sh` to verify the live files still match

The installer writes normal files.
It does not depend on symlinks.

## Quick Start

```bash
git clone <repo-url> agent-profile
cd agent-profile
mkdir -p .local/overrides/home/.codex/rules
cp templates/default.rules.example .local/overrides/home/.codex/rules/default.rules
bash ./scripts/install.sh --dry-run
bash ./scripts/install.sh
bash ./scripts/doctor.sh
```

## Public Vs Private

Tracked public files:

- global rules
- Codex overlay rules
- shareable skills
- templates and helper scripts

Private local files:

- permissions rules
- machine paths
- secrets
- runtime state

`.local/` is git-ignored.
Private overrides win when the same target path exists in both places.

## Managed Targets

- `~/AGENTS.md`
- `$CODEX_HOME/AGENTS.md`
- files under `$CODEX_HOME/rules/`
- selected files in the active agent skills directory

## Repo Layout

```text
home/
  AGENTS.md
  .codex/
    AGENTS.md
    rules/
  .agents/
    skills/
templates/
  default.rules.example
scripts/
  install.sh
  doctor.sh
```

`home/` is the public base profile.
`.local/overrides/home/` is the private overlay.
`templates/` holds shareable starting points.

## Daily Workflow

1. Edit tracked files in `home/` for shareable behavior
2. Edit `.local/overrides/home/...` for machine-specific behavior
3. Run `bash ./scripts/install.sh --dry-run`
4. Run `bash ./scripts/install.sh`
5. Run `bash ./scripts/doctor.sh`
6. Commit and push tracked files

## Scope

This repo does not track:

- `$CODEX_HOME/memories/`
- `$CODEX_HOME/automations/`
- `$CODEX_HOME/skills/.system/`
- private overrides under `.local/`
- other machine-specific or runtime-only state
