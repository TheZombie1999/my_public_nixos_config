{ config, pkgs, user, host,... }:
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [ alacritty ];
    xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
    xdg.configFile."alacritty/fontsize.yml". source = if host == "nixos" then ./nixos-fontsize.yml else ./lenovo-fontsize.yml;
  };
}
