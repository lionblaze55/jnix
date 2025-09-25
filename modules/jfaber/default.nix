{ pkgs, ... }:

{
  # Define the jfaber user.
  users.users.jfaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.flatpak.enable = true;

  # Common applications for jfaber.
  environment.systemPackages = with pkgs; [
    firefox
    vscodium
    wl-clipboard
    swaylock
    swayidle
    swaybg
    #vscode
    #element-desktop
    #obs-studio
  ];
}
