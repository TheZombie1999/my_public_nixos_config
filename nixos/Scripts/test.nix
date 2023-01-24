
with import <nixpkgs> {}; # bring all of Nixpkgs into scope

writeShellApplication rec {
  name = "test";
  
  runtimeInputs = [curl w3m];
  
  text = ''
    curl -s 'https://nixos.org' | w3m -dump -T text/html
  '';
}