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

  #Thunar stuff
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
  ];

  # Common applications for jfaber.
  environment.systemPackages = with pkgs; [
    vscodium
    wl-clipboard
    swaylock
    swayidle
    swaybg
    waybar
    fuzzel
    foot
    gnome-disk-utility
  ];
}
