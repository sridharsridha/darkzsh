#!/bin/bash -
###############################################################################
# setup.sh
# This script creates everything needed to setup this dotfiles
###############################################################################

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

echo "Installing zsh..."

git submodule update --init --recursive

# Install git config
echo ln -s ${PWD}/zsh_modules ~/.zsh_modules
ln -s ${PWD}/zsh_modules ~/.zsh_modules
echo ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/zshrc ~/.zshrc
