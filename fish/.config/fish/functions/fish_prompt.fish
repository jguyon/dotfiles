function fish_prompt
  set -l color
  if [ $status != 0 ]
    set color red
  else
    set color green
  end

  set -l pwd (prompt_pwd)

  echo -n (set_color white)$pwd(set_color $color) '▲' (set_color normal)
end
