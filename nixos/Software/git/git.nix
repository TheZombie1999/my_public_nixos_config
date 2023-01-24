
{config, pkgs, user, ...}:
{
  # Add github key to the ssh agent
  # eval "$(ssh-agent -s)"  
  # ssh-add ~/.ssh/id_ed25519

  environment.systemPackages = with pkgs; [ git gitui];

  home-manager.users.${user} = {
    # Git  
    programs.git = {
      enable = true;
      userName = "TheZombie1999";
      userEmail = "ninja110tim@hotmail.de";
    };

    # Gitui
    xdg.configFile."gitui/key_bindings.ron".source = ./key_bindings.ron;
    xdg.configFile."gitui/theme.ron".source = ./theme.ron;
  };
}