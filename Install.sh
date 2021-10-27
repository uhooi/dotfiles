#!bin/sh

# ----
# dotfilesのシンボリックリンクを作成する
# 引数：なし
# 戻値：なし
# 備考：
# ----

SCRIPT_DIR_PATH=$(cd $(dirname $0);pwd)

# dotfilesのシンボリックリンクを作成する
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.vimrc
mkdir ~/.config
mkdir ~/.config/nvim
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.config/nvim/init.vim
ln -fns ${SCRIPT_DIR_PATH}/.gvimrc ~/.gvimrc
ln -fns ${SCRIPT_DIR_PATH}/.xvimrc ~/.xvimrc
ln -fns ${SCRIPT_DIR_PATH}/.ideavimrc ~/.ideavimrc
mkdir ~/.vim
ln -fns ${SCRIPT_DIR_PATH}/.vim/config ~/.vim/config
ln -fns ${SCRIPT_DIR_PATH}/.vim/snippets ~/.vim/snippets
ln -fns ${SCRIPT_DIR_PATH}/.config/ranger ~/.config/ranger
ln -fns ${SCRIPT_DIR_PATH}/.bash_profile ~/.bash_profile
ln -fns ${SCRIPT_DIR_PATH}/.bashrc ~/.bashrc
ln -fns ${SCRIPT_DIR_PATH}/.inputrc ~/.inputrc
ln -fns ${SCRIPT_DIR_PATH}/.sqliterc ~/.sqliterc
ln -fns ${SCRIPT_DIR_PATH}/.xpdfrc ~/.xpdfrc
ln -fns ${SCRIPT_DIR_PATH}/.gitignore ~/.gitignore
ln -fns ${SCRIPT_DIR_PATH}/.svnignore ~/.svnignore
ln -fns ${SCRIPT_DIR_PATH}/.gitconfig ~/.gitconfig
ln -fns ${SCRIPT_DIR_PATH}/.hyper.js ~/.hyper.js
ln -fns ${SCRIPT_DIR_PATH}/.swift-package-complete.bash ~/.swift-package-complete.bash

# HomebrewでインストールしたGitのdiff-highlightのシンボリックリンクを貼る
# 参考：https://udomomo.hatenablog.com/entry/2019/12/01/181404
if [ "$(uname)" == 'Darwin' ]; then
  sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
fi

