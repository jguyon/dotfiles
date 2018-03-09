NIX = nix-env -iA
STOW = stow -S -R

all: core git fish tmux nvim node javascript bucklescript

.PHONY: all core git fish tmux nvim node javascript bucklescript

core:
	$(NIX) \
		nixpkgs.coreutils \
		nixpkgs.man \
		nixpkgs.findutils \
		nixpkgs.gnugrep \
		nixpkgs.bash

git:
	$(NIX) nixpkgs.gitAndTools.gitFull
	$(STOW) -t ~ git

fish:
	$(NIX) nixpkgs.fish
	mkdir -p ~/.config/fish
	$(STOW) -t ~/.config/fish fish

tmux:
	$(NIX) nixpkgs.tmux
	$(STOW) -t ~ tmux

nvim:
	$(NIX) \
		nixpkgs.neovim \
		nixpkgs.python27Packages.neovim \
		nixpkgs.python36Packages.neovim
	mkdir -p ~/.config/nvim
	$(STOW) -t ~/.config/nvim nvim
	[ -e ~/.local/share/nvim/site/autoload/plug.vim ] || \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim --headless '+PlugInstall --sync' +qa

node:
	$(NIX) \
		nixpkgs.nodejs-9_x \
		nixpkgs.yarn

javascript: node
	yarn global add \
		javascript-typescript-langserver \
		prettier

bucklescript: node
	yarn global add \
		https://github.com/reasonml/reason-cli/archive/3.0.4-bin-linux.tar.gz \
		bs-platform \
		ocaml-language-server
