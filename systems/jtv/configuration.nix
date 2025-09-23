{ ... }:

{
  imports = [
    (import ../../modules/common)
    (import ../../modules/jtv)
    ./hardware-configuration.nix
  ];

  networking.hostName = "jtv";
}
