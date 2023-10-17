#!bin/sh

# ----
# VimのHEADをビルドしてインストールする
# 引数: なし
# 戻値: なし
# 備考: なし
# 参考: なし
# ----

# Variables {{{

CURRENT_DIR=`dirname $0`
ROOT=${HOME}/ghq/github.com/vim/vim
INSTALL_DIR=${HOME}/.local/vim
MAIN_BRANCH=master

# }}}

# Main {{{

cd ${ROOT}

git fetch --prune origin
git rebase origin/${MAIN_BRANCH}

cd src/

make distclean

./configure \
  --prefix=${INSTALL_DIR} \
  --with-features=huge \
  --enable-gui=gtk2 \
  --enable-perlinterp \
  --enable-pythoninterp \
  --enable-python3interp \
  --enable-rubyinterp \
  --enable-luainterp \
  --with-luajit \
  --enable-fail-if-missing

make

make install prefix=${INSTALL_DIR}

cd ${CURRENT_DIR}

# }}}
