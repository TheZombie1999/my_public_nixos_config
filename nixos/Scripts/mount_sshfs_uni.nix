

with import <nixpkgs> {}; # bring all of Nixpkgs into scope

writeShellApplication rec {
  name = "mount_uni_fs";
  
  runtimeInputs = [ sshfs coreutils ];
  text = ''
    mkdir -p ~/Drives/Uni
  ''; 
}
