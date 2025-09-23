{ pkgs, ... }:

{
  # Define the jfaber user.
  users.users.jfaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Common applications for jfaber.
  environment.systemPackages = with pkgs; [
    firefox
    vscode
    element-desktop
    obs-studio
  ];
}
