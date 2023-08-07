
#!bin/sh

# ----
# Neovimをクリーンする
# 引数: なし
# 戻値: なし
# 備考: なし
# 参考: https://qiita.com/uhooi/items/95ffbfc1270df79f1fbd#xcodeappが存在しない
# ----

# Variables {{{

CURRENT_DIR=`dirname $0`
NVIM_ROOT=${HOME}/ghq/github.com/neovim/neovim

# }}}

# Main {{{

cd ${NVIM_ROOT}
make distclean
cd ${CURRENT_DIR}

# }}}

