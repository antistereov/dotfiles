if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f /home/linuxbrew/.linuxbrew/bin/brew
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Configure GPG
set GPG_TTY $(tty)
# Disable fish greeting
set fish_greeting ""
# Disable brew hints
set HOMEBREW_NO_ENV_HINTS 1

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
alias ll "eza -l --icons --git --group-directories-first"
alias ls eza

for f in ~/.config/fish/functions/user/*.fish
    source $f
end

for f in ~/.config/fish/completions/user/*.fish
    source $f
end

# Enable starship
starship init fish | source

fastfetch
