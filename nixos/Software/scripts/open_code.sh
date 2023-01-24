#!/usr/bin/env nix-shell
#! nix-shell -i bash -p alacritty file helix


dir=$1


i3-msg "workspace $(basename $dir); append_layout ~/.config/scripts/tabbed.json"

alacritty --working-directory $dir &

find $dir -print0 | while IFS= read -r -d '' file
do 
  if  [[ "$file" != *.git* ]] && [ -e $file ] && [ ! -d $file ]; then 
  
    if [[ $(file $file) == *text* ]]; then 
      rifle $file &
    fi
  fi
done



