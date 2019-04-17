# toggle fullscreen
function f
  if type -q wmctrl
    wmctrl -r :ACTIVE: -b toggle,fullscreen
  else
    echo "Please install wmctrl to toggle fullscreen"
    false
  end
end
