#!bin/sh

# ----
# dotfilesのシンボリックリンクを削除する
# 引数: なし
# 戻値: なし
# 備考: なし
# ----

# dotfilesのシンボリックリンクを削除する
/bin/rm ~/.vimrc
/bin/rm ~/.gvimrc
/bin/rm ~/.xvimrc
/bin/rm ~/.ideavimrc
/bin/rm -r ~/.vim/config
/bin/rm -r ~/.vim/snippets
/bin/rm -r ~/.config/nvim
/bin/rm -r ~/.config/alacritty
/bin/rm -r ~/.config/efm-langserver
/bin/rm -r ~/.config/ranger
/bin/rm ~/.bash_profile
/bin/rm ~/.bashrc
/bin/rm ~/.inputrc
/bin/rm ~/.sqliterc
/bin/rm ~/.xpdfrc
/bin/rm ~/.gitignore
/bin/rm ~/.svnignore
/bin/rm ~/.wezterm.lua
/bin/rm ~/.hyper.js
/bin/rm ~/.swift-package-complete.bash
# macSKK
/bin/rm ~/Library/Containers/net.mtgto.inputmethod.macSKK
# AquaSKK
/bin/rm ~/Library/Application\ Support/AquaSKK
# Claude Code
/bin/rm ~/.claude/settings.json

# dein.vimをアンインストールする
/bin/rm -r ~/.cache/dein

if [ "$(uname)" == 'Darwin' ]; then
  # 環境設定を削除する
  defaults delete com.apple.screencapture disable-shadow
  defaults delete com.apple.finder AppleShowAllFiles
  defaults delete com.apple.dt.XCBuild EnableSwiftBuildSystemIntegration
  defaults delete com.apple.iphonesimulator ShowSingleTouches
  defaults delete com.apple.dt.XCBuild EnableSwiftBuildSystemIntegration
  killall SystemUIServer

  # Homebrewをアンインストールする
  # ref: https://github.com/homebrew/install#uninstall-homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi

