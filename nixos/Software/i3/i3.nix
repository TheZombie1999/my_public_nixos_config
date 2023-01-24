{ config, lib, pkgs, user,...}:
{

  environment.systemPackages = with pkgs; [ feh ];

  home-manager.users.${user} = {
    xdg.configFile."i3/config".source = ./config;
  };
}
