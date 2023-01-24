{pkgs, ...}:
{
  home.packages = [
    pkgs.vifm
  ];
  
  xdg.configFile."vifm/vifmrc".source = ./vifmrc;
  xdg.configFile."vifm/colors/gruvbox.vifm".source = ./colors/gruvbox.vifm;
}