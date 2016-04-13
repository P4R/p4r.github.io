#!/bin/bash
set -e # exit with nonzero exit code if anything fails

gem install bundler
bundle install

# Add source from master branch
git clone https://github.com/P4R/p4r.github.io.git -b master dist

# Run commands to build the website in the dist folder
npm install -g gulp bower && npm install && bower install
gulp

# Go to the dist directory.
cd dist

# Inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "p4r.esp@gmail.com"

# Add changes and commit.
git add .
git commit -m "Deploy with Travis CI"

# Push from the current repo's master branch to the remote
# repo's master branch. We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --quiet "https://${GH_TOKEN}@github.com/P4R/p4r.github.io.git" master > /dev/null 2>&1