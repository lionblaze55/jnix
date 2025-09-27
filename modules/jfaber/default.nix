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

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # override the default GTK-Theme from Stylix
    theme = lib.mkForce {
      name = "Nightfox-Dark";
      package = pkgs.nightfox-gtk-theme;
    };
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
