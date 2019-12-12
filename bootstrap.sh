#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
git submodule update --init

function copyDots() {
	rsync --exclude ".git/" \
              --exclude ".DS_Store" \
              --exclude ".osx" \
	      --exclude "bootstrap.sh" \
	      -avh . ~;
	source ~/.bashrc;
}

read -p "This will overwrite existing files in your home directory. Are you sure? (y/N) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	copyDots;
fi;
