#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "$0")/.." && pwd)"
source_root="$repo_root/home"
ok_count=0
bad_count=0

while IFS= read -r src; do
  rel="${src#$source_root/}"
  dest="$HOME/$rel"

  if [[ ! -e "$dest" && ! -L "$dest" ]]; then
    printf 'miss  %s\n' "$dest"
    bad_count=$((bad_count + 1))
    continue
  fi

  if [[ ! -L "$dest" ]]; then
    printf 'file  %s\n' "$dest"
    bad_count=$((bad_count + 1))
    continue
  fi

  current="$(readlink "$dest")"
  if [[ "$current" != "$src" ]]; then
    printf 'diff  %s -> %s\n' "$dest" "$current"
    bad_count=$((bad_count + 1))
    continue
  fi

  printf 'ok    %s\n' "$dest"
  ok_count=$((ok_count + 1))
done < <(find "$source_root" -type f | sort)

printf 'summary ok=%d bad=%d\n' "$ok_count" "$bad_count"

if (( bad_count > 0 )); then
  exit 1
fi
