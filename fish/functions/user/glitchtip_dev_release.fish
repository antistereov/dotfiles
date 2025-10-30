function glitchtip_dev_release
    set -l project_id $argv[1]

    if test -z $project_id
        echo "Usage: glitchtip_dev_release <PROJECT_ID> <DIST_DIRECTORY>"
        echo "Example: glitchtip_dev_release stereov-io"
        return 1
    end

    set -l missing_vars
    if test -z $SENTRY_ORG
        set missing_vars $missing_vars SENTRY_ORG
    end
    if test -z $SENTRY_URL
        set missing_vars $missing_vars SENTRY_URL
    end
    if test -z $SENTRY_AUTH_TOKEN
        set missing_vars $missing_vars SENTRY_AUTH_TOKEN
    end

    if test (count $missing_vars) -gt 0
        echo "❌ Error: Please set the following environment variables: $missing_vars"
        return 1
    end
    echo "✅ Environment variables are set. Starting build."

    echo "   ... Creating sentry build for project: $project_id"
    npx nx run $project_id:build:production-sentry || return 1

    set -l release_name development
    set -l dist_path "./dist/apps/$project_id/browser"

    if not test -d $dist_path
        echo "❌ Error: The build directory $dist_path does not exist. Please make sure that you are at the project's root."
        return 1
    else
        set -l map_files (find $dist_path -name "*.js.map")

        if test (count $map_files) -eq 0
            echo "❌ Error: No *.js.map-files found in the build directory."
            return 1
        end
    end
    echo "✅ $(count $map_files) source map files found. Starting release process."

    echo "   ... Creating 'development' release for project: $project_id"

    set -l release_name development

    npx sentry-cli releases new $release_name \
        --org $SENTRY_ORG \
        --project $project_id \
        --url $SENTRY_URL \
        || return 1

    echo "   ... Injecting debug IDs and uploading source maps"
    npx sentry-cli sourcemaps inject $dist_path \
        --org $SENTRY_ORG \
        --project $project_id \
        --release $release_name \
        || return 1

    npx sentry-cli sourcemaps upload $dist_path \
        --org $SENTRY_ORG \
        --project $project_id \
        --release $release_name \
        || return 1

    echo "   ... Fianlizing release"
    npx sentry-cli releases finalize $release_name \
        --org $SENTRY_ORG \
        --project $project_id \
        --url $SENTRY_URL \
        || return 1

    echo "🎉 '$release_name' release for '$project_id' created successfully."
end
