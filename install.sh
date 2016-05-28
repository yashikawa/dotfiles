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

_ANYENV_ROOT=$HOME/.anyenv
if [ ! -d $HOME/.anyenv ] ; then
    git clone git@github.com:riywo/anyenv.git $_ANYENV_ROOT
    git clone git@github.com:znz/anyenv-update.git $_ANYENV_ROOT/plugins/anyenv-update
    git clone git@github.com:znz/anyenv-git.git $_ANYENV_ROOT/.anyenv/plugins/anyenv-git
    export PATH="$HOME/.anyenv/bin:$PATH"
    anyenv init -
fi

function install_env () {

    [[ ! -d $_ANYENV_ROOT ]] && return

    local _ENV=$1
    local _ENV_ROOT=$_ANYENV_ROOT/envs/$_ENV
    if [ ! -d $_ENV_ROOT ] ; then
        echo "Install $_ENV? [y/N]"
        read ANSWER
        #case `echo $ANSWER | tr y Y` in
        case `echo $ANSWER | tr y Y` in
            "" | Y* )
                anyenv install $_ENV
                export PATH="$_ENV_ROOT/bin:$PATH"
                # Set environment variable. ex: PYENV_ROOT
                export `echo $_ENV | tr '[a-z]' '[A-Z]'`_ROOT="$_ENV_ROOT"
                $_ENV init -
                ;;
            *)
                ;;
        esac
    fi
}

function install_versions () {

    local _ENV=$1
    local _ENV_ROOT=$_ANYENV_ROOT/envs/$_ENV

    [[ ! -d $_ENV_ROOT ]] && return

    if ! ls $_ENV_ROOT/versions/* > /dev/null 2>&1 ; then
        while :
        do
            echo "$_ENV: Which version install?
if you want to check versions, Type 'list'.
if want to install later, Type 'later'"
            read ANSWER
            case $ANSWER in
                list )
                    $_ENV install --list && continue;;
                later )
                    break;;
                * )
                    $_ENV install $ANSWER || continue
                    $_ENV global $ANSWER
                    break;;
            esac
        done
    fi
}

function install_envs () {

    eval local -a _envs=$1
    for _env in ${_envs[@]}
    do
        install_env $_env
    done

    if ! ls $_ANYENV_ROOT/envs/* > /dev/null 2>&1 ; then
        return
    fi

    anyenv update

    for _env in ${_envs[@]}
    do
        install_versions $_env
    done

}

install_envs "(pyenv phpenv)"
