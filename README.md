# jguyon's dotfiles

```sh
# install nix and git
curl https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix-env -iA gitAndTools.gitFull -f '<nixpkgs>'

# clone the repo
git clone git@github.com:jguyon/dotfiles.git ~/.dotfiles --recursive
cd ~/.dotfiles

# bootstrap everything
./bootstrap
```
