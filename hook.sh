#!/bin/sh
set -e
gem_dir=$1

git add "$gem_dir"
git commit -m "1000 more gems. [$GEM_INDEX/$GEM_COUNT] missing: $GEM_MISSING"
git pull
git push

