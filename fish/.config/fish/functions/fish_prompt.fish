function fish_prompt
  set -l color
  if [ $status != 0 ]
    set color $dracula_red
  else
    set color $dracula_green
  end

  set -l pwd (prompt_pwd)

  echo -n (set_color normal)$pwd(set_color $color) '●' (set_color normal)
end
