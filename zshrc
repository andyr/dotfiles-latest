if [[ -o login && -d ~/.dotfiles/.git ]]; then
    autoload -U colors && colors
    echo -n " $fg[green]∵$fg_reset "
    GIT_DIR=~/.dotfiles/.git git log --pretty=format:'%C(yellow)%h %C(red)%ad %C(reset)%s' --date=short 2>/dev/null | head -1
fi
function dotupdate() {
    GIT_DIR=~/.dotfiles/.git git pull --ff-only
    upgrade_oh_my_zsh
}

alias tmux="TERM=screen-256color-bce tmux"
alias less="less -X -F"

alias sha1sum="openssl dgst -sha1"
alias md5sum="openssl dgst -md5"

alias pf='ps auxf'
alias findp='find . -name \*.py'
alias findj='find . -name \*.java'
alias untar='tar -xvf'      # .tar
alias untargz='tar -xzvf'    # .tar.gz
alias untarbz2='tar -xjvf'   # .tar.bz2

function ff() { find . -name '*'$1'*' ; }
function ffi() { find . -type f -not -name '*.pyc' -name '*'$1'*' ; } # ignore .pyc files; make this more generic
#function gg() { grep -HnIr "$1" . ; }
function ggg() { grep -HnIr "$1" . ; }
function ggi() { grep -HnIir "$1" . ; }
function giod() { grep -Hnr --exclude-dir={dist,node_modules,vendor,prototype} "$1" . ; }
function lport() { lsof -n -i4TCP:$1 | grep LISTEN ; }

function install_nose() {
    cd test/nose/;
    python 'setup.py' install --prefix=~/.virtualenvs/$1;
    cd ../..;
}
alias run_nose="python `which nosetests`"

# Keychain
#==========
#eval `keychain --eval --agents ssh id_rsa`

# Generate keys with:
# ssh-keygen -t rsa -C "your_email@example.com"

#mount
# sshfs name@server:/path/to/folder /path/to/mount/point
# fusermount -u  /path/to/mount/point

# The use_env call below is a reusable command to activate/create a new Python
# # virtualenv, requiring only a single declarative line of code in your .env
# files.
# # It only performs an action if the requested virtualenv is not the current
# one.
use_env() {
  typeset venv
  venv="$1"
  if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
    if workon | grep -q "$venv"; then
      workon "$venv"
    else
      echo -n "Create virtualenv $venv now? (Yn) "
      read answer
      if [[ "$answer" == "Y" ]]; then
        mkvirtualenv "$venv"
      fi
    fi
  fi
}


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wadey"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_VENV_CD="1"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git brew osx mvn rbenv golang virtualenvwrapper autoenv knife rsync urltools screen)
plugins=(brew osx mvn rbenv golang virtualenvwrapper autoenv knife rsync urltools screen)

ZSH_CUSTOM=~/.zsh

path=(~/bin ~/.dotfiles/bin /usr/local/bin $path)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)

if [[ -f "$HOME/.zshlocal" ]]; then
    source $HOME/.zshlocal
fi

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/npm/bin:$HOME/.rvm/bin:/usr/bin:/usr/local/bin" # Add RVM to PATH for scripting

### LOCALDEV ###
# https://mashery.jira.com/wiki/display/DEV/LocalDev+Setup+Instructions
# Localdev environment variables
export HTTP_PROXY="http://proxy-us.intel.com:911"
export http_proxy="http://proxy-us.intel.com:911"
export HTTPS_PROXY="http://proxy-chain.intel.com:911"
export https_proxy="http://proxy-chain.intel.com:911"

#export JDK6_HOME='/Library/Java/JavaVirtualMachines/1.6.0_65-b14-462.jdk/Contents/Home'
#export JDK7_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home'
#export JDK7_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_76.jdk/Contents/Home'
export JDK8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home'
#export JDK8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home'
#export JDK9_HOME='/Library/Java/JavaVirtualMachines/jdk1.9.0.jdk/Contents/Home'
export JAVA_HOME="${JDK8_HOME}"
export JRE_HOME="${JDK8_HOME}"
