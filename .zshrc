DOTPATH="$HOME/dotfiles"

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

PERCOL="peco"

# Autostart tmux
if [[ ! -n $TMUX ]]; then
    # get the IDs
    ID="`tmux list-sessions`"
    if [[ -z "$ID" ]]; then
        tmux new-session && exit
    fi
    create_new_session="Create New Session"
    ID="$ID\n${create_new_session}:"
    ID="`echo $ID | $PERCOL | cut -d: -f1`"
    if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session && exit
    elif [[ -n "$ID" ]]; then
        tmux attach-session -t "$ID" && exit
    else
        :  # Start terminal normally
    fi
fi