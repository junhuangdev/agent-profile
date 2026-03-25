# agent-profile

Public base profile for agent rules, style profiles, and shared templates.

Edit the repo.
Then sync it into the target environment.

## What This Repo Manages

- `~/AGENTS.md`
- `$CODEX_HOME/AGENTS.md`
- files under `$CODEX_HOME/rules/`
- selected public-safe skills in the active agent skills directory

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
templates/
  default.rules.example
scripts/
  install.sh
  doctor.sh
```

`home/` mirrors the target paths under `$HOME`.

## Install

```bash
cd <repo-root>
bash ./scripts/install.sh --dry-run
bash ./scripts/install.sh
```

The installer:

- creates any missing parent folders
- backs up conflicting files into `<repo-root>/.local/backups/<timestamp>/`
- syncs the public base profile from `home/`
- then applies any private overrides from `.local/overrides/home/`
- writes normal files, not symlinks
- supports `--dry-run` so you can inspect changes first

## Private Overrides

Keep machine-specific permissions, paths, and secrets out of the tracked repo.

- Put private overrides under `.local/overrides/home/`
- `.local/` is git-ignored
- Override files win over the public base profile when both define the same target path

Example:

```bash
cd <repo-root>
mkdir -p .local/overrides/home/.codex/rules
cp templates/default.rules.example .local/overrides/home/.codex/rules/default.rules
```

## Check

```bash
cd <repo-root>
bash ./scripts/doctor.sh
```

This checks whether the effective managed files in the target environment match the merged result of:

- the public base profile in `home/`
- the optional private overlay in `.local/overrides/home/`

## Update Flow

1. Edit tracked files in this repo for shareable behavior.
2. Edit `.local/overrides/home/...` for machine-specific behavior.
3. Run `bash ./scripts/install.sh --dry-run`.
4. Run `bash ./scripts/install.sh`.
5. Run `bash ./scripts/doctor.sh`.
6. Commit and push tracked files.

## Scope

This repo does not track runtime state.
It also does not track private overrides under `.local/`.

It does not include:

- `$CODEX_HOME/memories/`
- `$CODEX_HOME/automations/`
- `$CODEX_HOME/skills/.system/`
- private or machine-specific state
