{pkgs, ...}:
{
  imports = [
    ./hosts.nix
    ./firewall.nix
  ];
  
  networking.networkmanager.enable = true;
  users.extraGroups.networkmanager.members = ["root"]; 
}