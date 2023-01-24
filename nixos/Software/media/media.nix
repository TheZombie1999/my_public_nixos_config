# Media - Collection
{pkgs, user, host, home-manager,...}:
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [ mpv vlc youtube-dl ];
  };
}