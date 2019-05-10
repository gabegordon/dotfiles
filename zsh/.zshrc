# If you come from bash you might have to change your $PATH.
#
# Path to your oh-my-zsh installation.
 export ZSH=/home/ggordon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

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
plugins=(sudo systemd colored-man-pages colorize cp copydir dirpersist extract history gitignore git)
source $ZSH/oh-my-zsh.sh
setopt HIST_FIND_NO_DUPS
setopt autopushd
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

source "${HOME}/.zgen/zgen.zsh"
zgen load fdw/ranger_autojump
[[ -s /home/ggordon/.autojump/etc/profile.d/autojump.sh ]] && source /home/ggordon/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
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
alias cerbero='/opt/cerbero/cerbero-uninstalled'
export PATH=$PATH:/home/ggordon/android-repo/ps/ps-build/bin
export PATH=$PATH:/home/ggordon/ps-tools/bin
export PATH=$PATH:/home/ggordon/Downloads/rtags/bin
#export PATH=$PATH:/home/ggordon/ndk/toolchain/bin
alias gbuild='adb remount && cd /home/WAVERELAY/ggordon/android-repo/ps/ps-build && source env.source && cd ../visualization && mps e2 && mps e21&& cd ../wrservices && mps e2 && mps e21 && cd ../management && mps e2 && mps e21'
alias msbuild='bash ~/msbuild'
alias sudo='sudo '
alias ..='cd ..'
alias ml='cat /var/log/media.log'
alias mlt='busybox tail -f /var/log/media.log'
alias wl1='adb -s 30381 shell cat /var/log/waverelay.log'
alias wlt2='adb -s 18561 busybox tail -f /var/log/waverelay.log'
alias wl2='adb -s 18561 shell cat /var/log/waverelay.log'
alias wlt1='adb -s 30381 busybox tail -f /var/log/waverelay.log'

alias wrt='busybox tail -f /var/log/wrsa.log'
alias ..='cd ..'
alias addpath='export PATH=$PATH:/home/WAVERELAY/ggordon/toolchain/bin'
alias setenv='source ~/repo/ps/ps-build/env.source'

alias reb='adb shell reboot'
alias serial='adb wait-for-device shell /system/vendor/sbin/fw_setenv console ttymxc2'
alias ib="adb wait-for-device remount && mps e21 && adb shell sed -i 's/printk off/printk on/g' /system/vendor/sbin/waverelay.sh"
alias as='adb wait-for-device shell'
alias sudo='nocorrect sudo'
alias capslock='setxkbmap -layout us -option ctrl:nocaps'
alias r2s='adb -s 18561 wait-for-device shell'
alias r1s='adb -s 30381 wait-for-device shell'
alias r2='adb -s 18561 wait-for-device'
alias r1='adb -s 30381 wait-for-device'
alias compfix="sed -i \'s|\"command\": \"cc|\"command\": \"arm-linux-androideabi-gcc|g\' compile_commands.json"
alias pushboth='r1 remount && r2 remount && mps4 e21 && r1 reboot && r2 reboot'
alias perm="stat -c '%a %n' *"
alias cls="ls -lha --color=always -F --group-directories-first |awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'"
alias bp="cd ~/android-repo/ps/ps-build && source env.source && popd"
alias ndk="PATH=$PATH:/home/ggordon/ndk/toolchain/bin"
source ~/.tldr.complete
alias gkk="gk &"
alias grh="git reset --hard HEAD"
alias rtags="mps clean && bear mps e2 && rc -J ."
alias med="mps4 e21 && (mps clean > /dev/null; nohup bear mps4 e2 > /dev/null 2>&1; rc -J . > /dev/null) &"
