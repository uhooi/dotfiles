#!bin/sh
cd $(cd $(dirname $0); pwd)

# ----
# dotfilesのシンボリックリンクを作成する
# 引数：なし
# 戻値：なし
# 備考：
# ----

# dotfilesのシンボリックリンクを作成する
ln -s .vimrc ~/.vimrc
ln -s .gvimrc ~/.gvimrc
mkdir ~/.vim
ln -s .vim/config ~/.vim/config
ln -s .bash_profile ~/.bash_profile
ln -s .gemrc ~/.gemrc
ln -s .sqliterc ~/.sqliterc
ln -s .gitignore ~/.gitignore
ln -s .svnignore ~/.svnignore


exit

