function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # prompt
    starship init fish | source

    # better cd
    zoxide init fish | source

    # Better history
    atuin init fish | source

    # direnv setup
    direnv hook fish | source

    # Colors from wal
    wal --theme sexy-neon -q 

    # creds for applications
    source ~/.creds.env
end


function update_cwd_osc --on-variable PWD --description 'Notify terminals when $PWD changes'
    if status --is-command-substitution || set -q INSIDE_EMACS
        return
    end
    printf \e\]7\;file://%s%s\e\\ $hostname (string escape --style=url $PWD)
end

update_cwd_osc # Run once since we might have inherited PWD from a parent shell

if status is-interactive
  printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

#source $HOME/.config/fish/custom_imports/*
find $HOME/.config/fish/custom_imports -name "*.fish" -exec cat {} \; | source

############ PYWAL THEME ##############
# wal --theme sexy-belge -q 
# wal --theme sexy-nancy -q 
# wal -w -n -q -e
###########################################

# function fish_prompt
#   set_color cyan; echo (pwd) 
#
#set_color green; echo '> '
# end
