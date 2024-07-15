function docker-clear() {
  docker stop $(docker ps -aq);
  docker rm $(docker ps -aq);
}

alias dps="docker ps"

function dexec() {
    docker exec -it "$1" bash;
}

function drm() {
    docker stop "$1";
    docker rm "$1";
}
