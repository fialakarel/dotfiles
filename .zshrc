# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kfiala/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="crunch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

#set history size
export HISTSIZE=30000
#save history after logout
export SAVEHIST=30000
#history file
#export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# see more: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting urltools)

bindkey '^ ' autosuggest-accept
bindkey \^U backward-kill-line

# setup correction
setopt correct
setopt histignorespace

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt share_history

export EDITOR=vim

#source ~/.bash_aliases_personal

# Variables
# ##### ##### ##### ##### #####

export EDITOR='vim'

export MAGICK_MEMORY_LIMIT=4096

export PATH="$HOME/bin:$PATH"

# Useful aliases
# ##### ##### ##### ##### #####

alias clearswap='sudo swapoff -a ; sudo swapon -a'
alias boost='sudo prelink -avmqRf'
alias doupt='sudo apt-get update ; sudo apt-get dist-upgrade'
alias his='history | grep -i '
alias stp='sudo pkill -STOP'
alias cnt='sudo pkill -CONT'
alias bc="bc -l"
alias vi="vim"
#alias tmux="tmux attach || tmux"
alias tmux="tmux -2"

#Productivity 
alias ls="ls --color=auto" 
alias ll="ls --color -alFh" 
alias llt="ls --color -alFh --sort=time" 
alias grep='grep --color=auto' 
mcd() { mkdir -p "$1"; cd "$1";} 
mkdate() { local DIR="$(date +%F)-$1" ; mkdir "$DIR" && cd "$DIR" ; }
cls() { cd "$1"; ls;} 
backup() { pv "$1"{,.bak};}  
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 
alias ..='cd ..' 
alias ...='cd ../..'
extract() { 
    if [ -f $1 ] ; then 
    case $1 in 
        *.tar.bz2)   nice -n 10 ionice -c 3 tar xjf $1     ;; 
        *.tar.gz)    nice -n 10 ionice -c 3 tar xzf $1     ;; 
        *.bz2)       nice -n 10 ionice -c 3 bunzip2 $1     ;; 
        *.rar)       nice -n 10 ionice -c 3 unrar e $1     ;; 
        *.gz)        nice -n 10 ionice -c 3 gunzip $1      ;; 
        *.tar)       nice -n 10 ionice -c 3 tar xf $1      ;; 
        *.tbz2)      nice -n 10 ionice -c 3 tar xjf $1     ;; 
        *.tgz)       nice -n 10 ionice -c 3 tar xzf $1     ;; 
        *.zip)       nice -n 10 ionice -c 3 unzip $1       ;; 
        *.Z)         nice -n 10 ionice -c 3 uncompress $1  ;; 
        *.7z)        nice -n 10 ionice -c 3 7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
    esac 
    else 
        echo "'$1' is not a valid file" 
    fi 
} 

#System info 
alias cmount="mount | column -t" 
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 
alias meminfo='free -m -l -t' 
#alias ps?="ps aux | grep" 

#Network 
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla" 
alias listen="lsof -P -i -n" 
alias port='netstat -tulanp'
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host" 
getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';} 

alias cputemp='sensors | grep Core'

myinfo () {
    printf "CPU: "
    cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
    printf "\n"
    
    cat /etc/issue | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
    uname -a | awk '{ printf "Kernel: %s " , $3 }'
    uname -m | awk '{ printf "%s | " , $1 }'
    kded4 --version | grep "KDE Development Platform" | awk '{ printf "KDE: %s", $4 }'
    printf "\n"
    uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
    printf "\n"
    cputemp | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    cputemp | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    #cputemp | awk '{ printf "%s %s", $1 $2 }'
}


dp () {
  if [[ $1 -eq "1" || $# -eq "0" ]]; then
    PS1="\033[01;32m$\033[00m "
  elif [[ $1 -eq "2" ]]; then
    PS1="${debian_chroot:+($debian_chroot)}\w\033[01;32m$\033[00m "
  elif [[ $1 -eq "3" ]]; then
    PS1="\033[01;32m\u@\H:${debian_chroot:+($debian_chroot)}\w\033[01;32m$\033[00m "
  fi
  return;
}

alias diskusage="agedu -s / -w -R"

#alias ds="~/Public/ds.sh"

alias youtube-dl-best="youtube-dl -f 'bestvideo[height <=? 1080][width <=? 1920][ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm]'"

youtube-dl-until() {
  if [ $# -ge 1 ]
  then
    cmd="youtube-dl $@"
    echo "Running: $cmd"
    until $cmd
    do
      echo "Trying again!"
      sleep 1
    done
  else
    echo "Usage: youtube-dl-until <url> [params]"
  fi
}

# tmux shortcuts
alias ttm="tmux -2 attach -t ttm || tmux -2 new -s ttm"
alias ttml="tmux ls"
alias ttma="tmux -2 attach -t"
alias ttmn="tmux -2 new -s"

alias alq="alias | grep"

alias hista="history -a"

# inteligent cp for btrfs
alias icp='cp --reflink=auto --sparse=always'

lxc_tmp() {
    x=${1:-tmp1}
    lxc launch ubuntu:20.04 $x --profile default --profile docker
    lxc exec $x -- mkdir /root/.ssh
    lxc file push ~/.ssh/id_rsa.pub $x/root/.ssh/authorized_keys
    lxc exec $x -- chown -R root:root /root
    lxc exec $x -- /bin/bash
    lxc stop $x
    lxc delete $x
}

alias aptproxy-enable='sudo sed -i "s/^/#/" /etc/apt/apt.conf.d/02proxy'
alias aptproxy-disable='sudo sed -i "s/^#//" /etc/apt/apt.conf.d/02proxy'

alias wifi-reset='sudo pkill wpa_supplicant ; sudo pkill dhclient ; sudo ip a flush dev wlan0 ; sleep 1 ; sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/config.conf && sudo dhclient wlan0 ; '

alias getshelllevel='echo $((SHLVL/2))'

alias net.bond="sudo pkill wpa_supplicant ; sudo pkill dhclient ; sudo ip addr flush bond0 ; sudo ip addr flush wlan0 ; sudo ip addr flush eth0 ; sudo modprobe bond0 ; sudo ifenslave bond0 wlan0 eth0 ; sudo dhclient bond0 ; sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/mywpa.conf"

mtmp() {
    mkdir /tmp/$1
    cd /tmp/$1
}

alias clipboard-monitor='echo $? | xclip  ; x=`xclip -o` ; while ((1)); do y=`xclip -o` ; [ "$x" == "$y" ] || { echo $y; x="$y"; } ; sleep 0.5 ; done'

alias search-for-text-in-file='grep --color=always --exclude=".*" --exclude-dir=".*" --binary-files=without-match --ignore-case --line-number --recursive --no-messages --context=2'

alias search-for-filename='find . | grep --ignore-case --color=always'

alias touchpad.disable='xinput --disable $(xinput list | grep "Touchpad" | sed -n "s/^.*id=\([1-9][0-9]\).*$/\1/p")'
alias touchpad.enable='xinput --enable $(xinput list | grep "Touchpad" | sed -n "s/^.*id=\([1-9][0-9]\).*$/\1/p")'

alias sleep-after="systemd-inhibit --what=handle-lid-switch"

alias storage-explorer="/opt/StorageExplorer/StorageExplorer"

alias umount-all-media="umount /run/media/kfiala/*"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias cat='bat'

# Run mirage from shell and avoid spamming console
mirage() {
    nohup /usr/bin/mirage $@ &>/dev/null & disown
}

# Run gimp from shell and avoid spamming console
gimp() {
    nohup /usr/bin/gimp $@ &>/dev/null & disown
}

mplayer() {
    /usr/bin/mplayer -nolirc $@
}

adminer() {
    docker run \
        --detach \
        --restart unless-stopped \
        --name adminer \
        --publish 127.0.0.1:8080:8080/tcp \
        adminer:4-standalone

    xdg-open http://127.0.0.1:8080
}

pycharm() {
    if [ ! -f /opt/pycharm-community-*/bin/pycharm.sh ]
    then
        echo "You have to install pycharm first!"
    else
        nohup /opt/pycharm-community-*/bin/pycharm.sh $@ &>/dev/null </dev/null &
    fi
}

ffmpeg-concat-all-mp4() {
  find *.mp4 | sed 's:\ :\\\ :g'| sed 's/^/file /' > list.txt
  ffmpeg -f concat -i list.txt -c copy output.mp4
  rm list.txt
}

ffmpeg-extract-frame() {
  echo "Running: ffmpeg -ss 00:03:00 -i $1 -vframes 1 -q:v 5 $1.jpg"
  ffmpeg -ss 00:03:00 -i $1 -vframes 1 -q:v 5 $1.jpg
}

ffmpeg-minimize-videosize-mp4() {
  ffmpeg \
    -i $1 \
    -vf scale="800:-1" \
    -loglevel error \
    -stats \
    -threads 0 \
    -f mp4 \
    -c:v libx264 \
    -preset fast \
    -crf 29 \
    -tune fastdecode \
    -movflags faststart \
    -pix_fmt yuv420p \
    -c:a aac \
    -ab 128k \
    -ar 48000 \
    -avoid_negative_ts make_zero \
    -r 30 \
    $1-mini.mp4
}

ffmpeg-ks-preprocess() {
  if [ $# -lt 1 ]
  then
    echo "Usage: ffmpeg-ks-preprocess <input> <output_name_only>"
  else
    date=$(echo "$1" | grep -o "[0-9-]*" | head -n 1 | sed "s/-//g")
    name="${2:-output}"
    nice ionice -c 3 ffmpeg \
      -i "$1" \
      -loglevel error \
      -stats \
      -threads 0 \
      -f mp4 \
      -c:v libx264 \
      -preset medium \
      -crf 26 \
      -tune fastdecode \
      -movflags faststart \
      -pix_fmt yuv420p \
      -c:a copy \
      ${date}_${name}.mp4
  fi
}

alias ffmpeg="nice ionice -c 3 ffmpeg"

ssh-keygen-in-memory() {
  key="$(mktemp --dry-run --suffix key)"
  key_pub="${key}.pub"
  mkfifo $key $key_pub
  cat $key $key_pub &
  echo "y" | ssh-keygen -f $key
  rm $key $key_pub
}

ssh-keyscan-host() {
  if [ $# -ne 1 ]
  then
    echo "Usage: ssh-keyscan-host <host.example.com>"
  else
    HOST="$1"
    ssh-keyscan $HOST 2>/dev/null | grep "ecdsa-sha2" | sed "s/$HOST/$HOST,$(dig +short $HOST)/"
  fi
}

kfinstall() {
  if [ $# -ne 1 ]
  then
    printf "\n\tUsage: $0 <install-script-without-extension>\n\n"
    printf "\n\tExample: $0 helm\n\n"
    printf "\n\tAvailable scripts: https://github.com/fialakarel/my-ubuntu-install-steps/tree/master/install\n\n"
  else
    curl --location "https://raw.githubusercontent.com/fialakarel/my-ubuntu-install-steps/master/install/$1.sh" | bash
  fi
}

kfinstall.list() {
  curl --silent https://github.com/fialakarel/my-ubuntu-install-steps/tree/master/install \
    | grep 'js-navigation-open' \
    | grep -o 'title=".*\.sh" ' \
    | sed 's/"//g;s/title=//g;s/.sh $//g'
}

activatekubectl() {
  export PS1="(k8s: $(/usr/bin/kubectl config current-context)) $PS1"
}

# Disabled due to Lens
#kubectl() {
#  if [[ $PS1 == "(k8s: "* ]]; then
#    /usr/bin/kubectl "$@"
#  else
#    echo "No k8s cluster environment activated!"
#  fi
#}
#
#helm() {
#  if [[ $PS1 == "(k8s: "* ]]; then
#    /home/kfiala/bin/helm "$@"
#  else
#    echo "No k8s cluster environment activated!"
#  fi
#}

dump-sr0-to-iso() {
  if [ $# -ne 1 ]
  then
    echo "Usage: dump-sr0-to-iso <output-image-name.iso>"
  else
    output_name="$1"
    block_size=$(isoinfo -d -i /dev/cdrom | grep -i 'block size' | grep -o "[0-9]*")
    volume_size=$(isoinfo -d -i /dev/cdrom | grep -i 'volume size' | grep -o "[0-9]*")
    dd if=/dev/sr0 of=${output_name} bs=${block_size} count=${volume_size} status=progress conv=noerror,sync iflag=fullblock
  fi
}

files() {
  nohup nautilus $1 &>/dev/null &
  disown
}

winbox() {
  docker run \
      --detach \
      --rm \
      --ipc host \
      --net host \
      --name winbox \
      --volume /tmp/.X11-unix:/tmp/.X11-unix \
      --volume /etc/localtime:/etc/localtime:ro \
      --volume /usr/share/X11/xkb:/usr/share/X11/xkb:ro \
      --volume /etc/machine-id:/etc/machine-id:ro \
      --volume "$HOME/.local/share/winbox:/root/.wine/drive_c/users/root/Application Data/Mikrotik/Winbox" \
      --env DISPLAY=$DISPLAY \
      fialakarel/winbox
}


# Private aliases per device
if [ -f ~/.bash_aliases_* ]; then
    . ~/.bash_aliases_*
fi

# Load miniconda3 if installed
if [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    source ~/miniconda3/etc/profile.d/conda.sh
fi

## Init pyenv
#export PATH="/home/kfiala/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# Init poetry
export PATH="/home/kfiala/.poetry/bin:$PATH"

# Init PATH for python and local binaries
export PATH="/home/kfiala/.local/bin:$PATH"
export PATH="/home/kfiala/.pyenv/shims:$PATH"
export PATH="$PATH:/opt/mssql-tools/bin"

# GO PATH
export PATH="$PATH:/home/kfiala/go/bin"

# Kitty configuration
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"
alias idiff="kitty +kitten diff"

## Bash greetings
#echo
#date +"%d.%m.%Y %H:%M:%S"
#uptime | cut -d" " -f 2-99
#echo

# Prevent nested Ranger
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

export PATH="$HOME/.poetry/bin:$PATH"

# Load fzf
source <(fzf --zsh)
#export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_DEFAULT_OPTS='--no-reverse'
# select file or dir
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# list history
export FZF_CTRL_R_OPTS='--no-sort --exact'
# cd into dir
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

#eval $(thefuck --alias)
# copy&paste to speed it up
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }

