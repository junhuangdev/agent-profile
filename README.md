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
./scripts/install.sh
```

The installer:

- creates any missing parent folders
- backs up conflicting files into `~/.agent-profile-backups/<timestamp>/`
- links each managed file from this repo into your home directory

## Check

```bash
cd ~/repos/agent-profile
./scripts/doctor.sh
```

This checks whether the managed files in `~` point to this repo.

## Update Flow

1. Edit files in this repo.
2. Run `./scripts/install.sh`.
3. Run `./scripts/doctor.sh`.
4. Commit and push.

## Scope

This repo does not track runtime state.

It does not include:

- `~/.codex/memories/`
- `~/.codex/automations/`
- `~/.codex/skills/.system/`
- private or machine-specific state
