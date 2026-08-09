{ pkgs, ... }:

let
  # Laravel-ready PHP: default extensions + the ones Laravel/Horizon/queues need.
  php = pkgs.php85.withExtensions ({ enabled, all }:
    enabled ++ (with all; [
      bcmath
      gd
      intl
      pdo_mysql
      pdo_pgsql
      pcntl
      redis
      sodium
      zip
    ]));
in
{
  home.packages = [
    php
    php.packages.composer
  ] ++ (with pkgs; [
    bat
    eza
    tree
    httpie
    mkcert
    ffmpeg
  ]);
}
