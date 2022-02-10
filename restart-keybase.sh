#!/bin/sh

set -e
sudo fusermount -u /keybase

exec run_keybase
