function ksecret
    set -l namespace ""
    set -l secret_name ""
    
    # Manuelles Argument-Parsen
    while set -q argv[1]
        switch $argv[1]
            case -n
                if not set -q argv[2]
                    echo "Error: Missing namespace after -n" >&2
                    return 1
                end
                set namespace $argv[2]
                set argv $argv[3..-1]
            case --help -h
                echo "Usage: ksecret <secret-name> [-n <namespace>]"
                return 0
            case '*'
                if test -z "$secret_name"
                    set secret_name $argv[1]
                    set argv $argv[2..-1]
                else
                    echo "Error: Unknown argument $argv[1]" >&2
                    return 1
                end
        end
    end

    if test -z "$secret_name"
        echo "Error: secret name is required" >&2
        return 1
    end

    if test -n "$namespace"
        if not kubectl get namespace "$namespace" > /dev/null 2>&1
            echo "Error: Namespace '$namespace' does not exist" >&2
            return 1
        end
        kubectl get secret $secret_name -n $namespace -o json | jq -r '
            .data | to_entries[] | "\(.key): \(.value | @base64d)"
        '
    else
        kubectl get secret $secret_name -o json | jq -r '
            .data | to_entries[] | "\(.key): \(.value | @base64d)"
        '
    end
end

