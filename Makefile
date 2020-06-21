SHELL = /bin/bash
STOW = stow --no-folding -t ~ -R

all: git fish nvim alacritty qutebrowser sway

git:
	$(STOW) git

fish:
	$(STOW) fish

nvim:
	$(STOW) nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

alacritty:
	$(STOW) alacritty

qutebrowser:
	$(STOW) qutebrowser

sway:
	$(STOW) sway

.PHONY: all git fish nvim alacritty qutebrowser sway
