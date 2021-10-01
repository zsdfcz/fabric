#!/bin/bash

cd ~/go/src/dev-mode/basic-network
./bin/cryptogen generate --config=./organizations/cryptogen/crypto-config-org1.yaml --output=organizations
./bin/cryptogen generate --config=./organizations/cryptogen/crypto-config-orderer.yaml --output=organizations
