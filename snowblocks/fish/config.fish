# add local executables to PATH
if test -d $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end

# add yarn executables to PATH
if type -q yarn
  set -gx PATH (yarn global bin) $PATH
end
