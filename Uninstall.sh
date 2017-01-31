#!bin/sh

# ----
# dotfilesのシンボリックリンクを削除する
# 引数：なし
# 戻値：なし
# 備考：
# ----

# dotfilesのシンボリックリンクを削除する
rm ~/.vimrc
rm ~/.gvimrc
rm -r ~/.vim/config
rm ~/.bash_profile
rm ~/.gemrc
rm ~/.sqliterc
rm ~/.gitignore
rm ~/.svnignore

