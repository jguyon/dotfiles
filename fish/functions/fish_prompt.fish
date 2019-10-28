function fish_prompt
  set -l exit_code $status
  set -l color

  switch $fish_bind_mode
    case default
      set color magenta
    case replace_one
      set color yellow
    case visual
      set color cyan
    case '*'
      if [ $exit_code != 0 ]
        set color red
      else
        set color green
    end
  end

  echo -n (set_color $color) '▲' (set_color normal)
end
