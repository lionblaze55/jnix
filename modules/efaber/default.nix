{ pkgs, ... }:

{
  # Define the efaber user.
  users.users.efaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  services.flatpak.enable = true;

  # Common applications for efaber.
  environment.systemPackages = with pkgs; [
    krita
  ];

  # Enable KDE for embil
  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
  ];
  services.displayManager.sddm.wayland.enable = true;
  hardware.bluetooth.enable = true;

}
