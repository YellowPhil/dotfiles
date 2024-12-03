# For fun
alias pong='ping'
##################################################### DOCKER FUNCS ##############################################
alias dps='docker ps'
function docker-clear
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
end

alias vscode-eslint-language-server='eslint'

# add COLOR
alias ip="ip -c "

# show open ports
alias open_ports="sudo lsof -i -n -P"

# launch gdb without prompt
alias gdb='gdb -q'

# pretty ls
alias la='exa -lah --icons'
alias l='exa -l --icons'
alias ls='exa --icons'

# obvious ones
alias vim="nvim"
alias vi="nvim"

# show info about packet
alias qq="pacman -Qi"

# remove packet with dependencies
alias qr="sudo pacman -Runsc"

# payload writing aliases
alias pp="python ebanie.py"
alias vp="vim ebanie.py"

# fir VSCode for Wayland
alias code="code --no-sandbox --enable-features=UseOzonePlatform --ozone-platform=wayland --log debug --enable-features=WaylandWindowDecorations"

# Use c++ 20 standart
alias g++="g++ --std=c++20"

# start ROPgadget with binary as first argument
alias ROPgadget="ROPgadget --binary"

# Fork bomb
alias forkbomb="echo ':(){ :|:& };:' | wl-copy"

#connect to remote server
alias old_server="ssh root@188.120.248.116"

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

# ))

#window schizo
alias cls="clear"

# to remember
alias neofetch="macchina"

alias scam="ssh root@82.146.55.138"

alias npp="notepad++"

#dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.config/.cfg/ --work-tree=$HOME'

#run neo4j
alias run_neo4j="docker run --detach --publish=7474:7474 --publish=7687:7687 --env NEO4J_AUTH='neo4j/Pizda123\$'  --volume=$HOME/Documents/db/neo4j/data:/data neo4j:4.4.13"

#evil winrm in docker
#alias winrm='docker run --rm -ti --name evil-winrm oscarakaelvis/evil-winrm'
alias winrm='evil-winrm'
#
alias feh="sxiv"

#diff
#alias diff='diff-so-fancy'
#
alias kali_work='ssh davydov-m@10.20.1.10 -i ~/.ssh/kali_keys'

alias pch='proxychains -q'

alias open='xdg-open'

alias gtp='graftcp'


########################################################### VPN SETUP #################################################
alias vpn-on='wg-quick up $HOME/.local/share/vpn/eat_people.conf'
alias vpn-off='wg-quick down $HOME/.local/share/vpn/eat_people.conf'

alias chatgpt-on='wg-quick up $HOME/.local/share/vpn/chatgpt_vpn.conf && sleep 1 && xdg-open https://chatgpt.com'
alias chatgpt-off='wg-quick down $HOME/.local/share/vpn/chatgpt_vpn.conf'

########################################################### NEW ERA ####################################################
# alias cp='xcp'
alias du='dust'
alias cd='z'
#alias ps='procs'
#alias rm='rip'
#alias cd='zq'
#alias jq='jql'
#alias dig='dog'
#alias curl='curlie'
#################################################### ZELLIJ SETUP #################################################
alias zj='zellij'
alias zja='zellij attach -f --index 0 -c'
# #function rm() {
# #  echo "$1"
#   echo "$@"
# }
##############################################   SLIVER #############################################
alias sliv='sliver-client_linux'
############################################### TODOs ##################################
alias t='todoist-cli'

############################################# HEX EDITOR ###############################33
alias whex='wxHexEditor'
########################### HACKS ########################
alias findip='grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"'
alias sneaky-ssh='ssh -T -o PreferredAuthentications=keyboard-interactive,password -o PubkeyAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

#################################### FFUF with default random agent
alias ffuf='ffuf -H "User-Agent: $(openssl rand -hex 16)"'
