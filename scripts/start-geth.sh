#!/bin/sh
#
# Starts a local fast-synced geth node.

DEFAULT_NETWORK=mainnet

if [ "$NETWORK" = "" ]; then
	NETWORK=$DEFAULT_NETWORK
fi

if [ "$PRUNE_GETH" != "" ]; then
    exec geth snapshot prune-state
elif [ "$START_GETH" != "" ]; then
	if [ "$NETWORK" != "$DEFAULT_NETWORK" ]; then
		exec geth --goerli --http --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net" --ipcdisable
	else
		exec geth --http --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net" --ipcdisable
	fi
fi
