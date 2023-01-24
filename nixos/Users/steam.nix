
{config, pkgs, home-manager,...}@args:
let 
  user = { 
    user= "steam"; 
    home-manager = home-manager; 
    host = config.networking.hostName; 
  };
in
{
  imports = [
      (import ./../Software/i3/i3.nix                (args // user))
      (import ./../Software/sxhkd/sxhkdrc.nix        (args // user))
      (import ./../Software/alacritty/alacritty.nix  (args // user))
    ];
    
  users.users.steam = {
      isNormalUser = true;
      extraGroups = [ "users" "wheel" "corectrl" ];
      packages = [ pkgs.steam pkgs.steam-run ];
  };
    
  
  programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      };
    
    
  home-manager.users.steam = {
    home.username = "steam";
    home.homeDirectory = "/home/steam";
    home.stateVersion = "22.05";
    
      
    home.packages = [
        pkgs.steam
      ];
    };
}
