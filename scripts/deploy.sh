#!/bin/bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
public_dir="$script_dir/../public"

printf "Deploying updates to GitHub...\n"

# Clean public
rm -rf $public_dir/categories
rm -rf $public_dir/css
rm -rf $public_dir/posts
rm -rf $public_dir/tags
rm -f ../public/index.*
rm -f ../public/sitemap.xml

# Build the project.
hugo -e production

# Go To Public folder
cd $public_dir

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
