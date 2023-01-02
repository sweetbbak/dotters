#-----------[Alias]---------------------#
alias ohmyzsh="hx ~/.oh-my-zsh"
alias ls="ls --color -lh"
alias grep="grep -n --color"
alias ag="alias | grep "
alias zrc="hx ~/.zshrc && source ~/.zshrc"
alias plz='/usr/bin/sudo $(history -p !!)' #gets last cmd to rerun as sudo
alias ..="cd .."
alias hg="history 1 | grep"
alias l="ls -ah"
alias cp="cp -rv"
alias tree="tree -CF"
alias kitconfig='nvim ~/.config/kitty/kitty.conf'
alias lsd="ls -lhv --group-directories-first"
alias zrf="hx ~/.oh-my-zsh/custom/functions.zsh"
alias e="exa --icons --color=always"
alias ee="exa --icons --color=always -a"

# Locations
alias t7='cd /run/media/sweet/T7'
alias windows='cd /run/media/sweeti/623C48973C48685D/Users/User'
alias drives='cd /run/media/sweet'
alias ddrv='cd /run/media/sweet/Hard\ Drive'
alias down="cd ~/Downloads"
alias pics="cd ~/Pictures"
alias vids="cd ~/Videos"

#Pacman
alias pac="sudo pacman"
alias pacs="sudo pacman -S "
alias pacrm="sudo pacman -R"
alias pacup="sudo pacman -Syu"
alias pacq="pacman -Q | grep"
alias pacls="pacman -Q"
alias pacd="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'" #lists all installed packages w/a double window TUI using fzf + info panel
alias pacc="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"

#handy shit
alias eip="echo "$(curl -s http://ifconfig.me)""
alias hlp="find ./ -printf "%f\n" | gum filter"
alias px2ansi='python ~/github/px2ansi/px2ansi.py'
alias icat="kitty +kitten icat"
alias zshxc="zsh -ixc : 2>&1 | grep"
alias fzman="echo '' | fzf --preview 'man {q}'"
alias fzawk="echo '' | fzf --print-query --preview 'echo "a\nb\nc\nd" | awk {q}'"
alias tree='exa -a -I .git --tree' # exa is an alternative to ls

#Programs
alias download="yt-dlp -x --audio-format mp3"
alias top="htop"
alias vi="nvim"
alias lsall="find ./ -printf "%f\n""
alias ytdl='yt-dlp'
alias py='python'
alias n='nnn -de'
alias share='printf $(curl -# "https://oshi.at" -F "f=@$(fd -t f -d 1|fzf)"|sed -nE "s_DL: (.*)_\1_p")|xsel' #share file to file share site
alias ximg='xclip -selection clipboard -target image/png -i'
alias xout='xclip -se c -t image/png -o >'
alias fmpv='mpv "$(fzf)"'

alias yta="yt-dlp --embed-thumbnail -f 'bestaudio/best' -f 'm4a'"
alias ytd="yt-dlp -f 'bestvideo[height<=?1080]+bestaudio/best' -f 'mp4'"
alias ytdd="yt-dlp -f 'bestvideo[height<=?720]+bestaudio/best' -f 'mp4'"
alias ytddd="yt-dlp -f 'bestvideo[height<=?480]+bestaudio/best' -f 'mp4'"

#Processes
alias psa="ps -e | grep -i"
alias sudosys="sudo systemctl"
alias envfz="env | fzf"
alias disks="lsblk --nodpes --output NAME,MODEL,SIZE"
alias parts="lsblk --output NAME,LABEL,FSTYPE,MOUNTPOINTS,SIZE,MODEL"

alias fonts="fc-list | sort | fzf"
alias paths='sed "s/:/\n/g" <<< $PATH'
alias finddir="find . -type d -name"
alias findfile="find . -type f -name"

alias fff="fd -d 2 | fzf --preview 'bat --color=always --style=numbers {}'"

alias restart_kwin="kwin_x11 --replace"
# Kitty
alias pix="pixcat resize -w 64 -h 32 -W 512 -H 256 --align center --relative-x -2"
alias kittydiff="git difftool --no-symlinks --dir-diff"
# Curl
alias curluser='curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0"'