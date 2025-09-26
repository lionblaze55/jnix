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

  services = {
    syncthing = {
        enable = true;
        user = "jfaber";
        dataDir = "/home/jfaber";    # Default folder for new synced folders, instead of /var/lib/syncthing
        configDir = "/home/jfaber/a/rc/jnix/files/jdesktop/syncthing";   # Folder for Syncthing's settings and keys. Will be overwritten by Nix!		
    };
  };

  #Thunar stuff
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
    waybar
    fuzzel
    foot
  ];
}
