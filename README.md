# jnix
Declarative configuration for home systems.

This example uses a systems directory to hold host-specific configurations and a modules directory for shared settings. 
.
├── flake.nix
├── flake.lock
├── systems
│   ├── group1-workstation.nix
│   ├── group1-laptop.nix
│   ├── group2-workstation.nix
│   ├── group2-laptop.nix
│   └── tv-x86.nix
└── modules
    ├── common
    │   ├── programs.nix
    │   └── user.nix
    ├── group1-common.nix
    ├── group2-common.nix
    └── tv-common.nix
