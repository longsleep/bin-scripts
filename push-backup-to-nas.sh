#!/bin/sh

set -e

PING=/bin/ping
NSLOOKUP=/usr/bin/nslookup
ZREPL=/usr/bin/zrepl

JOB=$1
IP=$2
HOSTNAME=$3

if [ -z "$HOSTNAME" ]; then
	echo "Usage: $0 <job> <ip> <hostname>"
	exit 1
fi

$PING -c1 $IP >/dev/null 2>&1
if [ ! $? = 0 ]; then
	exit 0
fi

$NSLOOKUP $IP | grep -i $HOSTNAME >/dev/null 2>&1
if [ ! $? = 0 ]; then
	exit 0
fi

exec $ZREPL signal wakeup $JOB
