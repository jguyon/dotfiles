SHELL = /bin/bash

all: git fish tmux nvim

git:
	stow -R git -t ~

fish:
	stow -R fish -t ~/.config/fish

tmux:
	stow -R tmux -t ~
	if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi

nvim:
	stow -R nvim -t ~/.config/nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

.PHONY: all git fish tmux nvim
