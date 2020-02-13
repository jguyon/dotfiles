# make fish default shell
set -gx SHELL (which fish)

# make neovim default editor
set -gx EDITOR nvim

# add local executables to PATH
if test -d $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end

# fnm
if status --is-interactive && test -d $HOME/.fnm
  set PATH $HOME/.fnm $PATH
  fnm env --multi --use-on-cd | source

  if test -e (pwd)/.nvmrc
    echo "fnm: Found .nvmrc"
    fnm use
  end

  if test -e (pwd)/.node-version
    echo "fnm: Found .node-version"
    fnm use
  end
end

# supress greeting message
set fish_greeting

# syntax highlighting
if test -z $COLORS_ARE_SET_UP
  # if the user has manually changed the colors, we don't want to
  # reset them when they open a child shell
  set -gx COLORS_ARE_SET_UP true

  set fish_color_normal normal
  set fish_color_command blue --bold
  set fish_color_quote green
  set fish_color_redirection blue
  set fish_color_end magenta
  set fish_color_error red
  set fish_color_param normal
  set fish_color_comment brblack
  set fish_color_match yellow
  set fish_color_selection yellow
  set fish_color_search_match --background=brblack
  set fish_color_operator cyan
  set fish_color_escape green
  set fish_color_cwd brwhite
  set fish_color_autosuggestion brblack
  set fish_color_user yellow
  set fish_color_host cyan
  set fish_color_cancel magenta
  set fish_pager_color_prefix yellow
  set fish_pager_color_completion normal
  set fish_pager_color_description brblack
  set fish_pager_color_progress magenta
  set fish_pager_color_secondary brblack
end

# use vim mode
if test -z $VI_MODE_IS_SET_UP
  # if the user has reverted to default key bindings, we don't want to
  # reset to vi key bindings when they open a child shell
  set -gx VI_MODE_IS_SET_UP true
  fish_vi_key_bindings
end
