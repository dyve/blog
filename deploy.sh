#!/usr/bin/env bash
rm -rf ./public
hugo
rsync -avz --delete ./public/ dylan@box.dylanverheul.com:/home/user-data/www/dyve.net/
