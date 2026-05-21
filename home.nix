{ config, pkgs, lib, ... }:

{
  home.username = "mathcrln";
  home.homeDirectory = "/Users/mathcrln";
  home.stateVersion = "25.11";

  imports = [
    ./modules/packages.nix
    ./modules/tools.nix
    ./modules/shell.nix
    ./modules/starship.nix
    ./modules/git.nix
  ];

  home.sessionPath = [
    "$HOME/.composer/vendor/bin"
    "$HOME/Library/pnpm"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/Library/pnpm";
    EDITOR = "zed";
    _ZO_DOCTOR = "0";
  };

  home.file = {
    ".config/ghostty/themes".source = ./configs/ghostty/themes;
    ".config/zed/keymap.json".source = ./configs/zed/keymap.json;
    ".config/Code/User/settings.json".source = ./configs/vscode/settings.json;
    ".config/Code/User/keybindings.json".source = ./configs/vscode/keybindings.json;
  };

  programs.home-manager.enable = true;
}
