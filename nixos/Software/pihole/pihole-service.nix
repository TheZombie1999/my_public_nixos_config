{config, pkgs, user, ...}:
{
  home-manager.users.${user} = {
    xdg.configFile."scripts/build-pihole-docker.sh".source = ./build-pihole-docker.sh;
    xdg.configFile."pihole/docker-compose.yml".source = ./docker-compose.yml;
  };

  networking.firewall = {
    allowedTCPPorts = [ 80 53 ];
    allowedUDPPorts = [ 53 67 ];
  };

  systemd.services.pihole = {
    wantedBy = [ "multi-user.target" ];
    after = [ "docker.service" "network-online.target" "dhcpd.service" ];
    requires = [ "docker.service" "multi-user.target" ];
    description = "pihole";
    serviceConfig = {
      Restart = ''always'';
      ExecStart = ''${pkgs.docker}/bin/docker start -a pihole'';         
      ExecStop  = ''${pkgs.docker}/bin/docker stop -t 2 pihole'';    };
  };
}