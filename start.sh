#!/bin/ash

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <CMD> [CMD_ARGS...]"
    exit 1
fi

to_lower_dash() { echo $1 | tr 'A-Z' 'a-z' | tr '-' '_'; }

CMD="$1"
ENV_PREFIX="$(to_lower_dash $CMD)_"
shift

ARGS=""
# Collect matching environment variables
while IFS='=' read -r name value; do
    if [[ "$(to_lower_dash $name)" == ${ENV_PREFIX}* ]]; then
        arg_name="${name#$ENV_PREFIX}"           # Remove prefix
        arg_name="$(to_lower_dash $arg_name)"    # To lowercase dash
        ARGS="$ARGS --$arg_name $value"
    fi
done < <(env)

# Run the command with arguments
eval "$CMD $ARGS $*"
