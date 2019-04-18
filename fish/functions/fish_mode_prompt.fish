function fish_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
	switch $fish_bind_mode
	  case default
		set_color cyan
		echo n
	  case insert
		set_color brwhite
		echo i
	  case replace_one
		set_color yellow
		echo r
	  case visual
		set_color brcyan
		echo v
	end

	echo " ♦ "
	set_color normal
  else
	fish_default_mode_prompt
  end
end
