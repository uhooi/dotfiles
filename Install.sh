#!bin/sh

# ----
# dotfilesのシンボリックリンクを作成する
# 引数：なし
# 戻値：なし
# 備考：
# ----

# dotfilesのシンボリックリンクを作成する
ln -s $0/.vimrc ~/.vimrc
ln -s $0/.gvimrc ~/.gvimrc
mkdir ~/.vim
ln -s $0/.vim/config ~/.vim/config
ln -s $0/.bash_profile ~/.bash_profile
ln -s $0/.gemrc ~/.gemrc
ln -s $0/.sqliterc ~/.sqliterc
ln -s $0/.gitignore ~/.gitignore
ln -s $0/.svnignore ~/.svnignore


exit

