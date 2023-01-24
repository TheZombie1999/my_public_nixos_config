{ config, lib, pkgs, ...}:
with lib;
let cfg = config.MyHardware; in
{

  options = {
    MyHardware.AutoUpdate = mkOption {
      type = types.bool;
      default = false;
    }; 
  };
  
  config = lib.mkIf cfg.AutoUpdate  {
    system.autoUpgrade = {
      enable = true;
      operation = "boot";
      flake = "/etc/nixos";
      flags = [ "--update-input" "nixpkgs" "home-manager" "nixfork" "--commit-lock-file" "--impure"];
      dates = "16:30";
      allowReboot = true;
      rebootWindow = { lower = "16:30"; upper = "17:00";};
    };

    services.cron = {
      enable = true;
      systemCronJobs = [
        " 15 16 * * * root cd /etc/nixos && eval $(ssh-agent -s) && ssh-add /home/tim/.ssh/github-key && git pull -q origin master &> /home/out.log"
      ];
  };
  };
  
}

