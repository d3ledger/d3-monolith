#!/usr/bin/env bash
export TAG=monolith

git submodule update --init

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
    git -C $repo checkout develop
    git -C $repo pull origin develop --rebase
    $repo/gradlew -p $repo clean dockerBuild
done
