{ config, pkgs, user,... }:
{
  environment.systemPackages = [
    pkgs.ranger
    pkgs.ueberzug
    pkgs.poppler_utils
  ];

  home-manager.users.${user} = {
    xdg.configFile."ranger/scope.sh".source = ./scope.sh;
    xdg.configFile."ranger/scope.sh".executable = true;
    xdg.configFile."ranger/rifle.conf".source = ./rifle.conf;
    xdg.configFile."ranger/rc.conf".source = ./rc.conf;
    xdg.configFile."ranger/colorschemes" = { 
      source = ./colorschemes;
      recursive = true;
    };
    xdg.configFile."ranger/plugins/ranger_devicons/__init__.py".source = ./devicons__init__.py;
    xdg.configFile."ranger/plugins/ranger_devicons/devicons.py".source = ./devicons.py;
    xdg.configFile."scripts/helix_launcher.sh".source = ./helix_launcher.sh;
  };
}
