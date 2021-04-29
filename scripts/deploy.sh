#!/bin/bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$script_dir/.."
public_dir="$project_dir/public"

theme=$(sed -r -e '/theme: */! d' -e 's/theme: *//' "$project_dir/config.yaml")
theme_path="$project_dir/themes/$theme"
export PATH="$theme_path/node_modules/.bin:$PATH"

printf "Deploying updates to GitHub...\n"

# Clean public
rm -rf $public_dir/categories
rm -rf $public_dir/css
rm -rf $public_dir/posts
rm -rf $public_dir/tags
rm -f ../public/index.*
rm -f ../public/*.html
rm -f ../public/*.xml

# Build the project.
"$script_dir/hugo.sh" -e production --minify

# Go To Public folder
cd $public_dir

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]
then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
