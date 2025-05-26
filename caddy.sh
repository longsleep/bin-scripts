#!/bin/sh

set -e

CADDY1=${CADDY1:-cadde caddy}
CADDY2=${CADDY2:-caddy_linux_amd64}
CADDY2FILE=${CADDY2FILE:-Caddyfile2}
CADDY2MARKER=${CADDY2MARKER:-.myrun-use-caddy2}
CADDY=${CADDY:-}

if [ -e "$CADDYMARKER" -a -z "$CADDY" ]; then
	CADDY=2
	
elif [ -e "$CADDY2FILE" -a -z "$CADDY" ]; then
	CADDY=2
	set -- run --config $CADDY2FILE "$@"
fi

if [ "$CADDY" = "2" ]; then
	export XDG_CONFIG_HOME="$(pwd)/.caddy2"	
	exec $CADDY2 "$@"
else
	exec $CADDY1 "$@"
fi

