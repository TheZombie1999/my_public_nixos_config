{config, pkgs, user,...}:
{

  environment.systemPackages = with pkgs; [ sxhkd ];
  
  home-manager.users.${user} = {
    xsession.enable = true;
    services.sxhkd = {
      enable = true;
      extraOptions = if user != "steam" then [
        "-c"
        "~/.config/sxhkd/i3_sxhkdrc"
        "~/.config/sxhkd/sxhkdrc"
      ]
      else
      [
        "-c"
        "~/.config/sxhkd/steam-shortcuts"
      ];
    };
  
    xdg.configFile."sxhkd/steam-shortcuts".source = ./steam-shortcuts;
    xdg.configFile."sxhkd/sxhkdrc".source = ./sxhkdrc;
    xdg.configFile."sxhkd/i3_sxhkdrc".source = ./i3_sxhkdrc;
    xdg.configFile."sxhkd/glyphy.md".source = ./glyphy.md;
  };
  
}
