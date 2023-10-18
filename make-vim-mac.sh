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
  --enable-cscope \
  --enable-fail-if-missing \
  --enable-luainterp=yes \
  --with-lua-prefix=/opt/homebrew/Cellar/lua/5.4.6 \
  --enable-perlinterp=yes \
  --enable-python3interp=yes \
  --with-python3-command=python \
  --enable-rubyinterp=yes \
  --prefix=${INSTALL_DIR} \
  --with-compiledby=uhooi \
  --with-tlib=ncurses \
  CFLAGS='-I/opt/homebrew/include'

make

make install prefix=${INSTALL_DIR}

cd ${CURRENT_DIR}

# }}}
