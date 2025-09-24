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

  # Enable vscodium
  environment.systemPackages = with pkgs; [ vscodium ];

  services.gnome.gnome-keyring.enable = true;

  # Common applications for jfaber.
  environment.systemPackages = with pkgs; [
    firefox
    grimshot
    #vscode
    #element-desktop
    #obs-studio
  ];
}
