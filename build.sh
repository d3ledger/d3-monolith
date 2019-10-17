#!/usr/bin/env bash
export TAG=monolith
# Update submodules
if git submodule update --init; then
  echo All submodules have been updated
else
  echo Cannot update submodules
  exit 1
fi

# Submodules
declare -a repos=(
  "chain-adapter"
  "d3-btc"
  #TODO add Ethereum later
  #"d3-eth"
  "notary"
  "report-system"
  "business-rules"
)

for repo in "${repos[@]}"; do
  # Checkout to develop, pull and build docker images
  if git -C $repo checkout develop && git -C $repo pull origin develop --rebase && $repo/gradlew -p $repo clean dockerBuild; then
    echo All projects have been built successfully
  else
    echo Cannot build project $repo
    exit 1
  fi
done
