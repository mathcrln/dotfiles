# Dotfiles

Declarative macOS dev environment via Nix + Home Manager.

## Fresh machine

One command — installs Nix, enables flakes, clones this repo to
`~/Developer/dotfiles`, and builds + activates the whole environment:

```bash
curl -fsSL https://raw.githubusercontent.com/mathcrln/dotfiles/main/scripts/bootstrap.sh | bash
```

Then install the GUI apps (see bottom). That's it.

## Daily use

Edit any file in `modules/` or `configs/`, then:

```bash
home-manager switch --flake ~/Developer/dotfiles
```

> **Don't edit `~/.zshrc` directly.** Home Manager generates it (a symlink into
> the nix store) and overwrites it on every `switch`. Aliases live in
> `modules/shell.nix`, shell functions in `configs/functions.zsh`.

## Structure

- `flake.nix` / `flake.lock` — pinned nixpkgs + home-manager; the entry the flake builds
- `home.nix` — home-manager config root, imports modules
- `modules/` — Nix-managed config (packages, programs, settings)
- `configs/` — raw config files for tools that want them (TOML, JSON, etc.)
- `scripts/bootstrap.sh` — fresh-machine install (one command)

> GUI apps (OrbStack, MacWhisper, MonitorControl, 1Password) are installed
> manually via their own installers — Nix doesn't manage macOS `.app` bundles.
