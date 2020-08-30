# fnm
if status --is-interactive && test -d $HOME/.fnm
  set PATH $HOME/.fnm $PATH
  fnm env --multi --use-on-cd | source
end

# supress greeting message
if status --is-interactive
  set fish_greeting
end

# syntax highlighting
if status --is-interactive
  set fish_color_normal normal
  set fish_color_command blue --bold
  set fish_color_quote green
  set fish_color_redirection magenta
  set fish_color_end white
  set fish_color_error brred
  set fish_color_param normal
  set fish_color_comment brblack
  set fish_color_match yellow
  set fish_color_selection yellow
  set fish_color_search_match --background=brblack
  set fish_color_operator cyan
  set fish_color_escape green
  set fish_color_cwd white
  set fish_color_cwd_root red
  set fish_color_autosuggestion brblack
  set fish_color_user yellow
  set fish_color_host cyan
  set fish_color_host_remote magenta
  set fish_color_cancel magenta
  set fish_color_history_current --bold
  set fish_color_status red
  set fish_color_valid_path --underline
  set fish_pager_color_prefix yellow
  set fish_pager_color_completion normal
  set fish_pager_color_description brblack
  set fish_pager_color_progress magenta
  set fish_pager_color_secondary brblack
end

# use vim mode
if status --is-interactive
  fish_vi_key_bindings
end
