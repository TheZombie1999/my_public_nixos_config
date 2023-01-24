
{config, pkgs, user, ...}:
{ 
  
  programs.bash.shellInit = ''
    export PATH=$PATH:~/.config/scripts  
  '';

  home-manager.users.${user} = {
    xdg.configFile."scripts/julia_terminal_layouts.json".source = ./julia_terminal_layouts.json;
    xdg.configFile."scripts/mount_sshfs_uni.sh".source = ./mount_sshfs_uni.sh;
    xdg.configFile."scripts/open_code.sh".source = ./open_code.sh;
    xdg.configFile."scripts/open_julia_terminals.sh".source = ./open_julia_terminals.sh;
    xdg.configFile."scripts/open_large_code.sh".source = ./open_large_code.sh;
    xdg.configFile."scripts/tabbed.json".source = ./tabbed.json;
    xdg.configFile."scripts/study-cycle.sh".source = ./study-cycle.sh;
  };
}
