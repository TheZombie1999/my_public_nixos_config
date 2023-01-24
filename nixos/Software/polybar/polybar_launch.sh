#!/usr/bin/env bash

# ! /usr/bin/env nix-shell
# ! nix-shell -i bash -p polybar

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c /etc/polybar/config.ini example 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."