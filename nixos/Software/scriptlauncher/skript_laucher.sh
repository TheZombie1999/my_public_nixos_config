#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash

XDG_SCRIPTS=~/.config/scripts

echo "Select A Skript to Run:"

select script in "$XDG_SCRIPTS"/*
do
sh $script
exit
done