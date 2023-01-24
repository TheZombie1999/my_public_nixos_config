# Browser - Collection
{pkgs, user, host, home-manager,...}:
let 
linktowebsite = url:  
''
  <meta http-equiv="refresh" content="0; url=${url}" />
''; 
in
{
  home-manager.users.${user} = {
    home.packages = with pkgs; [ brave surf chromium firefox ];

    home.file = {
      "Websites/youtube.html".text = linktowebsite "https://www.youtube.com/";
      "Websites/digicampus.html".text = linktowebsite "https://digicampus.uni-augsburg.de/";
      "Websites/nixos-search.html".text = linktowebsite "https://search.nixos.org/packages";
      "Websites/duckduckgo.html".text = linktowebsite "https://duckduckgo.com/";
      "Websites/arch-applications.html".text = linktowebsite "https://wiki.archlinux.org/title/List_of_Applications";
      "Websites/arch-wiki.html".text = linktowebsite "https://wiki.archlinux.org/";
      "Websites/overleaf.html".text = linktowebsite "https://de.overleaf.com/project";
      "Websites/github.html".text = linktowebsite "https://github.com/";
      "Websites/duden-mentor.html".text = linktowebsite "https://mentor.duden.de/";
    };
  };
}