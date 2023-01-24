
{...}:
{
  networking.interfaces.enp3s0.ipv4.addresses = [ {
    address = "192.168.1.27";
    prefixLength = 24;
  } ];

  networking.defaultGateway = "192.168.1.1";  
  networking.nameservers = [ "8.8.8.8" ];
}

