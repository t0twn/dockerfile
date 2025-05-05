#!/bin/bash

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <CMD> [CMD_ARGS...]"
    exit 1
fi

CMD="$1"
ENV_PREFIX="${CMD}_"
shift

ARGS=()

# Collect matching environment variables
while IFS='=' read -r name value; do
    if [[ "$name" == ${ENV_PREFIX}* ]]; then
        arg_name="${name#$ENV_PREFIX}"      # Remove prefix
        arg_name="${arg_name,,}"            # To lowercase
        arg_name="${arg_name//_/-}"         # Replace _ with -
        ARGS+=( "--${arg_name}" "$value" )
    fi
done < <(env)

# Run the command with arguments
"$CMD" "${ARGS[@]}" "$@"
