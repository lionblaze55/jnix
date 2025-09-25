Initial setup and deployment
1. Generate hardware-configuration.nix
Run the generic NixOS GUI installer to setup luks/initial user passwd, then copy the resulting hardware-configuration.nix to the appropriate host directory in your flake:

```cp /etc/nixos/hardware-configuration.nix ~/Downloads/jnix/systems/{hostname}/```

2. Install NixOS
On each machine, use your newly created flake to install NixOS. For example, for jdesktop:

```nixos-install --flake /path/to/your/config#jdesktop```

3. Rebuild and switch configuration
After the initial install, or to apply new changes, you can rebuild the system. From any machine (if SSH is enabled) or directly on the machine, run the following command. For example, to rebuild the jdesktop:

```nixos-rebuild switch --flake /path/to/your/config#jdesktop```

```.
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
```
