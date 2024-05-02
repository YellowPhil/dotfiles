function project_dir -d "Change current working project directory"
  if test (count $argv) -ne 1
    echo "Provide SINGLE directory abs path"
    return
  end
  if not test -e $argv[1]
    echo "Directory does not exists"
    return
  else
    set nigger "$argv[1]"
    echo $nigger
    sed -i "s/working_directory=.*/working_directory=$nigger/" $HOME/.config/alacritty/alacritty.toml
  end
end
