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
alias server="ssh -p 2228 root@188.120.248.116"

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
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

