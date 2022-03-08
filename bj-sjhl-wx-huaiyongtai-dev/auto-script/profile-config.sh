#!/bin/bash

rsync -avz --delete ~/.vimrc ~/profile-config/$USER/vimrc
rsync -avz --delete --exclude "*.swp*" ~/.vim/UltiSnips ~/profile-config/$USER
#rsync -avz --delete ~/.vim/UltiSnips ~/profile-config/$USER

cd ~/profile-config

git add --all .
git rm -r *.swp
git commit -m "auto sync"
git push origin master

