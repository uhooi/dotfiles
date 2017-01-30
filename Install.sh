#!bin/sh
cd $(cd $(dirname $0); pwd)

# ----
# dotfilesのシンボリックリンクを作成する
# 引数：なし
# 戻値：なし
# 備考：
# ----

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# dotfilesのシンボリックリンクを作成する
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
ln -s $SCRIPT_DIR/.gvimrc ~/.gvimrc
mkdir ~/.vim
ln -s $SCRIPT_DIR/.vim/config ~/.vim/config
ln -s $SCRIPT_DIR/.bash_profile ~/.bash_profile
ln -s $SCRIPT_DIR/.gemrc ~/.gemrc
ln -s $SCRIPT_DIR/.sqliterc ~/.sqliterc
ln -s $SCRIPT_DIR/.gitignore ~/.gitignore
ln -s $SCRIPT_DIR/.svnignore ~/.svnignore


exit

