{pkgs, user, host, ...}:
{
  environment.systemPackages = with pkgs; [ synergy ];
  environment.etc."synergy.conf".source = ./synergy.conf;
  
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 24800 ];
    allowedUDPPorts = [ 24800 ];
  };
  
  services.synergy.server = if host == "nixos" then {
    enable = true;
    configFile = "/etc/synergy.conf";
    address = "192.168.2.107";
    autoStart = true;
  } else {
    enable = false;    
  };
  
  services.synergy.client = if host != "nixos" then {
    enable = true;
    serverAddress = "192.168.2.107";
    autoStart = true;
  } else {
    enable = false;
  };
}