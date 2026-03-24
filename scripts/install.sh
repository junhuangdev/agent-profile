#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "$0")/.." && pwd)"
source_root="$repo_root/home"
backup_root="$HOME/.agent-profile-backups/$(date +%Y%m%d-%H%M%S)"
backups_created=0
linked_count=0

backup_path() {
  local target="$1"
  local rel

  rel="${target#$HOME/}"
  if [[ "$target" == "$HOME" ]]; then
    rel="HOME"
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

  mkdir -p "$(dirname "$dest")"

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

  ln -s "$src" "$dest"
  linked_count=$((linked_count + 1))
  printf 'link  %s -> %s\n' "$dest" "$src"
}

while IFS= read -r src; do
  rel="${src#$source_root/}"
  dest="$HOME/$rel"
  link_file "$src" "$dest"
done < <(find "$source_root" -type f | sort)

if (( backups_created )); then
  printf 'backup %s\n' "$backup_root"
else
  rmdir "$backup_root" 2>/dev/null || true
fi

printf 'done  linked %d file(s)\n' "$linked_count"
