# Portable shell setup, sourced from ~/.bashrc (and ~/.zshrc on macOS) by one line that
# chezmoi adds on first apply. Machine-specific things (kubeconfigs, work CLIs) stay in those
# files, not here.

_prepend_path() { case ":$PATH:" in *":$1:"*) ;; *) [ -d "$1" ] && PATH="$1:$PATH" ;; esac; }
_prepend_path "$HOME/bin"
_prepend_path "$HOME/.local/bin"
_prepend_path "$HOME/.local/share/mise/shims"
export PATH
unset -f _prepend_path

# Kubernetes shortcuts
alias kx='kubectx'
alias kn='kubens'
alias kt='kubetail'
