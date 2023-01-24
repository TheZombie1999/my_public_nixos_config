#!/usr/bin/env nix-shell
#! nix-shell -i bash -p xdotool alacritty openssh coreutils


i3-msg "workspace juliaConsoles; append_layout ~/.config/scripts/julia_terminal_layouts.json"

function open_julia_repl(){
  local password=$1
  local folder=$2

  alacritty &
  local pid=$!
  local win="$(xdotool search --pid=$pid)"
  
  
  openSsh $password $win
  openJuliaProject $password $folder $win
}


function openSsh () {
  local password=$1
  local win=$2
  
  sleep 0.5
  
  xdotool type --window=$win "ssh uni" 
  xdotool key --window=$win enter 
  
  sleep 2
  xdotool type "$(printf "${password}\n ")"
}

function openJuliaProject ()
{
  local password=$1 
  local dir=$2
  local win=$3
  
  sleep 0.5
  
  xdotool type --window=$win "$(printf "cd $dir ; julia --project=. \n ")"
}

password=


for folder in ${folders[@]}; do 
  open_julia_repl $password $folder 
done







