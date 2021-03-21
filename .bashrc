# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=500000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    # Basic aliases for backward compatibility
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose"

PS1="\[\e[0;33m\]\t\[\e[0m\] \[\e[0;31m\][\$?]\[\e[0m\] \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\[\e[0;36m\]\w\[\e[0m\]\[\e[0;35m\]\$(__git_ps1)\[\e[0m\] \$ "

prompt () {
    echo "prompt [] [default] [classic] [small]"
    case "$1" in
        "small")
            PS1='\$ '
        ;;
        "classic")
            PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        ;;
        "default")
            PS1="\[\e[0;33m\]\t\[\e[0m\] \[\e[0;31m\][\$?]\[\e[0m\] \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\[\e[0;36m\]\w\[\e[0m\]\[\e[0;35m\]\$(__git_ps1)\[\e[0m\] \$ "
        ;;
        *)
            PS1="\[\e[0;33m\]\t\[\e[0m\] \[\e[0;31m\][\$?]\[\e[0m\] \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\[\e[0;36m\]\w\[\e[0m\]\[\e[0;35m\]\$(__git_ps1)\[\e[0m\] \$ "
        ;;
    esac
}

# Variables
# ##### ##### ##### ##### #####

export EDITOR='vim'

export MAGICK_MEMORY_LIMIT=4096

export PATH="$HOME/bin:$PATH"

# ignore case on <TAB> press
bind 'set completion-ignore-case on'

# Useful aliases
# ##### ##### ##### ##### #####

alias clearswap='sudo swapoff -a ; sudo swapon -a'
alias boost='sudo prelink -avmqRf'
alias doupt='sudo apt-get update ; sudo apt-get upgrade'
alias his='history | grep -i '
alias stp='sudo pkill -STOP'
alias cnt='sudo pkill -CONT'
alias bc="bc -l"
#alias tmux="tmux attach || tmux"
alias tmux="tmux -2"

#Productivity 
alias ls="ls --color=auto" 
alias ll="ls --color -alFh" 
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
alias ps?="ps aux | grep" 

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
    lxc launch ubuntu:16.04 $x --profile default --profile docker
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
        --restart always \
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

# Init pyenv
export PATH="/home/kfiala/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Init poetry
export PATH="/home/kfiala/.poetry/bin:$PATH"

# Init PATH for python and local binaries
export PATH="/home/kfiala/.local/bin:$PATH"

# Bash greetings
echo
date +"%d.%m.%Y %H:%M:%S"
uptime | cut -d" " -f 2-99
echo
