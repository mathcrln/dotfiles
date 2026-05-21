# Dotfiles

Declarative macOS dev environment via Nix + Home Manager.

## Fresh machine

One command — installs Nix, enables flakes, clones this repo to
`~/Developer/dotfiles`, and builds + activates the whole environment:

```bash
curl -fsSL https://raw.githubusercontent.com/mathcrln/dotfiles/main/scripts/bootstrap.sh | bash
```

Then install the GUI apps (see bottom). That's it.

## Existing machine (first activation)

If Nix, Home Manager, and this repo are already present (i.e. you're migrating,
not starting fresh), skip `bootstrap.sh` and just activate the config once:

```bash
# -b pre-hm backs up any pre-existing files (e.g. an old ~/.zshrc) to *.pre-hm
home-manager switch -b pre-hm --flake ~/Developer/dotfiles#mathcrln
```

Verify, then delete the `*.pre-hm` backups once happy. To roll back:
`home-manager generations` and activate a previous one.

## Daily use

Edit a file in the repo, then apply:

```bash
home-manager switch --flake ~/Developer/dotfiles
```

> **Never edit `~/.zshrc` directly.** Home Manager generates it (a symlink into
> the nix store) and overwrites it on every `switch`.

### Where to change things

| Want to change… | Edit this | Example |
| --- | --- | --- |
| Shell aliases | `modules/shell.nix` → `shellAliases` | `gs = "git status";` |
| Shell functions | `configs/functions.zsh` (inlined verbatim) | add a new `foo() { ... }` |
| CLI packages | `modules/packages.nix` → `home.packages` | add `jq` to the list |
| Tools w/ shell init | `modules/tools.nix` | fzf, zoxide, ripgrep, gh |
| Prompt | `configs/starship.toml` | edit TOML directly |
| Git config | `modules/git.nix` | aliases, user, ignores |
| Env vars / PATH | `home.nix` → `sessionVariables` / `sessionPath` | `EDITOR`, PNPM_HOME |
| Editor/app config | `configs/` + `home.file` in `home.nix` | zed keymap, VS Code settings |

After any edit: `home-manager switch --flake ~/Developer/dotfiles`, then open a
new shell. Find a package name with `nix search nixpkgs <name>`.

To update everything to the latest pinned versions:
`nix flake update` (in the repo) then `home-manager switch …`.

## Structure

- `flake.nix` / `flake.lock` — pinned nixpkgs + home-manager; the entry the flake builds
- `home.nix` — home-manager config root, imports modules
- `modules/` — Nix-managed config (packages, programs, settings)
- `configs/` — raw config files for tools that want them (TOML, JSON, etc.)
- `scripts/bootstrap.sh` — fresh-machine install (one command)

> GUI apps (OrbStack, MacWhisper, MonitorControl, 1Password) are installed
> manually via their own installers — Nix doesn't manage macOS `.app` bundles.
