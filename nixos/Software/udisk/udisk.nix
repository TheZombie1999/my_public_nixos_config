
{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [ udisks udiskie inotify-tools dunst ];
  
  services.udisks2.enable = true;
  
  
  services.xserver.windowManager.i3.extraSessionCommands = "udiskie &";
  # systemd.services.udiskie = {
  #   enable = true;
  #   script = ''
  #     udiskie &
  #   '';
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];  
  # };
}