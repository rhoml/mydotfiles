#!/bin/sh

set -e

WHOAMI=$(whoami)
SPACEMACS_DIR="/Users/${WHOAMI}/.emacs.d"
OH_MY_ZSH_DIR="/Users/${WHOAMI}/.oh-my-zsh"
TMUX_TPM_DIR="/Users/${WHOAMI}/.tmux/plugins/tpm"
ZSH_CUSTOM_THEMES_DIR="/Users/${WHOAMI}/.oh-my-zsh/custom/themes/powerlevel9k"
ZSH_CUSTOM_PLUGINS_DIR="/Users/${WHOAMI}/.oh-my-zsh/custom/plugins"
FONTS_CUSTOM_DIR="/Users/${WHOAMI}/.dotfiles/fonts"
FONTS_LOCAL_DIR="/Users/${WHOAMI}/Library/Fonts"

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

# Validate .oh-my-zsh custom theme is present
if [ ! -d ${ZSH_CUSTOM_THEMES_DIR} ]; then
    echo "Installing custom theme..."
    git clone git@github.com:Powerlevel9k/powerlevel9k.git ${ZSH_CUSTOM_THEMES_DIR}
fi

# Validate .oh-my-zsh custom plugins is present
if [ ! -d ${ZSH_CUSTOM_PLUGINS_DIR} ]; then
    echo "Installing custom plugins..."
    git clone git@github.com:mroth/evalcache.git ${ZSH_CUSTOM_PLUGINS_DIR}
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
/opt/homebrew/bin/brew bundle install -v --global

# Set zsh as the default shell
chsh -s /bin/zsh

echo "Installing tmux plugins..."
bash $TMUX_TPM_DIR/bin/install_plugins

echo "Creating directory tree for Development..."
/usr/bin/rake working_dir

echo "Installing fonts..."
cp ${FONTS_CUSTOM_DIR}/*.{otf,ttf} ${FONTS_LOCAL_DIR}/

echo "Done."
