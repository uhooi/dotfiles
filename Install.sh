#!bin/sh

# ----
# dotfilesのシンボリックリンクを作成する
# 引数: なし
# 戻値: なし
# 備考: なし
# ----

SCRIPT_DIR_PATH=$(cd $(dirname $0);pwd)

# dotfilesのシンボリックリンクを作成する
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.vimrc
ln -fns ${SCRIPT_DIR_PATH}/.gvimrc ~/.gvimrc
ln -fns ${SCRIPT_DIR_PATH}/.xvimrc ~/.xvimrc
ln -fns ${SCRIPT_DIR_PATH}/.ideavimrc ~/.ideavimrc
mkdir ~/.vim
ln -fns ${SCRIPT_DIR_PATH}/.vim/config ~/.vim/config
ln -fns ${SCRIPT_DIR_PATH}/.vim/snippets ~/.vim/snippets
mkdir ~/.config
ln -fns ${SCRIPT_DIR_PATH}/.config/nvim ~/.config/nvim
ln -fns ${SCRIPT_DIR_PATH}/.config/alacritty ~/.config/alacritty
ln -fns ${SCRIPT_DIR_PATH}/.config/efm-langserver ~/.config/efm-langserver
ln -fns ${SCRIPT_DIR_PATH}/.config/ranger ~/.config/ranger
ln -fns ${SCRIPT_DIR_PATH}/.bash_profile ~/.bash_profile
ln -fns ${SCRIPT_DIR_PATH}/.bashrc ~/.bashrc
ln -fns ${SCRIPT_DIR_PATH}/.inputrc ~/.inputrc
ln -fns ${SCRIPT_DIR_PATH}/.sqliterc ~/.sqliterc
ln -fns ${SCRIPT_DIR_PATH}/.xpdfrc ~/.xpdfrc
ln -fns ${SCRIPT_DIR_PATH}/.gitignore ~/.gitignore
ln -fns ${SCRIPT_DIR_PATH}/.svnignore ~/.svnignore
ln -fns ${SCRIPT_DIR_PATH}/.gitconfig ~/.gitconfig
ln -fns ${SCRIPT_DIR_PATH}/.wezterm.lua ~/.wezterm.lua
ln -fns ${SCRIPT_DIR_PATH}/.hyper.js ~/.hyper.js
ln -fns ${SCRIPT_DIR_PATH}/.swift-package-complete.bash ~/.swift-package-complete.bash
# AquaSKK
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/kana-rule.conf ~/Library/Application\ Support/AquaSKK/kana-rule.conf
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/keymap.conf ~/Library/Application\ Support/AquaSKK/keymap.conf
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/SKK-JISYO.jawiki ~/Library/Application\ Support/AquaSKK/SKK-JISYO.jawiki
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/SKK-JISYO.emoji.utf8 ~/Library/Application\ Support/AquaSKK/SKK-JISYO.emoji.utf8

source ~/.bash_profile

# dein.vimをインストールする
# ref: https://github.com/Shougo/dein.vim#quick-start
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm -f ./installer.sh

if [ "$(uname)" == 'Darwin' ]; then
  # スクリーンショットの撮影時に影を含めない
  defaults write com.apple.screencapture disable-shadow -bool true

  # Finderで隠しファイルを表示する
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Xcodeでビルドにかかった時間を表示する
  defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

  # シミュレータにタップジェスチャーを表示する
  defaults write com.apple.iphonesimulator ShowSingleTouches 1

  # Swiftプロジェクトのビルドを速くする
  defaults write com.apple.dt.XCBuild EnableSwiftBuildSystemIntegration 1

  # SystemUIServerを再起動して設定を反映させる
  killall SystemUIServer

  # Homebrewをインストールする
  # ref: https://docs.brew.sh/Installation
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  source ~/.bash_profile

  # Homebrewで管理しているパッケージをインストールする
  # ref: https://tech.gootablog.com/article/homebrew-brewfile/
  brew bundle

  source ~/.bash_profile
fi

