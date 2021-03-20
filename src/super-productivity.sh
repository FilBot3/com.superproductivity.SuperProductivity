#!/usr/bin/env bash

function cleanup_superproductivity() {
  echo "Performing Cleanup"

  ps aux | grep -v grep | grep -i superproductivity | aws '{print $2}' | xargs kill -9

  exit 2
}

trap cleanup_superproductivity 2

export TMPDIR="$XDG_RUNTIME_DIR/app/$FLATPAK_ID"
exec zypak-wrapper /app/superProductivity/superproductivity "$@"

