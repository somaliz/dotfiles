fpath=($fpath ~/.zsh/completion)
GPG_TTY=$(tty)
export GPG_TTY
export ZSH=$HOME/.oh-my-zsh
alias exp=nautilus
export GOPATH=$HOME/go
alias loggit="git log --oneline --decorate --all --graph"
ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13

export DEFAULT_USER="$(whoami)"
plugins=(
git
kubectl
kubetail
zsh-kubectl-prompt
zsh-completions
extract
aws
wd
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

export RPROMPT='%{$fg[yellow]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
#if [ /usr/local/bin/kops ]; then source <(kops completion zsh); fi
# if [ /usr/local/bin/velero ]; then source <(velero completion zsh); fi
#source ~/powerlevel10k/powerlevel10k.zsh-theme
#source /home/suleiman/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export PATH=$PATH:/home/suleiman/go/bin

# Aliasses

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


