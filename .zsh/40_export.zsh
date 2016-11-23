# environment
export LANG=en_US.UTF-8

# for Homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# for apache
export PATH=/usr/local/Cellar/httpd/2.2.26/sbin:$PATH

# for go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# for NeoVim
export XDG_CONFIG_HOME=$HOME/.config

# for anyenv
export ANYENV_ROOT=$HOME/.anyenv

# for php5.4
#export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

# for npm
export PATH=$PATH:`npm bin -g`
