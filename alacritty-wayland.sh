#!/bin/sh
# sudo dpkg-divert --local --divert /usr/bin/alacritty.real --rename /usr/bin/alacritty
# sudo cp -a ./alacritty-wayland.sh /usr/bin/alacritty
# sudo dpkg-divert --rename --remove /usr/bin/alacritty

set -e

ALACRITTY=$(which alacritty.real || which alacritty)

exec env WINIT_UNIX_BACKEND=x11 $ALACRITTY "$@"
