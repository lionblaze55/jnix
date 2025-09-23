{ pkgs, ... }:

{
  # Desktop-specific packages.
  environment.systemPackages = with pkgs; [
    gimp
    krita
  ];
}
