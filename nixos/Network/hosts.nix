{ pkgs, ... }:
{

  networking.extraHosts = ''
    127.0.0.1      localhost  
    137.250.121.24 remote
    192.168.1.27  microstar
    192.168.2.103  lenovo
    192.168.1.30  nixos
  '';
}
