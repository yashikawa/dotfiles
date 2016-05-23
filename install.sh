#!/bin/bash
DOTPATH=~/dotfiles

git submodule init
git submodule update

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snv "$DOTPATH/$f" "$HOME/$f"
done

[ ! -d $HOME/.tmux ] && git clone git@github.com:tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm
