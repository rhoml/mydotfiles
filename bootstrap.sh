#!/bin/sh

set -e

WHOAMI=$(whoami)
SPACEMACS_DIR="/Users/${WHOAMI}/.emacs.d"
OH_MY_ZSH_DIR="/Users/${WHOAMI}/.oh-my-zsh"
TMUX_TPM_DIR="/Users/${WHOAMI}/.tmux/plugins/tpm"

# Validate .emacs.d is present if not clone spacemacs
if [ ! -d ${SPACEMACS_DIR} ]; then
    echo "Installing Spacemacs..."
    git clone git@github.com:syl20bnr/spacemacs.git ${SPACEMACS_DIR}
fi

# Validate Homebrew is installed
if [ ! $(which brew) ]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Validate .oh-my-zsh is present
if [ ! -d ${OH_MY_ZSH_DIR} ]; then
    echo "Installing oh-my-zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ${OH_MY_ZSH_DIR}
fi

# Validate TMUX TPM is present
if [ ! -d ${TMUX_TPM_DIR} ]; then
    echo "Installing tmux tpm..."
    git clone https://github.com/tmux-plugins/tpm ${TMUX_TPM_DIR}
fi

echo "Installing all dotfiles"
/usr/bin/rake link

# Install Homebrew dependencies
echo "Installing all dependencies via Homebrew..."
/usr/local/bin/brew bundle install -v --global

# Set zsh as the default shell
chsh -s /bin/zsh

echo "Installing tmux plugins..."
bash $TMUX_TPM_DIR/bin/install_plugins

echo "Done."
