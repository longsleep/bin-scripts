#!/bin/sh

set -e

TARGET_IP="$1"
shift
LOG="$1"
shift
SCRIPT="$@"

if [ -z "$SCRIPT" ]; then
	echo "Usage: $0 <host> <logfile> <script>"
	exit 1
fi

if ping -c 1 -W 1 -q "$TARGET_IP" >/dev/null 2>&1; then
	STAMP=$(date '+%Y-%m-%d')
	touch "$LOG"
	if ! grep -q "$STAMP" "$LOG"; then
		$SCRIPT
		echo "$STAMP" > "$LOG"
	fi
fi
