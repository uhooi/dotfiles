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

source ~/.bash_profile

# dein.vimをインストールする
# 参考：https://github.com/Shougo/dein.vim#quick-start
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
  # 参考：https://docs.brew.sh/Installation
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  source ~/.bash_profile

  # Homebrewで管理しているパッケージをインストールする
  # 参考：https://tech.gootablog.com/article/homebrew-brewfile/
  brew bundle

  source ~/.bash_profile
fi

