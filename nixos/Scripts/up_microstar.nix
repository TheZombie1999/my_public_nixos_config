
with import <nixpkgs> {}; # bring all of Nixpkgs into scope

writeShellApplication rec {
  name = "up_microstar";
  
  runtimeInputs = [ netcat ];
  
  text = ''
    
    if nc -4 -d -z -w 1 microstar 22 &> /dev/null
    then
      printf "microstar ✓"
    else 
      printf "microstar ⨉"
    fi
  '';
}