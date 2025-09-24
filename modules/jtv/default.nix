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

  # Replace "your_username" with your actual username
  users.users.user = {
    packages = with pkgs; [
      flatpak
    ];
    # This line sets up a user-level activation script
    # that will run the flatpak remote-add command.
    extraActivation = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # TV-specific applications.
  environment.systemPackages = with pkgs; [
    mpv
    plex
    vlc
  ];
}
