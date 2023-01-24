{config, pkgs, home-manager, user,...}:
{
  home-manager.users.${user} = {
    services.clipmenu = {
      enable = true;
    };
  };  
}

