{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    git
    htop
  ];
}
