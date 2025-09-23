{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    git
    htop
  ];

  fonts.packages = with pkgs; [
    font-awesome
    hack-font
];

}
