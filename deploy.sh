#!/bin/bash

echo -e "\033[0;32mDeploying updates to AppEngine...\033[0m"

rm -rf build
# Build the project.
polymer build

cp app.yaml build/unbundled
cp start.go build/unbundled

cd build/unbundled

# Generate http2_push_manifest
#http2preload-manifest -i index.html -o preload.json

# Add changes to git.
# git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
# git commit -m "$msg"

# Push source
# git push origin master

# version="$(date -u +"%Y%m%d-%H%M%S")"
version="prpl"

# Deploy to AppEngine
goapp deploy -application=pomoves -version=$version .
