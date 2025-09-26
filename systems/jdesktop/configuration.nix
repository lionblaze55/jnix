{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix #
      ../../modules/common
      ../../modules/workstation
      ../../modules/jfaber
    ];

  # ... (other system configurations)

  users.users.jfaber = {
    isNormalUser = true;
    description = "Joshua Faber";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/mnt/g" =
    { device = "/dev/disk/by-uuid/e1e59b33-24f6-4515-b460-a0f33838d220";
      fsType = "btrfs";
    };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "jdesktop"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
 # programs.nm-applet.enable = true;
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wl-clipboard
    networkmanagerapplet
    firefox
#   signal-desktop
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk=true;
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.flatpak.enable = true;
#  nixpkgs.config.allowUnfree = true;


  fonts.packages = with pkgs; [
    font-awesome
#    powerline-fonts
#    powerline-symbol
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # #TODO removed until understood better! Home Manager configuration for the user
  #home-manager.users.jfaber = {
  #  home.stateVersion = "25.05";
  #  imports = [
  #    ./../modules/jfaber-common.nix # A shared module
  #    #./homemanager/discord.nix     # Host-specific sub-config for Discord
  #    ./homemanager/sway.nix        # Host-specific sub-config for Sway
  #    ./homemanager/waybar.nix        # Host-specific sub-config for waybar
  #    # Add other host-specific Home Manager configs here
  #  ];
  #};
  # ... (other system configurations)
  system.stateVersion = "25.05"; # Did you read the comment?
}
