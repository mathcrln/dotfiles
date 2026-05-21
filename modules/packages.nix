{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    eza
    tree
    httpie
    mkcert
    ffmpeg
    php
    phpPackages.composer
  ];
}
