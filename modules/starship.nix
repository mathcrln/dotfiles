{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ../configs/starship.toml);
  };
}
