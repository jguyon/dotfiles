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
		nixpkgs.gcc \
		nixpkgs.gnumake \
		nixpkgs.bash

git:
	$(NIX) nixpkgs.gitAndTools.gitFull
	$(STOW) -t ~ git

fish:
	$(NIX) nixpkgs.fish
	mkdir -p ~/.config/fish
	$(STOW) -t ~/.config/fish fish

tmux: core fish
	$(NIX) nixpkgs.tmux
	$(STOW) -t ~ tmux
	[ -e ~/.local/share/tmux/plugins/tpm/tpm ] || \
		git clone https://github.com/tmux-plugins/tpm \
		~/.local/share/tmux/plugins/tpm
	~/.local/share/tmux/plugins/tpm/bin/install_plugins

nvim: core
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

node: core
	$(NIX) \
		nixpkgs.nodejs-9_x \
		nixpkgs.yarn

javascript: node
	yarn global add \
		javascript-typescript-langserver \
		prettier

bucklescript: node
	yarn global add \
		reason-cli@3.1.0-$$(uname | tr '[:upper:]' '[:lower:]') \
		bs-platform \
		ocaml-language-server
