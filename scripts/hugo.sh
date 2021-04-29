#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root=$(realpath "$script_dir/..")
echo "$project_root"

docker run \
    --rm \
    -it \
    -u "$(id -u):$(id -g)" \
    -v "$project_root:/src" \
    -p "1313:1313" \
    klakegg/hugo:latest-ext \
    "$@"
