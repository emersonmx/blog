#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# If a command fails then the deploy stops
set -e

printf "Deploying updates to GitHub...\n"

# Build the project.
hugo

# Go To Public folder
cd $script_dir/../public

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
