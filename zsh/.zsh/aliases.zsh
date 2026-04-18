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
alias gsa="git stash apply"
alias gdn="git diff --name-only"
alias nah="git reset --hard && git clean -df"
alias gwhen="git log -S"
alias glog="git log --oneline --graph --decorate -20"

# --- Docker ---
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"
alias dce="docker compose exec"
alias diprune="docker image prune -a"

# --- pnpm ---
alias nrd="pnpm run dev"
alias nrb="pnpm run build"
alias nrp="pnpm run preview"
alias ni="pnpm install"
alias nu="pnpm uninstall"
alias nr="pnpm run"
alias nrt="pnpm run test"

# --- macOS ---
alias port="lsof -i"
alias stop="kill -9"

# --- Shell ---
alias openz="code ~/.zshrc"
alias sourcez="source ~/.zshrc"
alias editf="code ~/.zsh/functions.zsh"
alias edita="code ~/.zsh/aliases.zsh"
alias hs="grep $HISTFILE -e"


# --- PHP / Laravel Sail ---
(( $+commands[phpstorm] )) || alias phpstorm='/Applications/PhpStorm.app/Contents/MacOS/phpstorm'
alias phps='phpstorm'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias sa="sail artisan"
alias sci="sail composer install"
alias scu="sail composer update"
alias sd="sail composer dev"
alias stp="sail artisan test -p"
alias spi="sail pnpm i"
alias spid="sail pnpm i -D"
alias srd="sail pnpm dev"
alias srb="sail pnpm build"
alias srs="sail artisan reverb:start"
alias shor="sail artisan horizon"
alias sq="sail artisan queue:work"
alias smig="sail artisan migrate"
alias fresh="sail artisan migrate:fresh"
alias fresh-="sail artisan migrate:fresh --seed"
alias ss="sail shell"
alias sdb="sail mysql"
alias sr="sail artisan route:list"
alias scc="sail artisan config:clear && sail artisan cache:clear"
alias sop="sail artisan optimize:clear"

# --- macOS ---
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ip="curl ifconfig.me"            # public IP
alias hosts="sudo code /etc/hosts"
