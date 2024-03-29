#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$script_dir/.."

theme=$(sed -r -e '/theme: */! d' -e 's/theme: *//' "$project_dir/config.yaml")
theme_path="$project_dir/themes/$theme"
export PATH="$theme_path/node_modules/.bin:$PATH"

cd $project_dir

"$script_dir/hugo.sh" server -D $@
