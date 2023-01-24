{ pkgs, home-manager, user, ...}:
{
  # environment.systemPackages = with pkgs; [
  #   rofi
  # ];
  
  home-manager.users.${user} = {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [       
        rofi-top
        rofi-pass
        rofi-calc
        rofi-systemd
        rofi-unwrapped
        rofi-power-menu
        rofi-pulse-select
        rofi-file-browser
      ];
      terminal = "${pkgs.alacritty}/bin/alacritty";
      theme = "gruvbox-dark-hard";
      font = "JuliaMono";
      extraConfig = {
        modes = "drun,ssh,window,filebrowser,top,calc,run";
      };
    };
  };
}