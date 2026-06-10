{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # --- Git ---
      gs = "git status";
      gaa = "git add .";
      gco = "git checkout";
      gcob = "git checkout -b";
      grd = "git rebase dev";
      gre = "git rebase";
      gfod = "git fetch origin dev:dev";
      gcm = "git commit -m";
      lm = "git checkout main && git pull";
      gp = "git pull && git push";
      gprune = "git fetch --prune";
      gpf = "git push --force-with-lease";
      ulc = "git reset --soft HEAD~1";
      gst = "git stash";
      pop = "git stash pop";
      gsa = "git stash apply";
      gdn = "git diff --name-only";
      nah = "git reset --hard && git clean -df";
      gwhen = "git log -S";
      glog = "git log --oneline --graph --decorate -20";
      wipn = "git diff @{upstream}..HEAD --";
      pending = "git log --oneline @{upstream}..HEAD";

      # --- Docker ---
      dcb = "docker compose build";
      dcu = "docker compose up -d";
      dcd = "docker compose down";
      dcl = "docker compose logs -f";
      dce = "docker compose exec";
      diprune = "docker image prune -a";

      # --- pnpm ---
      nrd = "pnpm run dev";
      nrb = "pnpm run build";
      nrp = "pnpm run preview";
      ni = "pnpm install";
      nu = "pnpm uninstall";
      nr = "pnpm run";
      nrt = "pnpm run test";

      # --- macOS ---
      port = "lsof -i";
      stop = "kill -9";
      flushdns = "sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder";
      ip = "curl ifconfig.me";
      hosts = "sudo code /etc/hosts";

      # --- Shell ---
      hms = "home-manager switch --flake ~/Developer/dotfiles";
      sourcez = "exec zsh";
      hs = "grep $HISTFILE -e";

      # --- PHP / Laravel Sail ---
      sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
      sa = "sail artisan";
      sci = "sail composer install";
      scu = "sail composer update";
      sd = "sail composer dev";
      stp = "sail artisan test -p=4";
      spi = "sail pnpm i";
      spid = "sail pnpm i -D";
      srd = "sail pnpm dev";
      srb = "sail pnpm build";
      srs = "sail artisan reverb:start";
      shor = "sail artisan horizon";
      sq = "sail artisan queue:work";
      smig = "sail artisan migrate";
      fresh = "sail artisan migrate:fresh";
      "fresh-" = "sail artisan migrate:fresh --seed";
      ss = "sail shell";
      sdb = "sail mysql";
      sr = "sail artisan route:list";
      scc = "sail artisan config:clear && sail artisan cache:clear";
      sop = "sail artisan optimize:clear";
    };

    initContent = lib.mkMerge [
      (builtins.readFile ../configs/functions.zsh)

      ''
        [ -f "$HOME/.vite-plus/env" ] && . "$HOME/.vite-plus/env"
      ''

      (lib.mkAfter ''
        [ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"
      '')
    ];
  };
}
