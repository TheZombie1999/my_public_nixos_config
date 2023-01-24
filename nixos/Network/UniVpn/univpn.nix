{pkgs, ...}:
{
  # networking.networkmanager.plugins = [
  #   pkgs.networkmanager-openvpn
  # ];
  
  services.openvpn.servers = {
    uni = { 
      config = ''''; 
      authUserPass = {
        username = "";
        password = "";
      };
    };
  };  
}