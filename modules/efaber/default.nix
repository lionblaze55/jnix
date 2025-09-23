{ pkgs, ... }:

{
  # Define the efaber user.
  users.users.efaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  ];

  # Common applications for efaber.
  environment.systemPackages = with pkgs; [
    brave
    libreoffice
  ];
}
