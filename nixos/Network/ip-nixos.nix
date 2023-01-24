
{...}:
{
  networking.interfaces.enp7s0.ipv4.addresses = [ {
    address = "192.168.1.30";
    prefixLength = 24;
  } ];

  networking.defaultGateway = "192.168.1.1";  
  networking.nameservers = [ "8.8.8.8" ];
  # networking.nameservers = [ "192.168.2.106" "8.8.8.8"];
  
  # networking.useDHCP = true;
}

