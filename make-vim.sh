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

make distclean \
  | tee vim_make_distclean.log

./configure \
  --enable-cscope \
  --enable-fail-if-missing \
  --enable-luainterp=yes \
  --enable-perlinterp=yes \
  --enable-python3interp=yes \
  --enable-rubyinterp=yes \
  --prefix=${INSTALL_DIR} \
  --with-compiledby=uhooi \
  --with-lua-prefix=/opt/homebrew/Cellar/lua/5.4.6 \
  --with-tlib=ncurses \
  | tee vim_configure.log

make \
  | tee vim_make.log

make install prefix=${INSTALL_DIR} \
  | tee vim_make_install.log

cd ${CURRENT_DIR}

# }}}
