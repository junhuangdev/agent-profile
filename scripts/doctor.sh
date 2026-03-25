#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "$0")/.." && pwd)"
source_root="$repo_root/home"
override_root="$repo_root/.local/overrides/home"
ok_count=0
bad_count=0

list_effective_files() {
  python3 - "$source_root" "$override_root" <<'PY'
from pathlib import Path
import sys

base = Path(sys.argv[1])
override = Path(sys.argv[2])
files = {}

for root in (base, override):
    if not root.exists():
        continue
    for path in sorted(root.rglob('*')):
        if path.is_file():
            rel = str(path.relative_to(root))
            files[rel] = str(path)

for rel in sorted(files):
    print(f"{files[rel]}\t{rel}")
PY
}

while IFS=$'\t' read -r src rel; do
  [[ -n "${src:-}" ]] || continue
  dest="$HOME/$rel"

  if [[ ! -e "$dest" && ! -L "$dest" ]]; then
    printf 'miss  %s\n' "$dest"
    bad_count=$((bad_count + 1))
    continue
  fi

  if ! cmp -s "$src" "$dest"; then
    printf 'diff  %s\n' "$dest"
    bad_count=$((bad_count + 1))
    continue
  fi

  if [[ -L "$dest" ]]; then
    printf 'ok    %s (symlink)\n' "$dest"
  else
    printf 'ok    %s\n' "$dest"
  fi
  ok_count=$((ok_count + 1))
done < <(list_effective_files)

printf 'summary ok=%d bad=%d\n' "$ok_count" "$bad_count"

if (( bad_count > 0 )); then
  exit 1
fi
