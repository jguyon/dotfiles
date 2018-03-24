function n
  if test (count $argv) -gt 0
    # if arguments are given, open nvim normally
    nvim $argv
  else if test -f Session.vim
    # if a Session.vim file exists, open the session
    nvim -S
  else
    # otherwise, create a new session
    nvim -c Obsess
  end
end
