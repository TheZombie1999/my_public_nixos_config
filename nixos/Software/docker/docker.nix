{pkgs, user, ...}:
{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = [ "docker" ];
}
