{config, pkgs, home-manager, user,...}:
{
  environment.systemPackages = with pkgs; [ dunst ];
  
  home-manager.users.${user} = {
    services.dunst.enable = true;
  };  
}

