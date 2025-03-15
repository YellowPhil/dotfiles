#!/usr/bin/fish

alias docker-clear='docker rm -f $(docker ps -aq)'
alias dps="docker ps"
alias pizda='docker-compose build && docker-compose up -d'
alias dcl="docker compose logs"

function drm -d "Stop and remove docker container"
    if [ (count $argv) -ne 1 ]
        return 1
    end
        command docker stop $argv[1] && docker rm $argv[1]
end
