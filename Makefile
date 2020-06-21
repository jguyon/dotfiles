SHELL = /bin/bash
STOW = stow --no-folding -t ~ -R

all: git fish tmux nvim alacritty i3 sway

git:
	$(STOW) git

fish:
	$(STOW) fish

tmux:
	$(STOW) tmux
	if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi

nvim:
	$(STOW) nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

alacritty:
	$(STOW) alacritty

i3:
	$(STOW) i3

sway:
	$(STOW) sway

.PHONY: all git fish tmux nvim alacritty i3 sway
