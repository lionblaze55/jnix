{ config, pkgs, ... }:

{
  # Enable automatic garbage collection
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  # Optimize store and keep derivations
  nix.settings.keep-outputs = true;
  nix.settings.keep-derivations = true;
  nix.settings.auto-optimise-store = true;
}
