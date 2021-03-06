#!/bin/sh
# ./deploy.sh "optional commit message here"
# if command fails then deploy stops:
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# build project
hugo

# goto public folder
cd public

# add changes to git 
git add .

# commit changes

msg="rebuilding site $(date)"
if [-n "$s"]; then
	msg="$*"
fi 
git commit -m "$msg"

# push source and build repos
git push origin master

