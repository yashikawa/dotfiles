# 色を使用出来るようにする
autoload -Uz colors
colors
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# %n - ユーザ名を表示
# %m - マシン名を表示
#PROMPT="%{${fg[yellow]}%}[%m]%{${reset_color}%} %~ %# "

# oh-my-zshのgit plugin用
ZSH_THEME_GIT_PROMPT_DIRTY='*'

# タイプセット
# 重複パスを登録しない
typeset -U path cdpath fpath manpath

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

### 色設定
if [ -f ~/.dircolors ]; then
    eval $(gdircolors ~/.dircolors)
fi

### 補完 ###
# 補完機能を有効にする
autoload -Uz compinit
compinit

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# cd-gitrootを使えるようにする
autoload -Uz cd-gitroot

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
