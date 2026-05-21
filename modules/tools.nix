{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd" "cd" ];
  };

  programs.ripgrep.enable = true;

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
