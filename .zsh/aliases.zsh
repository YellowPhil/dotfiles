# add COLOR
alias diff="colordiff"
alias ip="ip -c "

# show open ports
alias open_ports="sudo lsof -i -n -P"

# launch gdb without prompt
alias gdb='gdb -q'

# pretty ls
alias la='exa -lah'
alias l='exa -l'
alias ls='exa'

# obvious ones
alias vim="nvim"
alias vi="nvim"
alias ida64="wine ~/Apps/IDA/ida64.exe"
alias ida32="wine ~/Apps/IDA/ida.exe"

# show info about packet
alias qq="pacman -Qi"

# remove packet with dependencies
alias qr="sudo pacman -Rcu"

# payload writing aliases
alias pp="python payload.py"
alias vp="vim payload.py"

# fir VSCode for Wayland
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland --log debug --enable-features=WaylandWindowDecorations"

# Use c++ 17 standart
alias g++="g++ --std=c++20"

# start ROPgadget with binary as first argument
alias ROPgadget="ROPgadget --binary"

# Fork bomb
alias forkbomb="echo ':(){ :|:& };:' | wl-copy"

#connect to remote server
alias old_server="ssh root@188.120.248.116"
alias server="ssh root@62.109.24.105"

# dump errors to /dev/null
alias find="find 2>/dev/null "

#preserve ENV whil SU-ing
alias su="su -m"

#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#window schizo
alias cls="clear"

# to remember
alias neofetch="macchina"

alias scam="ssh root@82.146.55.138"

alias npp="notepad++"

#dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.config/.cfg/ --work-tree=$HOME'

#run neo4j
alias run_neo4j='docker run --publish=7474:7474  --publish=7687:7687 --volume=/home/synerr/Documents/db/neo4j/data:/data neo4j'

#evil winrm in docker

alias winrm='docker run --rm -ti --name evil-winrm oscarakaelvis/evil-winrm'
alias feh="sxiv"
alias nigger="ssh root@79.137.195.227"
