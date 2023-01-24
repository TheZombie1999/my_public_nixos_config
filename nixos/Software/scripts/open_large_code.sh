#!/usr/bin/env nix-shell
#! nix-shell -i bash -p alacritty file helix


dir=$1


i3-msg "workspace $(basename $dir); append_layout ~/.config/scripts/tabbed.json"

alacritty --working-directory $dir -e ranger . &

# find $dir -print0 | while IFS= read -r -d '' file
# do 
#   if  [[ "$file" != *.git* ]] && [ -e $file ] && [ ! -d $file ]; then 
  
#     if [[ $(file $file) == *text* ]]; then 
#       alacritty -t $(basename $file) -e hx $file &
#     fi
#   fi
# done



