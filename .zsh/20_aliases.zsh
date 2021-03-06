### Common aliases
alias ls='gls --color=always'    # Set color when using ls
alias ld='ls -ld'                # Show info about the directory
alias lla='ls -lAF'              # Show hidden all files
alias llal="ls -lAF | grep '^l'" # Show hidden all symbolic links
alias ll='ls -lF'                # Show long file information
alias lll="ls -lF | grep '^l'"   # Show symbolic links
alias la='ls -AF'                # Show hidden files
alias lx='ls -lXB'               # Sort by extension
alias lk='ls -lSr'               # Sort by size, biggest last
alias lc='ls -ltcr'              # Sort by and show change time, most recent last
alias lu='ls -ltur'              # Sort by and show access time, most recent last
alias lt='ls -ltr'               # Sort by date, most recent last
alias lr='ls -lR'                # Recursive ls

alias mkdir='mkdir -p'

autoload -Uz zmv
alias zmv='noglob zmv -W'

alias du='du -h'
alias job='jobs -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cdu='cd-gitroot'
alias gn='git now'
alias aw=anyframe-widget-select-widget

alias v=nvim
#alias vim=nvim

# for Homebrew doctor warning
alias brew="env PATH=${PATH//(${HOME}\/.anyenv\/envs\/phpenv\/shims:|${HOME}\/.anyenv\/envs\/pyenv\/shims:)/} brew"
#alias brew="env PATH=${PATH/\/Users\/ishikawa\/.phpenv\/shims:/} brew"

### Global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc'
alias -g X='| xargs'
alias -g F='| "$(available $INTERACTIVE_FILTER)"'
alias -g S="| sort"
alias -g V="| tovim"
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"

