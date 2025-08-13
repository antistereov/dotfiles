if status is-interactive
    # Commands to run in interactive sessions can go here
end

set GPG_TTY $(tty)
set fish_greeting ""

# Docker
alias dc="docker compose"
alias dl="docker logs"
alias de="docker exec"
alias dps="docker ps --format 'table {{.Names}}\t{{printf \"%-20s\" .Status}}'"

# Kubernetes
alias k kubectl
alias kn "kubectl config set-context --current --namespace"

# Enable zoxide
zoxide init fish | source

# Improve utilities
alias rm "trash -v"
alias ll "eza -l"
alias ls "eza"

for f in ~/.config/fish/functions/user/*.fish
    source $f
end

for f in ~/.config/fish/completions/user/*.fish
    source $f
end

# Enable starship
starship init fish | source

