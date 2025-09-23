# modules/jfaber-common.nix
{ config, pkgs, ... }:

{
  imports = [
    ../common/programs.nix
    ../common/user.nix
    ../common/backend.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
  ];

  # Optional: Enable Docker service if needed
  #services.docker.enable = true;

  # Optional: Add jfaber user to docker group
  #users.users.jfaber.extraGroups = [ "docker" ];
}
