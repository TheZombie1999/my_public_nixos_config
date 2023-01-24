{pkgs, home-manager, user,...}:
{
  # environment.systemPackages = with pkgs; [ polybar ];

  # home-manager.users.${user} = {
  #   services.polybar = {
  #     enable = true;
  #     package = pkgs.polybarFull;
  #     config = ./config.ini;
  #     script = ''
  #         polybar &
  #       '';
  #   };
  # };
}
