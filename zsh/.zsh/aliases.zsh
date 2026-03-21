# --- Git ---
alias gs="git status"
alias gaa="git add ."
alias gco="git checkout"
alias gcob="git checkout -b"
alias grd="git rebase dev"
alias gre="git rebase"
alias gfod="git fetch origin dev:dev"
alias gcm="git commit -m"
alias lm="git checkout main && git pull"
alias gp="git pull && git push"
alias gprune="git fetch --prune"
alias gpf="git push --force-with-lease"
alias ulc="git reset --soft HEAD~1"
alias gst="git stash"
alias pop="git stash pop"
alias gstapp="git stash apply"
alias gdn="git diff --name-only"

# --- Docker ---
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias diprune="docker image prune -a"

# --- pnpm ---
alias nrd="pnpm run dev"
alias nrb="pnpm run build"
alias ni="pnpm install"
alias nu="pnpm uninstall"
alias nr="pnpm run"
alias nrp="pnpm run prisma:studio"
alias nrt="pnpm run test"

# --- macOS ---
alias port="lsof -i"
alias stop="kill -9"

# --- Shell ---
alias openz="code ~/.zshrc"
alias sourcez="source ~/.zshrc"

# --- PHP / Laravel Sail ---
(( $+commands[phpstorm] )) || alias phpstorm='/Applications/PhpStorm.app/Contents/MacOS/phpstorm'
alias phps='phpstorm'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias stp="sail artisan test -p"
alias srvs="sail artisan reverb:start"
alias shor="sail artisan horizon"
alias shqu="sail artisan queue:work"
alias smig="sail artisan migrate"
alias smigs="sail artisan migrate:fresh --seed"
alias fresh-="sail artisan migrate:fresh --seed"
