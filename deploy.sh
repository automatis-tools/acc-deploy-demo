#!/bin/sh
# Fake production deploy. Overlaps are recorded, because they are what the lane must prevent.
set -u
cd "$(dirname "$0")"
f="$1"
if ! mkdir .deploy.lock 2>/dev/null; then
  echo "$(date +%T) COLLISION $f" | tee -a deploys.log
  sleep 20
  exit 1
fi
trap 'rm -rf .deploy.lock' EXIT
echo "$(date +%T) START $f" | tee -a deploys.log
sleep 20
echo "$(date +%T) LIVE $f" | tee -a deploys.log
