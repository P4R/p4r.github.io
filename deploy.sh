#!/bin/bash
set -e # exit with nonzero exit code if anything fails

gem install bundler
bundle install

# run commands to build the website in the out folder
npm install -g gulp bower && npm install && bower install
gulp

# go to the out directory and create a *new* Git repo
cd dist
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "p4r.esp@gmail.com"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy".
git add .
git commit -m "Deploy "

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@github.com/P4R/p4r.github.io.git" master:gh-pages > /dev/null 2>&1