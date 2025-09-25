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
}
