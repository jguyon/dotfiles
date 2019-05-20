SHELL = /bin/bash

all: git fish tmux nvim alacritty

git:
	stow -R git -t ~

fish:
	mkdir -p ~/.config/fish/functions
	stow -R fish -t ~/.config/fish

tmux:
	stow -R tmux -t ~
	if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi

nvim:
	mkdir -p ~/.config/nvim
	stow -R nvim -t ~/.config/nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

alacritty:
	mkdir -p ~/.config/alacritty
	stow -R alacritty -t ~/.config/alacritty

.PHONY: all git fish tmux nvim alacritty
