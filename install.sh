#!/bin/bash
DOTPATH=~/dotfiles

git submodule init
git submodule update

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
