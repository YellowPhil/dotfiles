function config() {
    if [ "$1" = "stash" ]; then
        echo "ARE YOU SURE??!!"
        break
    else
        /usr/bin/git --git-dir=$HOME/.config/.cfg/ --work-tree=$HOME "$@";
    fi
}
