{ pkgs, ...}:
{
  # environment.systemPackages = with pkgs; [
    # ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: [ epkgs.vterm ]))
  # ]; 
  
  # services.emacs.enable = true;
  # services.emacs.package = import ./emacs-build.nix { inherit pkgs; };
  
  
}
