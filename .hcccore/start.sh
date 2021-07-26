#!/usr/bin/env bash

# SIGTERM-handler
term_handler() {
  exit 0
}
trap term_handler SIGTERM

if [ -n "$RPCALLOWIP" ]; then
  echo "rpcallowip=${RPCUSER}" >> /root/.hcccore/hcc.conf
fi

cd /root/.hcccore; \
 hccd