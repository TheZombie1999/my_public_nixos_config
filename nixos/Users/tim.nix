
{pkgs, home-manager, nixpkgs, config, nixfork,...}@args:
let 
  user = { 
    user= "tim"; 
    home-manager = home-manager; 
    host = config.networking.hostName; 
  };
in
{
  imports = [
      (import ./../Software/ranger/ranger.nix        (args // user))
      (import ./../Software/scripts/scripts.nix      (args // user))
      (import ./../Software/helix/helix.nix          (args // user))
      (import ./../Software/shell/shell.nix          (args // user))
      (import ./../Software/alacritty/alacritty.nix  (args // user))
      # (import ./../Software/syncthing/syncthing.nix  (args // user))
      # (import ./../Software/synergy/synergy.nix      (args // user))
      (import ./../Software/sxhkd/sxhkdrc.nix        (args // user))
      (import ./../Software/i3/i3.nix                (args // user))
      (import ./../Software/git/git.nix              (args // user))
      (import ./../Software/ssh/ssh.nix              (args // user))
      (import ./../Software/pass/pass.nix            (args // user))
      (import ./../Software/udisk/udisk.nix          (args // user))
      (import ./../Software/glow/glow.nix            (args // user))
      (import ./../Software/polybar/polybar.nix      (args // user))
      (import ./../Software/dunst/dunst.nix          (args // user))
      (import ./../Software/document-tools/document-tools.nix (args // user))
      (import ./../Software/browser-collection/browser.nix (args // user))
      (import ./../Software/media/media.nix (args // user))
      (import ./../Software/ssh/ssh.nix (args // user))
      # (import ./../Software/kakoune/kakoune.nix (args // user))
      (import ./../Software/rofi/rofi.nix (args // user))
      (import ./../Software/clipmenu/clipmenu.nix (args // user))
    ];    
  
  environment.systemPackages = with pkgs; [ 
    julia-bin 
    bat 
    python3 
    fork.upscaly 
    ncdu 
    # anbox 
    h5utils 
    hdf5 
    hdfview 
    surf 
    clang-tools 
    bear
    whatsapp-for-linux
    tmux
    # blender
    pciutils
    # qutebrowser-qt6
    arandr
  ];
    
  users.users.${user.user} = {
      isNormalUser = true;
      extraGroups = [ "users" "wheel" "corectrl"];
  };
    
  home-manager.users.${user.user} = {
    home.username = "${user.user}";
    home.homeDirectory = "/home/${user.user}";
    home.stateVersion = "22.05";
    
    home.file.".background-image".source = ./mountains_and_stars.jpg;
  };
}