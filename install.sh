#!/usr/bin/env bash
# if.mux - install tmux plugins declared in .tmux.conf

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGINS="$DIR/plugins"

REPOS=(
  "tmux-plugins/tmux-sensible"
  "tmux-plugins/tmux-yank"
  "tmux-plugins/tmux-urlview"
  "tmux-plugins/tmux-cpu"
  "tmux-plugins/tmux-battery"
  "tmux-plugins/tmux-prefix-highlight"
  "tmux-plugins/tmux-online-status"
  "NHDaly/tmux-better-mouse-mode"
)

mkdir -p "$PLUGINS"

for repo in "${REPOS[@]}"; do
  name="${repo##*/}"
  dest="$PLUGINS/$name"

  if [ -d "$dest/.git" ]; then
    echo "[if.mux] updating $name"
    git -C "$dest" pull --ff-only --quiet
  else
    echo "[if.mux] installing $name"
    git clone --depth 1 --quiet "https://github.com/$repo.git" "$dest"
  fi
done

echo "[if.mux] done. reload with: tmux source-file $DIR/.tmux.conf"
