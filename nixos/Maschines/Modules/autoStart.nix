{ config, lib, pkgs, ... }:
{
  options = { };
  config = {
    systemd.user.services.chromium-autostart = {
      description = "Starts Chromium a boot";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = ''${pkgs.chromium}/bin/chromium'';
        Reload = "on-failure";
      };
    };
    systemd.user.services.whatsapp-autostart = {
      description = "Starts Whats App at boot";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = ''${pkgs.whatsapp-for-linux}/bin/whatsapp-for-linux'';
        Reload = "on-failure";
      };
    };
    systemd.user.services.discord-autostart = {
      description = "Starts Discord at boot";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = ''${pkgs.discord}/bin/discord'';
        Reload = "on-failure";
      };
    };

    systemd.user.services.mpv-rammstein = {
      description = "Runs Rammstein song at boot";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = ''${pkgs.mpv}/bin/mpv /home/tim/Personal/Playlists/Rammstein/Angst.mkv'';
        Reload = "on-failure";
      };
    };



  };
}
