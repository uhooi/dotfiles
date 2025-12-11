#!/bin/sh

# ----
# NeovimのHEADをビルドしてインストールする
# 引数: なし
# 戻値: なし
# 備考: なし
# 参考: https://qiita.com/uhooi/items/95ffbfc1270df79f1fbd
# ----

# Variables {{{

CURRENT_DIR=`dirname $0`
ROOT=${HOME}/ghq/github.com/neovim/neovim
INSTALL_DIR=${HOME}/.local/nvim
MAIN_BRANCH=master

# }}}

# Main {{{

cd ${ROOT}

git fetch --prune origin
git rebase origin/${MAIN_BRANCH}

make \
  CMAKE_BUILD_TYPE=Release \
  CMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  DEPS_CMAKE_FLAG='-DUSE_BUNDLED_TS_PARSERS=OFF'

make install

cd ${CURRENT_DIR}

nvim --version

# }}}
