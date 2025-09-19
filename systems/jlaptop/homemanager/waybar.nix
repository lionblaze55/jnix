{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/mode" ];
        modules-right = [ "cpu" "memory" "pulseaudio" "clock" ];
        "sway/workspaces" = {
          format = "{name}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
          };
        };
        clock = {
          format = "{:%H:%M}";
        };
        cpu = {
          format = "{icon0} {usage}%";
          "format-icons" = [ "" "" "" ];
        };
        memory = {
          format = " {used:0.1f}G";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          "format-icons" = {
            default = [ "" "" "" ];
            headphone = "";
          };
        };
      };
    };
  };

  # Make sure the Waybar package is available
  home.packages = with pkgs; [
    waybar
    mako
  ];
}