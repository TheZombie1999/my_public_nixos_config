with (import <nixpkgs> {});
derivation {
  name = "cryptr";
  builder = "${bash}/bin/bash";
  args = [];
  src = builtins.fetchGit {
    url = "git@github.com:nodesocket/cryptr.git";
    ref = "master";
  };
  system = builtins.currentSystem;
}