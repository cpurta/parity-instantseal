#!/bin/bash

RPCPORT=8545
WSPORT=8546
if [[ "${ROOT}" = "" ]] ; then ROOT="/geth" ; fi
if [[ "${UNLOCK_ACCOUNT}" = "" ]] ; then UNLOCK_ACCOUNT="0x1f7402f55e142820ea3812106d0657103fc1709e" ; fi

source ./common_start.sh

set_passwords() {
    for file in $(ls /parity/keys/InstantSealChain); do
        # all accounts have a blank password, set the password file for unlocking all accounts at run time
        echo "" >> /parity/password
    done
}

node_start() {
  # launch parity in the background
  /parity/parity --config /parity/instant-seal-config.toml --gasprice 1 &
  NODE_PID=$!
}

set_passwords
start
