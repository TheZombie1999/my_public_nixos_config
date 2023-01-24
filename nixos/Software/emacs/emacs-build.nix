{ pkgs ? import <nixpkgs> {} }: 

let
  myEmacs = pkgs.emacs; 
  emacsWithPackages = (pkgs.emacsPackagesFor myEmacs).emacsWithPackages; 
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [ 
    magit          # ; Integrate git <C-x g>
    zerodark-theme # ; Nicolas' theme
  ]) ++ (with epkgs.melpaPackages; [ 
    zoom-frm       
  ]) ++ (with epkgs.elpaPackages; [ 
    auctex         # ; LaTeX mode
    beacon         # ; highlight my cursor when scrolling
    nameless       # ; hide current package name everywhere in elisp code
  ]))