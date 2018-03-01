#! /usr/bin/env nix-shell
#! nix-shell -i fish -p fish stow gnumake

cd (dirname (status --current-filename))
make
