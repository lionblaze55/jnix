# modules/jfaber-common.nix
{ pkgs, ... }:
{
  imports = [
    ../common/programs.nix
    ../common/user.nix
    ../homemanager/xdg.nix
  ];

  # Example: Add jfaber-specific software
  home.packages = with pkgs; [
    neovim
    docker
  ];
}
