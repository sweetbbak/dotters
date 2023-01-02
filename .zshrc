#export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin:~/go/bin:~/.config/nvim/bin
export EDITOR='hx'
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000000
export VISUAL='code'
PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" ):$PATH
export PATH=$HOME/.config/rofi/scripts:$PATH

#source $ZSH/oh-my-zsh.sh
ZSH_THEME="cummies"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#626880'

bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey ' ' magic-space

#zsh plugins
plugins=(zsh-syntax-highlighting z git zsh-autosuggestions dirhistory archlinux)

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
setopt autocd
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history         # share command history data

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
  typeset -gA ZSH_HIGHLIGHT_STYLES

  #force_color_prompt=yes
  # enable syntax-highlighting
       if [ -f ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ]; then
           . ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
           ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
           ZSH_HIGHLIGHT_STYLES[default]=none
           ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
           ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=magenta,underline
           ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta,underline
           ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=magenta,underline
           ZSH_HIGHLIGHT_STYLES[path]=bold
           ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
           ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
           ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[command-substitution]=none
           ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[process-substitution]=none
           ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=blue
           ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=blue
           ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
           ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=magenta
           ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=magenta
           ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=magenta
           ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
           ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[assign]=none
           ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
           ZSH_HIGHLIGHT_STYLES[named-fd]=none
           ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
           ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
           ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=gray,bold
           ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
           ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
           ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
           ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
           ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
           ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
       fi

   unset color_prompt force_color_prompt

 # enable auto-suggestions based on the history
 if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#626880'

export MANPATH="/usr/local/man:$MANPATH"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#-----------[NNN]---------------------#
export NNN_OPTS="H" # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
# export LC_COLLATE="C" # hidden files on top
export NNN_FIFO=/tmp/nnn.fifo # temporary buffer for the previews
export NNN_PLUG='o:fzopen;e:-!sudo -E nvim $nnn*;h:-!hx $nnn*;p:preview-tui;x:!chmod +x $nnn;m:!mpv $nnn'
export SPLIT='v' # to split Kitty vertically

NNN_TMPFILE='/tmp/.lastd'
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# export FZF_DEFAULT_OPTS="
#   --color=fg:#ff007c,bg:-1,hl:#03d8f3 --color=fg+:#00ffc8,bg+:,hl+:#03d8f3 
#   --color=info:#ff0055,prompt:#fcee0c,pointer:#ffb800 --color=marker:#00ffc8,spinner:#ffb800,header:#fcee0c
#   --reverse --border=rounded
# "
# Custom Pink & Black theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ff5f87,hl:#008ec4 --color=fg+:#d75f87,bg+:#4e4e4e,hl+:#5fd7ff --color=info:#afaf87,prompt:#c30771,pointer:#af5fff --color=marker:#c30771,spinner:#af5fff,header:#a790d5'