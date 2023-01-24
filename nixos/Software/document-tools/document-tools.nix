{pkgs, user, home-manager, ...}:
{
  
  home-manager.users.${user} = {
    home.packages = with pkgs; [ 
      xournalpp
      imagemagick
      pdftk
      texlive.combined.scheme-full
      adobe-reader
      mupdf
    ];
  };  
}