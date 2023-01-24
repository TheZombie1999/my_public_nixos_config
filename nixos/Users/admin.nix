
{pkgs, home-manager, nixpkgs, config,...}@args:
let 
  user = { user= "admin"; home-manager = home-manager; host = config.networking.hostName; };
in
{
  imports = [
      (import ./../Software/ranger/ranger.nix         (args // user))
      (import ./../Software/scripts/scripts.nix       (args // user))
      (import ./../Software/helix/helix.nix           (args // user))
      (import ./../Software/shell/shell.nix           (args // user))
      (import ./../Software/syncthing/syncthing.nix   (args // user))
      (import ./../Software/docker/docker.nix         (args // user))
      (import ./../Software/synergy/synergy.nix       (args // user))
      (import ./../Software/pihole/pihole-service.nix (args // user))
      (import ./../Software/sxhkd/sxhkdrc.nix         (args // user))
      (import ./../Software/i3/i3.nix                 (args // user))
    ];    
    
  users.users.${user.user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
  };
    
  home-manager.users.${user.user} = {
    home.username = "${user.user}";
    home.homeDirectory = "/home/${user.user}";
    home.stateVersion = "22.05";
  };
}
