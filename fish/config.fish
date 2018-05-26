# make fish default shell
set -gx SHELL (which fish)

# add local executables to PATH
if test -d $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end

# add binaries installed with yarn to PATH
if type -q yarn
  set -gx PATH (yarn global bin) $PATH
end
