
dockerTools.buildImage {
  name = "pihole";
  tag = "latest";

  fromImage = "pihole/pihole:latest";
  fromImageName = null;
  fromImageTag = "latest";

  contents = pkgs.redis;
  runAsRoot = ''
    #!${pkgs.runtimeShell}
    mkdir -p /data
  '';

  config = {
    Cmd = [ "/bin/redis-server" ];
    WorkingDir = "/data";
    Volumes = { "/data" = { }; };
  };
}