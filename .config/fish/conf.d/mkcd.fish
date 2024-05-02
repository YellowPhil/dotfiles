function mkcd -d "Make directory and cd into it"
  command mkdir $argv[1]
  builtin cd $argv[1]
end
