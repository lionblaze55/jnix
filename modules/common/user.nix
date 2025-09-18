{ config, pkgs, ... }:
{
  # Example: configure zsh for all users
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -lh";
      update = "nixos-rebuild switch --flake .#$(hostname)";
    };
  };
}
