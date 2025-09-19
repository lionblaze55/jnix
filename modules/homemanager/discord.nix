# modules/apps/discord.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
  ];

  # Manage Discord's settings.json file.
  # This provides a declarative way to set user preferences.
  home.file.".config/discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true,
      "DANGEROUSLY_DISABLE_AUTOSAVE_AND_RESTORE": false
    }
  '';

  # Optionally, you can also manage the window state.
  home.file.".config/discord/window-state.json".text = ''
    {
      "x": 0,
      "y": 0,
      "width": 1920,
      "height": 1080,
      "isMaximized": true
    }
  '';
}