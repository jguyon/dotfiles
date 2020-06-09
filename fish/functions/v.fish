function v
  if [ (count $argv) -gt 0 ]
    nvim $argv
  else if [ -e Session.vim ]
    nvim -S Session.vim
  else
    nvim
  end
end
