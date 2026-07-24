#!/bin/sh

# ----
# dotfilesのシンボリックリンクを作成する
# 引数: なし
# 戻値: なし
# 備考: なし
# ----

SCRIPT_DIR_PATH=$(cd "$(dirname "$0")"; pwd)

# dotfilesのシンボリックリンクを作成する
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.vimrc
ln -fns ${SCRIPT_DIR_PATH}/.gvimrc ~/.gvimrc
ln -fns ${SCRIPT_DIR_PATH}/.xvimrc ~/.xvimrc
ln -fns ${SCRIPT_DIR_PATH}/.ideavimrc ~/.ideavimrc
mkdir -p ~/.vim
ln -fns ${SCRIPT_DIR_PATH}/.vim/config ~/.vim/config
ln -fns ${SCRIPT_DIR_PATH}/.vim/snippets ~/.vim/snippets
mkdir -p ~/.config
ln -fns ${SCRIPT_DIR_PATH}/.config/nvim ~/.config/nvim
ln -fns ${SCRIPT_DIR_PATH}/.config/efm-langserver ~/.config/efm-langserver
ln -fns ${SCRIPT_DIR_PATH}/.config/ranger ~/.config/ranger
ln -fns ${SCRIPT_DIR_PATH}/.config/mise ~/.config/mise
ln -fns ${SCRIPT_DIR_PATH}/.bash_profile ~/.bash_profile
ln -fns ${SCRIPT_DIR_PATH}/.bashrc ~/.bashrc
ln -fns ${SCRIPT_DIR_PATH}/.inputrc ~/.inputrc
ln -fns ${SCRIPT_DIR_PATH}/.sqliterc ~/.sqliterc
ln -fns ${SCRIPT_DIR_PATH}/.xpdfrc ~/.xpdfrc
ln -fns ${SCRIPT_DIR_PATH}/.gitignore ~/.gitignore
ln -fns ${SCRIPT_DIR_PATH}/.svnignore ~/.svnignore
ln -fns ${SCRIPT_DIR_PATH}/.gitconfig ~/.gitconfig
ln -fns ${SCRIPT_DIR_PATH}/.wezterm.lua ~/.wezterm.lua
ln -fns ${SCRIPT_DIR_PATH}/.swift-package-complete.bash ~/.swift-package-complete.bash
mkdir -p ~/.sourcekit-lsp
ln -fns ${SCRIPT_DIR_PATH}/.sourcekit-lsp/config.json ~/.sourcekit-lsp/config.json
# SKK-JISYO.jawikiをダウンロードする
# ∵自動生成の辞書（約26MB）はリポジトリにコミットしないため
# ref: https://github.com/tokuhirom/jawiki-kana-kanji-dict
if [ ! -f ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.jawiki ]; then
  curl -fsSL https://github.com/tokuhirom/jawiki-kana-kanji-dict/releases/latest/download/SKK-JISYO.jawiki -o ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.jawiki
fi

# macSKK
# macOS 14以降、他アプリのコンテナ（~/Library/Containers）はOSに保護されており、
# ターミナルにアクセス権限がないと Operation not permitted でコピーに失敗する
MACSKK_SRC_DATA_PATH=${SCRIPT_DIR_PATH}/Library/Containers/net.mtgto.inputmethod.macSKK/Data
MACSKK_DEST_DATA_PATH=~/Library/Containers/net.mtgto.inputmethod.macSKK/Data
mkdir -p ${MACSKK_DEST_DATA_PATH}/Library/Preferences 2> /dev/null \
  && mkdir -p ${MACSKK_DEST_DATA_PATH}/Documents/Settings 2> /dev/null \
  && mkdir -p ${MACSKK_DEST_DATA_PATH}/Documents/Dictionaries 2> /dev/null \
  && cp ${MACSKK_SRC_DATA_PATH}/Library/Preferences/net.mtgto.inputmethod.macSKK.plist ${MACSKK_DEST_DATA_PATH}/Library/Preferences/net.mtgto.inputmethod.macSKK.plist 2> /dev/null \
  && cp ${MACSKK_SRC_DATA_PATH}/Documents/Settings/kana-rule.conf ${MACSKK_DEST_DATA_PATH}/Documents/Settings/kana-rule.conf 2> /dev/null \
  && cp ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.jawiki ${MACSKK_DEST_DATA_PATH}/Documents/Dictionaries/SKK-JISYO.jawiki 2> /dev/null \
  && cp ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.emoji.utf8 ${MACSKK_DEST_DATA_PATH}/Documents/Dictionaries/SKK-JISYO.emoji.utf8 2> /dev/null
if [ $? -ne 0 ]; then
  echo '警告: macSKKの設定のコピーに失敗しました。' 1>&2
  echo '「システム設定 > プライバシーとセキュリティ > フルディスクアクセス」でターミナルを許可してから、再度実行してください。' 1>&2
fi
# AquaSKK
mkdir -p ~/Library/Application\ Support/AquaSKK
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/kana-rule.conf ~/Library/Application\ Support/AquaSKK/kana-rule.conf
ln -fns ${SCRIPT_DIR_PATH}/Library/Application\ Support/AquaSKK/keymap.conf ~/Library/Application\ Support/AquaSKK/keymap.conf
ln -fns ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.jawiki ~/Library/Application\ Support/AquaSKK/SKK-JISYO.jawiki
ln -fns ${SCRIPT_DIR_PATH}/.dictionaries/SKK-JISYO.emoji.utf8 ~/Library/Application\ Support/AquaSKK/SKK-JISYO.emoji.utf8
# Claude Code
mkdir -p ~/.claude
ln -fns ${SCRIPT_DIR_PATH}/.claude/settings.json ~/.claude/settings.json
ln -fns ${SCRIPT_DIR_PATH}/.claude/statusline-command.sh ~/.claude/statusline-command.sh
ln -fns ${SCRIPT_DIR_PATH}/.claude/skills ~/.claude/skills
# Codex
mkdir -p ~/.codex
mkdir -p ~/.codex/pets
if [ -L ~/.codex/pets/uhooi-blue ]; then
  /bin/rm ~/.codex/pets/uhooi-blue
fi
mkdir -p ~/.codex/pets/uhooi-blue
ln -fns ${SCRIPT_DIR_PATH}/.codex/pets/uhooi-blue/pet.json ~/.codex/pets/uhooi-blue/pet.json
ln -fns ${SCRIPT_DIR_PATH}/.codex/pets/uhooi-blue/spritesheet.webp ~/.codex/pets/uhooi-blue/spritesheet.webp
if [ -L ~/.codex/pets/uhooi ]; then
  /bin/rm ~/.codex/pets/uhooi
fi
mkdir -p ~/.codex/pets/uhooi
ln -fns ${SCRIPT_DIR_PATH}/.codex/pets/uhooi/pet.json ~/.codex/pets/uhooi/pet.json
ln -fns ${SCRIPT_DIR_PATH}/.codex/pets/uhooi/spritesheet.webp ~/.codex/pets/uhooi/spritesheet.webp

# NOTE: `source ~/.bash_profile` は実行しない
# ∵.bash_profileから読み込まれる補完スクリプトはbash専用の記述を含み、
#   sh（POSIXモードのbash）で読み込むとエラーになるため

if [ "$(uname)" = 'Darwin' ]; then
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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Homebrewへのパスを通す
  # ref: https://docs.brew.sh/Installation
  if [ "$(uname -m)" = 'arm64' ]; then
    HOMEBREW_HOME=/opt/homebrew
  else
    HOMEBREW_HOME=/usr/local
  fi
  eval "$(${HOMEBREW_HOME}/bin/brew shellenv)"

  # Homebrewで管理しているパッケージをインストールする
  # ref: https://tech.gootablog.com/article/homebrew-brewfile/
  brew bundle
fi
