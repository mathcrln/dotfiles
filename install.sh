#!/bin/zsh

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# =====================================================
# Dotfiles Installer
# Creates symlinks from this repo to your home directory
# =====================================================

echo "Linking dotfiles from $DOTFILES..."

# =====================================================
# ZSH
# =====================================================

ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.zsh" "$HOME/.zsh"

# =====================================================
# STARSHIP (prompt)
# =====================================================

mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# =====================================================
# GIT
# =====================================================

# ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
# ln -sf "$DOTFILES/git/.gitignore_global" "$HOME/.gitignore_global"

# =====================================================
# GHOSTTY (terminal)
# =====================================================

mkdir -p "$HOME/.config/ghostty"
ln -sf "$DOTFILES/ghostty/themes" "$HOME/.config/ghostty/themes"

# =====================================================
# ZED (editor)
# =====================================================

mkdir -p "$HOME/.config/zed"
ln -sf "$DOTFILES/zed/keymap.json" "$HOME/.config/zed/keymap.json"

# =====================================================
# DONE
# =====================================================

echo ""
echo "Done! Run 'source ~/.zshrc' or open a new shell to apply changes."
