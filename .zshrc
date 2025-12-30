
neofetch
source <(fzf --zsh)

alias fzff="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

PROMPT='%F{cyan}%*%f %F{green}%n%f %F{blue}%~%f $ '

eval "$(rbenv init -)"
export PATH="$HOME/.local/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1
