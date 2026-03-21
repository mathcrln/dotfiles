# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# --- Amazon Q pre block ---

# =====================================================
# CUSTOM CONFIG
# =====================================================

# --- Custom configs ---
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

# --- PATHs ---
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# --- Tools & Environment ---
eval "$(starship init zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- Amazon Q post block ---
eval "$(zoxide init --cmd cd zsh)"
# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"
# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
