
with import <nixpkgs> {}; # bring all of Nixpkgs into scope

writeShellApplication rec {
  name = "launch_polybar";
  
  runtimeInputs = [ polybarFull 
                    coreutils 
                    (import ./up_microstar.nix) ];

  text = ''
    polybar-msg cmd quit || true

    echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
    polybar -c /etc/polybar/config.ini example 2>&1 | tee -a /tmp/polybar1.log & disown
    # polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

    echo "Bars launched..."
  '';
}