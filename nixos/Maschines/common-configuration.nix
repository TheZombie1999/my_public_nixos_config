{ lib, pkgs, nixpkgs,...}:
{
  nixpkgs.config.permittedInsecurePackages = [
                "adobe-reader-9.5.5"
                "libdwarf-20210528"
              ];
  # Nix Package Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
      "minecraft-launcher"
    ];
   
  
  # Localization
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  services.xserver.layout = "de";
  console.useXkbConfig = true;
  
  # Sound  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  # Enable SSH
  services.openssh.enable = true;
  
}