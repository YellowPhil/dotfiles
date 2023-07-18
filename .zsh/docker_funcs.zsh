function docker-clear() {
    containers=$(docker ps -q)
    for i in $containers;
    do
    docker stop $i && docker rm $i;
    done
}

alias dps="docker ps"