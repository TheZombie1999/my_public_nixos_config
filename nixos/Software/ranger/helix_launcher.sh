#! /usr/bin/env nix-shell
#! nix-shell -i bash -p alacritty helix xdotool entr

file=$1
flock --timeout 0 $file alacritty -t "$(basename $file)" -e  hx $file 

# pid=$!

# echo $pid

# win="$(xdotool search --pid $pid)"

# echo $win

# ls $1 | entr -s "xdotool type --window $win ':reload' ; xdotool key --window $win Return"
