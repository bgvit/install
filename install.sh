#Install nix
#curl -L https://nixos.org/nix/install | sh

# source nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# install basic stuff
nix-env -iA \
    nixpkgs.antibody \
    nixpkgs.asdf-vm \
    nixpkgs.bat \
    nixpkgs.direnv \
    nixpkgs.fzf \
    nixpkgs.git \
    nixpkgs.git-extras \
    nixpkgs.neovim \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.tmux \
    nixpkgs.zsh \

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

source .zshrc
cp .zsh_plugins.txt ~

# install antibody plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh