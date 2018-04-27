function s
  if test (count $argv) -gt 1
    # if more than one argument is given,
    # call ssh with the first argument as host
    # and the rest as fish arguments
    ssh "$argv[1]" -t "bash -l -c 'fish $argv[2..-1]'"
    and set -U s_last_host $argv[1]
  else if test (count $argv) -eq 1
    # if exactly one argument is given,
    # call ssh with the argument as host
    # and launch fish
    ssh "$argv[1]" -t "bash -l -c fish"
    and set -U s_last_host $argv[1]
  else
    # if no arguments are given,
    # call ssh with the most recently used host
    if test -n "$s_last_host"
      s "$s_last_host"
    else
      echo "This command must be called with a host at least once" 1>&2
      false
    end
  end
end
