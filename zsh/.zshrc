ZSH_THEME="powerlevel10k/powerlevel10k" 
export ZSH=/home/ggordon/.oh-my-zsh
export NVM_LAZY_LOAD=true

plugins=(sudo colored-man-pages colorize extract zsh-syntax-highlighting zsh-autosuggestions fasd zsh-nvm)
source $ZSH/oh-my-zsh.sh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ENABLE_CORRECTION="true"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt autopushd

# Paths
path+=('/home/ggordon/gerrit/ps-tools/bin')
export PS_BUILD_RELEASE_FLAG=2
#path+=('/home/ggordon/repo/vendor/persistent/standalone-toolchain/bin')
path+=('/home/ggordon/.emacs.d/bin')
path+=('/home/ggordon/Android/Sdk/tools')
path+=('/home/ggordon/Android/Sdk/platform-tools')
path+=('/usr/lib/jvm/java-11-openjdk-amd64/bin')
export PATH
export ANDROID_HOME=/home/ggordon/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Alias
alias emax="emacsclient -c -n"
alias ..='cd ..'
alias reb='adb shell reboot'
alias serial='adb wait-for-device shell /system/vendor/sbin/fw_setenv console ttymxc2'
alias sudo='nocorrect sudo'
alias capslock='setxkbmap -layout us -option ctrl:nocaps'
alias perm="stat -c '%a %n' *"
alias cls="ls -lha --color=always -F --group-directories-first |awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;for(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0o \",s,k);};print;}'"
alias grh="git reset --hard HEAD"
alias med="mps4 e21 && (mps clean > /dev/null; nohup bear mps4 e2 > /dev/null 2>&1) &"
alias gc="git clean -fXdq --exclude=\"!compile_commands.json\" --exclude=\"!.cache\""
alias fixc="python3 fixinclude.py"
alias fd='fd-find'
alias zz='fasd_cd -d -i' 
alias adbw='adb wait-for-device'
alias wlt='adb wait-for-device shell tail -f /var/log/waverelay.log'
alias mlt='adb wait-for-device shell tail -f /var/log/media.log'
alias glt='adb wait-for-device shell tail -f /var/log/gstd.log'
alias dlt='adb wait-for-device shell dmesg -w'
alias adbb='adb wait-for-device'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
