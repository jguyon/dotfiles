SHELL = /bin/bash
STOW = stow --no-folding -t ~ -R
UNSTOW = stow -t ~ -D
TARGETS = git fish nvim alacritty qutebrowser sway

all: $(TARGETS)

clean: $(TARGETS:%=clean-%)

.PHONY: all clean $(TARGETS) $(TARGETS:%=clean-%)

git:
	$(STOW) git

clean-git:
	$(UNSTOW) git

fish:
	$(STOW) fish

clean-fish:
	$(UNSTOW) fish

nvim:
	$(STOW) nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

clean-nvim:
	$(UNSTOW) nvim
	rm ~/.local/share/nvim/site/autoload/plug.vim

alacritty:
	$(STOW) alacritty

clean-alacritty:
	$(UNSTOW) alacritty

qutebrowser:
	$(STOW) qutebrowser

clean-qutebrowser:
	$(UNSTOW) qutebrowser

sway:
	$(STOW) sway

clean-sway:
	$(UNSTOW) sway
