SHELL = /bin/bash
OS = none

all: core git fish tmux nvim node bucklescript elm

core: core-$(OS)

core-none:

core-ubuntu:
	sudo apt-get -y install \
		software-properties-common \
		build-essential stow curl

git: core git-$(OS)
	stow -R git -t ~

git-none:

git-ubuntu:
	sudo apt-get -y install git

fish: core fish-$(OS)
	stow -R fish -t ~/.config/fish

fish-none:

fish-ubuntu: core
	sudo add-apt-repository -y ppa:fish-shell/release-2
	sudo apt-get -y install fish

tmux: core git tmux-$(OS)
	stow -R tmux -t ~
	if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi
	~/.tmux/plugins/tpm/bin/install_plugins

tmux-none:

tmux-ubuntu:
	sudo apt-get -y install tmux

nvim: core nvim-$(OS)
	stow -R nvim -t ~/.config/nvim
	if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then \
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi
	nvim --headless +PlugInstall +qa

nvim-none:

nvim-ubuntu: core
	sudo add-apt-repository -y -u ppa:neovim-ppa/stable
	sudo apt-get -y install \
		silversearcher-ag \
		neovim \
		python-dev python-pip \
		python3-dev python3-pip
	pip install neovim
	pip3 install neovim

node: node-$(OS)

node-none:

node-ubuntu: core
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
		sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update
	sudo apt-get -y install nodejs yarn
	yarn global add prettier javascript-typescript-langserver

bucklescript: bucklescript-$(OS)

bucklescript-none:

bucklescript-ubuntu: node
	yarn global add bs-platform ocaml-language-server reason-cli@3.2.0-linux

elm: elm-$(OS)

elm-none:

elm-ubuntu: node
	yarn global add elm elm-format elm-oracle elm-test

.PHONY: \
	all \
	core core-none core-ubuntu \
	git git-none git-ubuntu \
	fish fish-none fish-ubuntu \
	tmux tmux-none tmux-ubuntu \
	nvim nvim-none nvim-ubuntu \
	node node-none node-ubuntu \
	bucklescript bucklescript-none bucklescript-ubuntu \
	elm elm-none elm-ubuntu
