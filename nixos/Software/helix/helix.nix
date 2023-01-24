{ config, pkgs, user,... }:
{
  environment.systemPackages = with pkgs; [
    helix
    rnix-lsp
  ];

  home-manager.users.${user} = {
    xdg.configFile."helix/config.toml".source = ./config.toml;
  };
}


