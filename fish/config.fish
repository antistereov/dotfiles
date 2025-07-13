eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias dc="docker compose"
alias dl="docker logs"
alias de="docker exec"
alias dps="docker ps --format 'table {{.Names}}\t{{printf \"%-20s\" .Status}}'"
alias k kubectl
alias kn "kubectl config set-context --current --namespace"

# Enable zoxide 
zoxide init fish | source
