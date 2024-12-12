#!/bin/bash
set -e

echo "Initializing the environment..."

if [ "$#" -gt 0 ]; then
    echo "Executing command: $@"
    exec "$@"
else
    echo "Starting interactive bash shell..."
    exec bash
fi
