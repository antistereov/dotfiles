# Vervollständige Secret-Namen aus aktuellem oder gegebenem Namespace
function __ksecret_list_secrets
    set -l ns (commandline -opc | grep -oE '\-n\s+\S+' | awk '{print $2}')
    if test -n "$ns"
        kubectl get secrets -n $ns -o json | jq -r '.items[].metadata.name'
    else
        kubectl get secrets -o json | jq -r '.items[].metadata.name'
    end
end

# Vervollständige Namespace-Namen
function __ksecret_list_namespaces
    kubectl get ns -o json | jq -r '.items[].metadata.name'
end

# Vervollständigung für secret-name (erstes Argument)
complete -c ksecret -n '__fish_use_subcommand' -a '(__ksecret_list_secrets)' -f -d "Secret name"

# Vervollständigung für -n (Namespace-Flag)
complete -c ksecret -s n -l namespace -x -a '(__ksecret_list_namespaces)' -d "Namespace"

