#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "$0")/.." && pwd)"
source_root="$repo_root/home"
state_root="$repo_root/.local"
backup_root="$state_root/backups/$(date +%Y%m%d-%H%M%S)"
backups_created=0
linked_count=0
dry_run=0

usage() {
  cat <<'EOF'
Usage: install.sh [--dry-run]

Options:
  --dry-run   Show planned changes without writing anything
EOF
}

while (($#)); do
  case "$1" in
    --dry-run)
      dry_run=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'unknown option: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

backup_path() {
  local target="$1"
  local rel

  rel="${target#$HOME/}"
  if [[ "$target" == "$HOME" ]]; then
    rel="HOME"
  fi

  if (( dry_run )); then
    printf 'plan  backup %s -> %s\n' "$target" "$backup_root/$rel"
    return
  fi

  mkdir -p "$backup_root/$(dirname "$rel")"
  if [[ -L "$target" ]]; then
    cp -P "$target" "$backup_root/$rel"
  else
    cp -p "$target" "$backup_root/$rel"
  fi
  backups_created=1
}

remove_path() {
  local target="$1"

  if (( dry_run )); then
    printf 'plan  remove %s\n' "$target"
    return
  fi

  python3 - "$target" <<'PY'
import os
import sys

path = sys.argv[1]
os.remove(path)
PY
}

link_file() {
  local src="$1"
  local dest="$2"
  local current=""

  if (( dry_run )); then
    printf 'plan  ensure-dir %s\n' "$(dirname "$dest")"
  else
    mkdir -p "$(dirname "$dest")"
  fi

  if [[ -L "$dest" ]]; then
    current="$(readlink "$dest")"
    if [[ "$current" == "$src" ]]; then
      printf 'ok    %s\n' "$dest"
      return
    fi
    backup_path "$dest"
    remove_path "$dest"
  elif [[ -e "$dest" ]]; then
    backup_path "$dest"
    remove_path "$dest"
  fi

  if (( dry_run )); then
    printf 'plan  link %s -> %s\n' "$dest" "$src"
  else
    ln -s "$src" "$dest"
    printf 'link  %s -> %s\n' "$dest" "$src"
  fi
  linked_count=$((linked_count + 1))
}

while IFS= read -r src; do
  rel="${src#$source_root/}"
  dest="$HOME/$rel"
  link_file "$src" "$dest"
done < <(find "$source_root" -type f | sort)

if (( dry_run )); then
  printf 'mode  dry-run\n'
  printf 'state %s\n' "$state_root"
elif (( backups_created )); then
  printf 'backup %s\n' "$backup_root"
else
  rmdir "$backup_root" 2>/dev/null || true
fi

printf 'done  linked %d file(s)\n' "$linked_count"
