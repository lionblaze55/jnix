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

  # Replace "your_username" with your actual username
  users.users.jfaber = {
    packages = with pkgs; [
      flatpak
    ];
    # This line sets up a user-level activation script
    # that will run the flatpak remote-add command.
    extraActivation = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Common applications for jfaber.
  environment.systemPackages = with pkgs; [
    firefox
    grimshot
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
