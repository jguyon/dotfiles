set __fish_git_prompt_color_branch blue

set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_stateseparator ' '

set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_color_upstream_behind yellow
set __fish_git_prompt_char_upstream_behind '↓'

set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_char_untrackedfiles '*'

set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_char_dirtystate '±'

set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_char_stagedstate '⇈'

set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_color_cleanstate brwhite
set __fish_git_prompt_char_cleanstate '✔'

function fish_prompt
  set -l exit_code $status
  set -l prompt

  # display username and hostname if logged in as root, in sudo or ssh session
  if [ \( (id -u) -eq 0 -o $SUDO_USER \) -o $SSH_CONNECTION ]
    set -l user (set_color yellow)$USER
    set -l sep (set_color brwhite)@
    set -l host (set_color cyan)(prompt_hostname)
    set prompt $prompt $user$sep$host
  end

  # path
  set prompt $prompt (set_color brwhite)(prompt_pwd)

  # git
  set -l branch_color (set_color $__fish_git_prompt_color_branch)
  set prompt $prompt (__fish_git_prompt $branch_color'%s')

  # prompt symbol
  if [ $exit_code != 0 ]
    set prompt $prompt (set_color red)●
  else
    set prompt $prompt (set_color green)●
  end

  echo -n $prompt (set_color normal)
end
