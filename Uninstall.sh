#!bin/sh
cd $(cd $(dirname $0); pwd)

# ----
# dotfilesのシンボリックリンクを削除する
# 引数：なし
# 戻値：なし
# 備考：
# ----

# dotfilesのシンボリックリンクを削除する
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.vim/config
rm ~/.bash_profile
rm ~/.gemrc
rm ~/.sqliterc
rm ~/.gitignore
rm ~/.svnignore


exit

