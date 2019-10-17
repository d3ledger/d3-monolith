#!/usr/bin/env bash
rm -r deploy/bitcoin/regtest/blocks/*
rm deploy/bitcoin/regtest/keys.d3.wallet
rm deploy/bitcoin/regtest/transfers.d3.wallet
docker-compose -f deploy/docker-compose.yml up -d
