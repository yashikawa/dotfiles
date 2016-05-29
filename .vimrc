" dein settings {{{
if &compatible
    set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(expand(s:dein_dir))

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " 管理するプラグインを記述したファイル
    let s:toml = '~/.dein.toml'
    let s:lazy_toml = '~/.dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    
    call dein#end()
    call dein#save_state()
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

" }}}

" メッセージを英語にする
language C

" Python3 サポートを有効にする
let g:python3_host_prog = expand('$ANYENV_ROOT') . '/envs/pyenv/shims/python'

" Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

" delete keyを有効にする
set backspace=indent,eol,start

" clipboard連携を有効にする
if has('nvim')
    set clipboard+=unnamedplus
else
    set clipboard=unnamed
end

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
syntax enable

" 以下カスタム設定
" colorschemeをsolarizedにする
set background=dark
colorscheme solarized

" エラーメッセージの表示時にビープを鳴らさない
set visualbell
set noerrorbells

" line
set number

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" escape insert mode
inoremap <silent> jj <ESC>

vnoremap <C-[> <ESC>

