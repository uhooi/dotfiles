#!bin/sh

# ----
# dotfilesのシンボリックリンクを削除する
# 引数：なし
# 戻値：なし
# 備考：
# ----

# dotfilesのシンボリックリンクを削除する
rm ~/.vimrc
rm ~/.config/nvim/init.vim
rm ~/.gvimrc
rm ~/.xvimrc
rm ~/.ideavimrc
rm -r ~/.vim/config
rm -r ~/.vim/snippets
rm -r ~/.config/ranger
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.inputrc
rm ~/.sqliterc
rm ~/.xpdfrc
rm ~/.gitignore
rm ~/.svnignore
rm ~/.hyper.js

if [ "$(uname)" == 'Darwin' ]; then
  # 環境設定を削除する
  defaults delete com.apple.screencapture disable-shadow
  defaults delete com.apple.finder AppleShowAllFiles
  defaults delete com.apple.dt.XCBuild EnableSwiftBuildSystemIntegration
  killall SystemUIServer

  # Homebrewをアンインストールする
  # 参考：https://github.com/homebrew/install#uninstall-homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
