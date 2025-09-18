# modules/group1-common.nix
{ pkgs, ... }:
{
  imports = [
    ../common/programs.nix
    ../common/user.nix
  ];

  # Example: Add group1-specific software
  home.packages = with pkgs; [
    neovim
    docker
  ];
}
