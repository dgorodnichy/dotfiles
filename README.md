# dotfiles

Управляются через [chezmoi](https://chezmoi.io).

## Быстрый старт

### macOS

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Bitwarden (SSH ключи для доступа к GitHub)
brew install --cask bitwarden
# открыть Bitwarden → залогиниться → включить SSH агент в настройках
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
ssh-add -l

brew install chezmoi
chezmoi init --apply git@github.com:dgorodnichy/dotfiles.git
```

После `chezmoi init --apply` скрипт сам установит все пакеты: neovim, oh-my-zsh, плагины, тему, тулзы.

### Ubuntu

```bash
sudo apt update && sudo apt install -y curl git zsh
sudo apt install -y chezmoi
chezmoi init --apply git@github.com:dgorodnichy/dotfiles.git
```

> На Ubuntu скрипт установит всё через apt, часть пакетов — через бинарники и GitHub релизы.

## Что под管理лением

### Конфиги
| Что | Куда |
|-----|------|
| `.zshrc` | `~/.zshrc` |
| `.gitconfig` | `~/.gitconfig` |
| `.gitignore` | `~/.gitignore` |
| `p10k.zsh` | `~/.p10k.zsh` |
| `ghostty` | `~/.config/ghostty/config` |
| `nvim` | `~/.config/nvim/` |
| `btop` | `~/.config/btop/btop.conf` |
| `mc` | `~/.config/mc/ini` |
| `neofetch` | `~/.config/neofetch/config.conf` |
| `opencode` | `~/.config/opencode/opencode.json` |

### Пакеты

**macOS (Homebrew):**
- git, lazygit, neovim, ripgrep, fd, fzf, ast-grep, tree-sitter
- curl, wget, the_silver_searcher, node, pyenv, rbenv, ruby-build, go
- k6, k9s, lazyssh, sops, mc, speedtest-cli, imagemagick, zsh-completions
- ghostty, obsidian, bitwarden, font-comic-shanns-mono-nerd-font

**Ubuntu (apt + бинарники):**
- git, neovim, ripgrep, fd-find, fzf, silversearcher-ag, curl, wget
- nodejs, npm, golang-go, mc, speedtest-cli, imagemagick, zsh, zsh-completions
- lazygit, ast-grep, tree-sitter, k6, k9s, lazyssh, sops
- pyenv, rbenv, ruby-build, obsidian, bitwarden

## Как обслуживать

```bash
# Добавить новый конфиг
chezmoi add ~/.gitconfig

# Посмотреть что изменится
chezmoi diff

# Применить изменения
chezmoi apply

# Закоммитить и запушить
cd ~/.local/share/chezmoi
git add -A
git commit -m "что-то поменял"
git push
```

## Структура репозитория

```
.
├── dot_zshrc                                    → ~/.zshrc
├── dot_gitconfig                                → ~/.gitconfig
├── dot_gitignore                                → ~/.gitignore
├── dot_p10k.zsh                                 → ~/.p10k.zsh
├── dot_config/ghostty/config                    → ~/.config/ghostty/config
├── dot_config/nvim/                             → ~/.config/nvim/
├── dot_config/btop/btop.conf                    → ~/.config/btop/btop.conf
├── dot_config/private_mc/ini                    → ~/.config/mc/ini
├── dot_config/neofetch/config.conf              → ~/.config/neofetch/config.conf
├── dot_config/opencode/private_opencode.json    → ~/.config/opencode/opencode.json
├── dot_config/opencode/tui.json                 → ~/.config/opencode/tui.json
├── run_onchange_before_02-install-packages.sh   → скрипт установки пакетов
└── .chezmoiignore                               → исключения для chezmoi
```
