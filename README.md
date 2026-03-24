# agent-profile

Public home for Jun's agent rules, style profiles, and shared templates.

This repo is the source of truth.

Do not edit the live files in `~` by hand.
Edit this repo.
Then run the install script.

## What This Repo Manages

- `~/AGENTS.md`
- `~/.codex/AGENTS.md`
- files under `~/.codex/rules/`
- selected public-safe skills under `~/.agents/skills/`

## Managed Skills

- `critical-peer-style`
- `default-style`
- `executive-summary-style`
- `find-skills`
- `teaching-style`

## Layout

```text
home/
  AGENTS.md
  .codex/
    AGENTS.md
    rules/
  .agents/
    skills/
scripts/
  install.sh
  doctor.sh
```

`home/` mirrors the target paths under `~`.

## Install

```bash
cd ~/repos/agent-profile
bash ./scripts/install.sh --dry-run
bash ./scripts/install.sh
```

The installer:

- creates any missing parent folders
- backs up conflicting files into `~/repos/agent-profile/.local/backups/<timestamp>/`
- syncs each managed file from this repo into your home directory as a normal file
- supports `--dry-run` so you can inspect changes first

## Check

```bash
cd ~/repos/agent-profile
bash ./scripts/doctor.sh
```

This checks whether the managed files in `~` match this repo.

It accepts either:

- normal files with the same content
- existing symlinks with the same content

## Update Flow

1. Edit files in this repo.
2. Run `bash ./scripts/install.sh --dry-run`.
3. Run `bash ./scripts/install.sh`.
4. Run `bash ./scripts/doctor.sh`.
5. Commit and push.

## Scope

This repo does not track runtime state.

It does not include:

- `~/.codex/memories/`
- `~/.codex/automations/`
- `~/.codex/skills/.system/`
- private or machine-specific state
