{config, pkgs, user, host, ...}:
{
  environment.systemPackages = with pkgs; [ syncthing ];

  # Settings
  services.syncthing = {
    enable = true;
    user = "${user}";
    dataDir = "/home/${user}"; configDir = "/home/${user}/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
  };
  
  # Devices
  services.syncthing.devices = {
    "lenovo"     = { id = "UQ7JJM5-QZVGZB5-5BVSONM-KTC3ODO-25MPJ7Z-6L245JD-GT7CFW5-ZJFTKQE"; autoAcceptFolders = true; };
    "nixos"      = { id = "WQUK7JH-T7UZHSB-EA4QQIZ-5EN26QG-4ILE5S7-4PW3ID5-5FC7DLE-OSCOGAP"; autoAcceptFolders = true; };
    "microstar"  = { id = "WXKXJ4J-XRJSRJH-52XHX4L-PYFNJOB-AYOOTWM-OXUDFW2-2XDKQJQ-YEXL3AI"; autoAcceptFolders = true; };
    "fairphone"  = { id = "GBFBBSY-LP2E2OS-O2E62SY-3PO7V36-IZURCYT-NY65ICK-QSRDGIG-U3MWFQM"; autoAcceptFolders = true; };
  };
  
  
  # services.syncthing.guiAddress = "${host}" + ":8384";
  services.syncthing.guiAddress = "0.0.0.0" + ":8384";

  
  services.syncthing.openDefaultPorts = true;
  
  
   # Syncthing ports
   networking.firewall.allowedTCPPorts = [ 8384 22000];
   networking.firewall.allowedUDPPorts = [ 22000 21027];  
  
  
  # Folders
  services.syncthing.folders = {
    "Downloads" = {
      path = "/home/${user}/Downloads";
      devices = [ "lenovo" "nixos" "microstar" "fairphone"];
      rescanInterval = 3600;
    };
    "GitHub" = {
      path = "/home/${user}/GitHub";
      devices = [ "lenovo" "nixos" "microstar" "fairphone"];
      rescanInterval = 3600;
    };
    "Personal" = {
      path = "/home/${user}/Personal";
      devices = [ "lenovo" "nixos" "microstar" "fairphone"];
      rescanInterval = 3600;
    };
    "Temp" = {
      path = "/home/${user}/Temp";
      devices = [ "lenovo" "nixos" "microstar" "fairphone"];
      rescanInterval = 3600;
    };
    "University" = {
      path = "/home/${user}/University";
      devices = [ "lenovo" "nixos" "microstar" "fairphone"];
      rescanInterval = 3600;
    };
  };
}