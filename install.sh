# Creating this config file because it'll be used.
mkdir $HOME/.config
mkdir $HOME/.config/zsh

#Install nix
curl -L https://nixos.org/nix/install | sh

# source nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# install basic stuff
nix-env -iA \
    nixpkgs.alacritty \ #On mac doesn't create shortcut.app
    nixpkgs.antibody \
    nixpkgs.asdf-vm \
    nixpkgs.bat \
    nixpkgs.bottom \
    nixpkgs.dbeaver \
    nixpkgs.direnv \
    nixpkgs.elixir \
    nixpkgs.exa \
    nixpkgs.python \
    nixpkgs.gdu \
    nixpkgs.git \
    nixpkgs.git-extras \
    nixpkgs.go \
    nixpkgs.jetbrains.idea-community \
    nixpkgs.jetbrains.idea-ultimate \
    nixpkgs.kubectl \
    nixpkgs.kubectx \
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

#install zinit, zsh manager
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
exec zsh
zinit self-update

# Develop installation of plugins.

# Configure AstroNvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync