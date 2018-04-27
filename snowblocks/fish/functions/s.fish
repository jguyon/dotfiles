function s
  if test (count $argv) -gt 1
    # if more than zero arguments are given,
    # call ssh with the first argument as host
    # and the rest as fish arguments
    ssh "$argv[1]" -t "bash -l -c 'fish $argv[2..-1]'"
    and set -U s_last_host $argv[1]
  else
    # if no arguments are given,
    # call ssh with the most recently used host
    if test -n "$s_last_host"
      ts "$s_last_host"
    else
      echo "This command must be called with a host at least once" 1>&2
      false
    end
  end
end
