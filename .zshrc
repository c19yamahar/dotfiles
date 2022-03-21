# setopt
setopt IGNOREEOF
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_flow_control
setopt extended_glob
setopt pushd_ignore_dups
setopt auto_param_keys
setopt auto_cd
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt mark_dirs
setopt correct
setopt correct_all
setopt no_clobber
setopt noautoremoveslash
setopt complete_in_word
setopt correct
setopt list_packed
setopt list_types
setopt PROMPT_SUBST
setopt interactivecomments
setopt histignorealldups sharehistory
setopt CORRECT_ALL
setopt print_eight_bit
setopt interactive_comments
setopt auto_cd
setopt share_history
setopt hist_save_nodups


# autoload
autoload -Uz colors ; colors;zstyle ':completion:*' list-colors "${LS_COLORS}"
autoload -Uz compinit ; compinit


# export
export EDITOR=vim
export PATH="$HOME/bin:$PATH"
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# alias
alias ls='ls -FG --color=auto'
alias ll='ls -alFG --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias bk="cd -"
alias update="sudo apt update && sudo apt -y upgrade"
alias python="python3"
alias pip="pip3"
alias m="micro"

# others
bindkey -v
umask 022
ulimit -c 0
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


# 中央寄せする関数
text_center() {
  local columns=$(tput cols)
  local line=
  if [ -p /dev/stdin ]; then
    while IFS= read -r line || [ -n "$line" ]; do
      printf "%*s\n" $(( (${#line} + columns) / 2)) "$line"
    done < /dev/stdin
  else
    line="$@"
    printf "%*s\n" $(( (${#line} + columns) / 2)) "$line"
  fi
}

$(tput cols 2>/dev/null 1>/dev/null) && {
        SCREEN_WIDTH=$(tput cols);
    }
SCREEN_WIDTH=${SCREEN_WIDTH:-80};

# Function to draw horizontal line
echo_hr(){
    printf -v _hr "%*s" ${SCREEN_WIDTH} && echo ${_hr// /${1--}}
}

function tex-pdf(){
    ptex2pdf -l $1.tex && xdg-open $1.pdf
}

# login message
echo "\n";
massage='%n'; echo Hello,${(%)massage}!! | text_center
time='%D{%Y/%m/%d}';echo Today:${(%)time} | text_center
echo "\n";
echo_hr;

PROMPT='
[%B%F{206}%n%f%b@%m:%F{yellow}%~%f] %F{120}[%*]%f %F{yellow}$(__git_ps1 "[%s]")%f
%B%F{red}$%f%b '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion




### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz promptinit

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

if [ -f "${HOME}/.dircolors" ] ; then
    eval $(dircolors -b ${HOME}/.dircolors)
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors '${LS_COLORS}'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path $PATH
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"
export SCREENDIR=$HOME/.screen
export MICRO_TRUECOLOR=1

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS


# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a] '
zstyle ':vcs_info:*' formats       '(%s)-[%b] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

precmd() {
    print -Pn "\e]0;%~\a"
    vcs_info
}

preexec() {
    print -Pn "\e]0;%~ :: $1\a"
}


# manを色付き
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


# GitHubCLI_autocomplete
eval "$(gh completion -s zsh)"

# global ip(ipv4)表示
alias glbip='curl inet-ip.info'

# nginx log 表示
alias nginx_log='sudo tail -f /var/log/nginx/access.log'