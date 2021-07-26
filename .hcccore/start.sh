#!/usr/bin/env bash

# SIGTERM-handler
term_handler() {
  exit 0
}
trap term_handler SIGTERM

if [ ! -f /root/.hcccore/hcc.conf ]; then
  if [ -z "$RPCUSER" -o -z "$RPCPASSWORD" ]; then
    echo "When no /sentinel/hcc.conf is present, you must at least set RPCUSER, RPCPORT and RPCPASSWORD environment variables"
    exit 1
  fi
  echo "" > /root/.hcccore/hcc.conf
  if [ -n "$RPCUSER" ]; then
    echo "rpcuser=${RPCUSER}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$RPCPASSWORD" ]; then
    echo "rpcpassword=${RPCPASSWORD}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$RPCALLOWIP" ]; then
    echo "rpcallowip=${RPCALLOWIP}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$ADDNODE" ]; then
    echo "addnode=${ADDNODE}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$EXTERNALIP" ]; then
    echo "externalip=${EXTERNALIP}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$MASTERNODEBLSPRIVKEY" ]; then
    echo "masternodeblsprivkey=${MASTERNODEBLSPRIVKEY}" >> /root/.hcccore/hcc.conf
  fi
  if [ -n "$RPCBIND" ]; then
    echo "masternodeblsprivkey=${MASTERNODEBLSPRIVKEY}" >> /root/.hcccore/hcc.conf
  fi
fi

hccd