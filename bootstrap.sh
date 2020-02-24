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
	copyDots
        cd ~/.oracle
        find /usr/lib/oracle -type d -name bin -exec ln -sf {} bin \;
        find /usr/lib/oracle -type d -name lib -exec ln -sf {} lib \;
        [ -d rdbms ] || mkdir rdbms; cd rdbms
        find /usr/include/oracle -type d -name client64 -exec ln -sf {} public \;
fi;
