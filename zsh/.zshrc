# top
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

# =====================================================
#  PLUGINS
# =====================================================

ZSH_THEME="robbyrussell"
plugins=(git)
source <(fzf --zsh)

# --- Tools & Environment ---
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
