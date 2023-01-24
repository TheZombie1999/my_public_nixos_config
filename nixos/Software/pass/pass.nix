{pkgs, user, ...}:
{
  # https://gist.github.com/abtrout/d64fb11ad6f9f49fa325  

  environment.systemPackages = with pkgs; [pass gnupg pinentry-curses];
  
  home-manager.users.${user} = {
    home.file.".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;
  };
}