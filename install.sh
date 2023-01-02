# Creating this config file because it'll be used.
mkdir $HOME/.config

#Install nix
curl -L https://nixos.org/nix/install | sh

# source nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# install basic stuff
nix-env -iA \
    nixpkgs.antibody \
    nixpkgs.asdf-vm \
    nixpkgs.bat \
    nixpkgs.bottom \
    nixpkgs.direnv \
    nixpkgs.elixir \
    nixpkgs.python \
    nixpkgs.fzf \
    nixpkgs.gdu \
    nixpkgs.git \
    nixpkgs.git-extras \
    nixpkgs.go \
    nixpkgs.lazygit \
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

# TODO() -> Change antibody for antidote because it was deprecated
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Develop installation of plugins.

# Configure AstroNvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
