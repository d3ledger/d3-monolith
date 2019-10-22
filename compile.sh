#!/usr/bin/env bash

# Backend submodules
declare -a repos=(
  "chain-adapter"
  "d3-btc"
  #TODO add Ethereum later
  #"d3-eth"
  "notary"
  "report-system"
  "business-rules"
)

# Build backend
for repo in "${repos[@]}"; do
  # Checkout to develop, pull and build docker images
  if git -C $repo checkout develop --force && git -C $repo pull origin develop --rebase && $repo/gradlew -p $repo clean dockerBuild; then
    echo All projects have been built successfully
  else
    echo Cannot build project $repo
    exit 1
  fi
done

