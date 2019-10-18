#!/usr/bin/env bash
rm -r deploy/bitcoin/regtest/blocks/*
rm deploy/bitcoin/regtest/keys.d3.wallet
rm deploy/bitcoin/regtest/transfers.d3.wallet

# Copy genesis block
if cp notary/deploy/iroha/genesis.block deploy/iroha/genesis.copy.block; then
  echo Genesis block has been copied
else
  echo Cannot copy genesis block
  exit 1
fi

# Start backend
if docker-compose -f deploy/docker-compose.yml up -d; then
  echo Backend containers have been started
else
  echo Cannot start backend
  exit 1
fi

readonly var backoffice="back-office"

# Start frontend
if yarn --cwd $backoffice serve; then
  echo Frontend has been started
else
  echo Cannot start frontend
  exit 1
fi

