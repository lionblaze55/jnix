Initial setup and deployment
1. Generate hardware-configuration.nix
For each machine, boot into a NixOS installer and run the following commands, then copy the resulting hardware-configuration.nix to the appropriate host directory in your flake:
sh
nixos-generate-config --root /mnt
Use code with caution.

2. Install NixOS
On each machine, use your newly created flake to install NixOS. For example, for jdesktop:
sh
nixos-install --flake /path/to/your/config#jdesktop
Use code with caution.

3. Rebuild and switch configuration
After the initial install, or to apply new changes, you can rebuild the system. From any machine (if SSH is enabled) or directly on the machine, run the following command. For example, to rebuild the jdesktop:
sh
nixos-rebuild switch --flake /path/to/your/config#jdesktop

.
├── flake.nix
├── hosts
│   ├── jdesktop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── jlaptop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── edesktop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── elaptop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── jtv
│       ├── configuration.nix
│       └── hardware-configuration.nix
└── modules
    ├── common
    │   └── default.nix
    ├── desktop
    │   └── default.nix
    ├── jfaber
    │   └── default.nix
    ├── efaber
    │   └── default.nix
    └── jtv
        └── default.nix
