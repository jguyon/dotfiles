function fish_mode_prompt
  set -l color
  set -l mode

  switch $fish_bind_mode
    case default
      set color magenta
      set mode n
    case replace_one
      set color yellow
      set mode r
    case visual
      set color green
      set mode v
    case '*'
      set color cyan
      set mode i
  end

  echo -n (set_color $color)"($mode) "
end
