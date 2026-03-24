#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "$0")/.." && pwd)"
source_root="$repo_root/home"
state_root="$repo_root/.local"
backup_root="$state_root/backups/$(date +%Y%m%d-%H%M%S)"
backups_created=0
synced_count=0
unchanged_count=0
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

copy_file() {
  local src="$1"
  local dest="$2"

  if (( dry_run )); then
    printf 'plan  sync %s <- %s\n' "$dest" "$src"
    return
  fi

  cp -p "$src" "$dest"
  printf 'sync  %s\n' "$dest"
}

sync_file() {
  local src="$1"
  local dest="$2"

  if (( dry_run )); then
    printf 'plan  ensure-dir %s\n' "$(dirname "$dest")"
  else
    mkdir -p "$(dirname "$dest")"
  fi

  if [[ -L "$dest" ]]; then
    backup_path "$dest"
    remove_path "$dest"
    copy_file "$src" "$dest"
    synced_count=$((synced_count + 1))
    return
  elif [[ -e "$dest" ]]; then
    if cmp -s "$src" "$dest"; then
      printf 'ok    %s\n' "$dest"
      unchanged_count=$((unchanged_count + 1))
      return
    fi
    backup_path "$dest"
    copy_file "$src" "$dest"
    synced_count=$((synced_count + 1))
    return
  fi

  copy_file "$src" "$dest"
  synced_count=$((synced_count + 1))
}

while IFS= read -r src; do
  rel="${src#$source_root/}"
  dest="$HOME/$rel"
  sync_file "$src" "$dest"
done < <(find "$source_root" -type f | sort)

if (( dry_run )); then
  printf 'mode  dry-run\n'
  printf 'state %s\n' "$state_root"
elif (( backups_created )); then
  printf 'backup %s\n' "$backup_root"
else
  rmdir "$backup_root" 2>/dev/null || true
fi

printf 'done  synced %d file(s), unchanged %d file(s)\n' "$synced_count" "$unchanged_count"
