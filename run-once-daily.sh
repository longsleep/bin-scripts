#!/bin/sh

set -e

PING=/bin/ping

TARGET_IP="$1"
LOG="$2"

if [ -z "$3" ]; then
	echo "Usage: $0 <host> <logfile> <script>"
	exit 1
fi

shift
shift
SCRIPT="$@"

if $PING -c 1 -W 1 -q "$TARGET_IP" >/dev/null 2>&1; then
	STAMP=$(date '+%Y-%m-%d')
	touch "$LOG"
	if ! grep -q "$STAMP" "$LOG"; then
		$SCRIPT
		echo "$STAMP" > "$LOG"
	fi
fi
