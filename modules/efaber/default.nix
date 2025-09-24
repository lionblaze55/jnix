{ pkgs, ... }:

{
  # Define the efaber user.
  users.users.efaber = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  services.flatpak.enable = true;

  # Replace "your_username" with your actual username
  users.users.efaber = {
    packages = with pkgs; [
      flatpak
    ];
    # This line sets up a user-level activation script
    # that will run the flatpak remote-add command.
    extraActivation = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Common applications for efaber.
  environment.systemPackages = with pkgs; [
    krita
  ];
}
