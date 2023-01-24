{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixfork.url = "github:TheZombie1999/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixfork, ... }@attrs:
    let
      system = "x86_64-linux";
      overlay-fork = final: prev: {
        # fork = nixfork.legacyPackages.${prev.system};
        fork = import nixfork {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {

      #####################################################
      # MOAB - Configuration                              #
      #####################################################
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = attrs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-fork ]; })
          ./Maschines/nixos-configuration.nix
          ./Users/tim.nix
          ./Users/steam.nix
        ];
      };
      #####################################################
      # Microstar - Configuration                         #
      #####################################################

      nixosConfigurations.microstar = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = attrs;
        modules = [
          ./Maschines/microstar-configuration.nix
          ./Users/admin.nix
        ];
      };

      #####################################################
      # Lenovo - Configuration                            #
      #####################################################

      nixosConfigurations.lenovo = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = attrs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-fork ]; })
          ./Maschines/lenovo-configuration.nix
          ./Users/tim.nix
        ];
      };
    };
}
