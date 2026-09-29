#!/usr/bin/env bash
# Bootstrap for Linux, WSL and macOS:
#   curl -fsSL https://raw.githubusercontent.com/somaliz/dotfiles/master/install.sh | bash
# Installs the tools, pulls this repo with chezmoi, shows what would change, then asks before applying.
set -euo pipefail
export PATH="$HOME/.local/bin:$PATH"

case "$(uname -s)" in
  Linux)
    if command -v apt-get >/dev/null; then
      sudo apt-get update -qq
      sudo apt-get install -y git curl jq python3
    fi ;;
  Darwin)
    command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
    brew install chezmoi jq ;;
esac

command -v herdr >/dev/null || curl -fsSL https://herdr.dev/install.sh | sh
command -v chezmoi >/dev/null || sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin"

chezmoi init somaliz
echo; echo "Files chezmoi would create or change:"; chezmoi status || true
read -r -p "Apply now? Existing files listed above get replaced. [y/N] " ok < /dev/tty
[[ $ok =~ ^[Yy]$ ]] && chezmoi apply -v || echo "Not applied. Review with: chezmoi diff   then: chezmoi apply"
