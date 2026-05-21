{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "mathcrln";
      user.email = "mathieu@madinco.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
    ignores = [
      ".DS_Store"
      ".idea/"
      ".vscode/"
      "*.swp"
    ];
  };
}
