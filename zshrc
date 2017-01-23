# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/toban/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh options
setopt autocd
unsetopt beep
setopt correct
setopt noclobber



# set i3's default terminal to urxvt
export TERMINAL=urxvt

# set default editor (don't need bindkey -v as zsh infers from this)
export EDITOR=nvim
export VISUAL=nvim

# set browser (used by rtv, urlscan)
export BROWSER=qutebrowser

# rtv url hinter/extracter
export RTV_URLVIEWER=urlscan

# dotfiles repo
export DOTFILES="$HOME/utilities/dotfiles"

# add my scripts to PATH
export PATH="$HOME/.local/bin:$PATH"

# zplug directory
export ZPLUG_HOME="$HOME/.local/share/zplug"

# set location of weechat config
export WEECHAT_HOME="$HOME/.config/weechat"

# Anaconda python: after system python
export PATH="$PATH:/home/toban/utilities/anaconda3/bin"

# ruby gems (local installs)
if which ruby >/dev/null && which gem >/dev/null; then
	export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi


#===================================
# PLUGINS
#
# First install `zplug` from AUR (or install directly)
#===================================

# load zplug
source /usr/share/zsh/scripts/zplug/init.zsh # AUR install location

# 256 color terminal
zplug chrissicool/zsh-256color
# liquidprompt
zplug nojhan/liquidprompt
# sane options
zplug willghatch/zsh-saneopt
# syntax highlighting
zplug zsh-users/zsh-syntax-highlighting
# notifications for long-running commands
zplug marzocchi/zsh-notify

# enhanced vi mode
zplug plugins/vi-mode, from:oh-my-zsh
# taskwarrior completions
zplug plugins/taskwarrior, from:oh-my-zsh
# all-in-one extracter
zplug plugins/extract, from:oh-my-zsh
# colored man pages
zplug plugins/colored-man-pages, from:oh-my-zsh

# install new plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to PATH
zplug load


#===================================
# ALIASES
#
#===================================

# some pacman/pacmatic convenience aliases
alias pacup='sudo pacmatic -Syu'
alias pacin='sudo pacmatic -S'
alias pacinfo='pacman -Qi'
# pacsearch is already provided

alias oldvim='/usr/bin/vim'
alias vim='nvim'

# -i for interactive. Prompts before overwriting/removing.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias mkdir='mkdir -p' # automatically make parents
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -Alv'

# ssh into tesla server with compatible terminal emulator
alias tesla='TERM=xterm ssh tesla'
