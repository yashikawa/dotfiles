# for rbenv
#if [ -e $HOME/.rbenv ]; then
#    export PATH=$HOME/.rbenv/bin:$PATH
#    eval "$(rbenv init - --no-rehash)"
#fi

# for phpenv
#if [ -e $HOME/.phpenv ]; then
#    export PATH=$HOME/.phpenv/bin:$PATH
#    eval "$(phpenv init - --no-rehash)"
#fi    

# for nodebrew
#if [[ -f ~/.nodebrew/nodebrew ]]; then
#  export PATH=$HOME/.nodebrew/current/bin:$PATH
#  nodebrew use v0.12.0
#fi             

# for anyanv
if [ -d $HOME/.anyenv ] ; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init - --no-rehash)"
#    for D in `ls $HOME/.anyenv/envs`
#    do
#        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
#    done
fi
