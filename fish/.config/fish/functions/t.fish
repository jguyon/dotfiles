function t
  if test (count $argv) -gt 0
    # if arguments are given, open tmux normally
    tmux $argv
  else
    # otherwise, attach to last session or create a new one
    tmux attach ; or tmux new
  end
end
