for f in ~/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done

if [[ -f ~/.zplug/init.zsh ]]; then
    source ~/.zplug/init.zsh
    export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi
    zplug load --verbose
fi
