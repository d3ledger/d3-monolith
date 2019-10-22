#!/usr/bin/env bash
export TAG=monolith
# Update submodules
if git submodule update --init; then
  echo All submodules have been updated
else
  echo Cannot update submodules
  exit 1
fi

readonly var backoffice="back-office"

# Update frontend
if git -C $backoffice checkout develop --force && git -C $backoffice pull origin develop --rebase; then
  echo Frontend repo has been updated successfully
else
  echo Cannot update frontend repo
  exit 1
fi

# Build frontend
if yarn --cwd $backoffice; then
  echo Frontend has been built successfully
else
  echo Cannot build frontend
  exit 1
fi

