{ config, pkgs, ... }:
{
  imports = [
    ./../modules/common/programs.nix
    ./../modules/common/user.nix
    ./../modules/tv-common.nix
  ];

  networking.hostName = "tv-x86";
  
  # TV-specific settings (e.g., lightweight window manager, media apps)
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.xmonad.enable = true;

  # User configuration
  users.users.tvuser = {
    isNormalUser = true;
    home = {
      stateVersion = "24.11";
      extraSpecialArgs = { inherit (self) inputs; };
    };
  };
}
