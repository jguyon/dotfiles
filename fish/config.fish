# make fish default shell
set -gx SHELL (which fish)

# make neovim default editor
set -gx EDITOR nvim

# add local executables to PATH
if test -d $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end

# add binaries installed with yarn to PATH
if type -q yarn
  set -gx PATH (yarn global bin) $PATH
end

# use vim mode
if test -z $VI_MODE_IS_SET_UP
  # if the user has reverted to default key bindings, we don't want to
  # reset to vi key bindings when they open a child shell
  set -gx VI_MODE_IS_SET_UP true
  fish_vi_key_bindings
end
