# make fish default shell
set -gx SHELL (which fish)

# add local executables to PATH
if test -d $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end

# configure fzf search command
set -gx FZF_DEFAULT_COMMAND 'ag -l --nocolor -g ""'
