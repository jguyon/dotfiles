function fish_mode_prompt
  if [ "$fish_key_bindings" = "fish_vi_key_bindings" ]
    set -l mode

    switch $fish_bind_mode
      case default
        set mode (set_color magenta)n
      case insert
        set mode (set_color cyan)i
      case replace_one
        set mode (set_color red)r
      case visual
        set mode (set_color green)v
    end

    echo -n $mode ♦ (set_color normal)
  else
    fish_default_mode_prompt
  end
end
