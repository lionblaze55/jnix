{ pkgs, ... }:

{
  # Define the generic 'user'.
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable the XFCE desktop environment.
  #services.xserver = {
  #  enable = true;
  #  desktopManager.xfce.enable = true;
  #  displayManager.lightdm.enable = true;
  #};

  services.flatpak.enable = true;

  # TV-specific applications.
  environment.systemPackages = with pkgs; [
    mpv
    plex
    vlc
  ];
}
