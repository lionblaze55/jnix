{ config, pkgs, lib, ... }:
{
  # System-wide CLI tools available to all users
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    power-profiles-daemon
    stow
  ];

  # System-wide fonts
  fonts = {
    packages = with pkgs; [
      font-awesome
      hack-font
    ];

    # Fontconfig is typically enabled by desktop modules; keep this explicit if needed.
    # fontconfig.enable = true;
  };
}
