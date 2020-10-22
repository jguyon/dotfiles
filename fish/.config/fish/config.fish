# configure fzf to use ripgrep
set -gx FZF_DEFAULT_COMMAND rg --files --hidden --iglob !.git --sort path

# configure bat to use terminal colors
set -gx BAT_THEME ansi-dark

# fnm
if test -d $HOME/.fnm
  set PATH $HOME/.fnm $PATH
  fnm env --multi --use-on-cd | source
end

# supress greeting message
if status --is-interactive
  set fish_greeting
end

# dracula theme
# https://github.com/dracula/dracula-theme
set dracula_background "#282a36"
set dracula_selection "#44475a"
set dracula_foreground "#f8f8f2"
set dracula_comment "#6272a4"
set dracula_cyan "#8be9fd"
set dracula_green "#50fa7b"
set dracula_orange "#ffb86c"
set dracula_pink "#ff79c6"
set dracula_purple "#bd93f9"
set dracula_red "#ff5555"
set dracula_yellow "#f1fa8c"
if status --is-interactive
  set fish_color_normal $dracula_foreground
  set fish_color_command $dracula_purple --bold
  set fish_color_quote $dracula_yellow
  set fish_color_redirection $dracula_pink
  set fish_color_end $dracula_comment
  set fish_color_error $dracula_red
  set fish_color_param $dracula_foreground
  set fish_color_comment $dracula_comment
  set fish_color_match $dracula_yellow
  set fish_color_selection $dracula_yellow
  set fish_color_search_match --background=$dracula_selection
  set fish_color_operator $dracula_cyan
  set fish_color_escape $dracula_green
  set fish_color_cwd $dracula_comment
  set fish_color_cwd_root $dracula_red
  set fish_color_autosuggestion $dracula_comment
  set fish_color_user $dracula_yellow
  set fish_color_host $dracula_cyan
  set fish_color_host_remote $dracula_purple
  set fish_color_cancel $dracula_purple
  set fish_color_history_current --bold
  set fish_color_status $dracula_red
  set fish_color_valid_path --underline
  set fish_pager_color_prefix $dracula_yellow
  set fish_pager_color_completion $dracula_foreground
  set fish_pager_color_description $dracula_comment
  set fish_pager_color_progress $dracula_green
  set fish_pager_color_secondary $dracula_comment
end

# use vim mode
if status --is-interactive
  fish_vi_key_bindings
end
