#!/bin/bash
# git checkout `git branch | fzf | tr -d "[:space:]"`

branch=`git branch | fzf | tr -d "*"`

if [[ -z $branch ]]; then
    exit 0
fi

git checkout $branch
