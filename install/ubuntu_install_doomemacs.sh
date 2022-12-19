#!/usr/bin/env bash

# remove old package
sudo apt remove --autoremove emacs emacs-common

# install emacs28-nativecomp
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs28-nativecomp

# install prerequisites
sudo apt install git fd-find ripgrep

# install doomemacs
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
pushd ~/.emacs.d
wget https://gist.github.com/ricmli/0e3ecc863ba48900108b3d69b8654a4d/raw/79742992fb3ab3f118607422dddb4fadd637aa52/0001-fix-lsp-avoid-memory-leak-in-flycheck-eglot.patch
git am 0001-fix-lsp-avoid-memory-leak-in-flycheck-eglot.patch
popd
~/.emacs.d/bin/doom install

# sync with my own config files
git clone https://github.com/ricardomlee/.doom.d.git ~/.doom.d
~/.emacs.d/bin/doom sync
