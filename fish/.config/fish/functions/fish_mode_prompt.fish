function fish_mode_prompt
  set -l color
  set -l mode

  switch $fish_bind_mode
    case default
      set color $dracula_purple
      set mode n
    case replace_one
      set color $dracula_yellow
      set mode r
    case visual
      set color $dracula_green
      set mode v
    case '*'
      set color $dracula_cyan
      set mode i
  end

  echo -n (set_color $color)"($mode) "
end
