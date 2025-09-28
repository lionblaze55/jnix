{ pkgs, ... }:

{
  # Define the jfaber user.
  users.users.jfaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable sway
  services.gnome.gnome-keyring.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Enable virt-manager stuff
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["jfaber"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Thunar stuff
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
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
    swaynotificationcenter
    waybar
    fuzzel
    foot
    pavucontrol
  ];
}
