#!bin/sh

# ----
# NeovimのHEADをインストールする
# 引数: なし
# 戻値: なし
# 備考: なし
# 参考: https://qiita.com/uhooi/items/95ffbfc1270df79f1fbd
# ----

CURRENT_DIR=`dirname $0`
NVIM_ROOT=${HOME}/ghq/github.com/neovim/neovim

cd ${NVIM_ROOT}

git fetch --prune origin
git rebase origin/master

make \
  CMAKE_BUILD_TYPE=Release \
  CMAKE_INSTALL_PREFIX=${HOME}/.local/nvim

make install

cd ${CURRENT_DIR}
