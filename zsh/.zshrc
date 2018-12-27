# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.
 export ZSH=/home/gabe/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=agnoster

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo systemd vi-mode)
bindkey -M viins 'fd' vi-cmd-mode
source $ZSH/oh-my-zsh.sh
setopt HIST_FIND_NO_DUPS

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emax="emacsclient -c -n"
alias sudo="sudo "
alias E="SUDO_EDITOR=\"emacsclient -c -a emacs\" sudoedit"
alias susvm="sudo virsh dompmsuspend win10 mem"
alias savevm="sudo virsh dompmsuspend win10 disk"
alias attachvm="~/scripts/attach.sh"
alias detachvm="~/scripts/detach.sh"
alias website='sudo cp -R ~/gabegordon.github.io/interactive/* /opt/lampp/htdocs/.'
alias upmirrors='sudo reflector --age 12 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias cerbero='/opt/cerbero/cerbero-uninstalled'
export PATH=$PATH:/home/WAVERELAY/ggordon/android-repo/ps/ps-build/bin
export PATH=$PATH:/home/WAVERELAY/ggordon/gerrit/ps-tools/bin
#export PATH=$PATH:/home/WAVERELAY/ggordon/android-ndk-r9d/toolchain/bin
export PATH=$PATH:/home/WAVERELAY/ggordon/android-ndk-r9d/
export PATH=$PATH:/home/WAVERELAY/ggordon/Downloads/android-studio/bin
export PATH=$PATH:/home/WAVERELAY/ggordon/.local/bin
alias gbuild='adb remount && cd /home/WAVERELAY/ggordon/android-repo/ps/ps-build && source env.source && cd ../visualization && mps e2 && mps e21&& cd ../wrservices && mps e2 && mps e21 && cd ../management && mps e2 && mps e21'
export PATH=$HOME/local/mypax:$PATH
alias msbuild='bash ~/msbuild'
alias sudo='sudo '
alias ..='cd ..'
alias ml='adb wait-for-device shell cat /var/log/media.log'
alias mlt='adb wait-for-device shell busybox tail -f /var/log/media.log'
alias wl='adb wait-for-device shell cat /var/log/waverelay.log'
alias wlt='adb wait-for-device shell  busybox tail -f /var/log/waverelay.log'
alias ..='cd ..'
alias addpath='export PATH=$PATH:/home/WAVERELAY/ggordon/toolchain/bin'
alias setenv='source ~/android-repo/ps/ps-build/env.source'

alias sudo='sudo '
alias rem='adb shell reboot'
alias serial='adb shell /system/vendor/sbin/fw_setenv console ttymxc2'
