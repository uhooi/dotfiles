# Git
# ターミナルのプロンプトにGitの情報を表示できるようにする
# 参考：http://qiita.com/varmil/items/9b0aeafa85975474e9b6
source /usr/local/etc/bash_completion.d/git-prompt.sh

# 表示するGit情報に以下のマークを追加する
# *：addされていない変更がある
# +：addされているがcommitされていない変更がある
GIT_PS1_SHOWDIRTYSTATE=true

# ターミナルでGitのタブ補完を有効にする
# 参考：http://qiita.com/koyopro/items/3fce94537df2be6247a3
source /usr/local/etc/bash_completion.d/git-completion.bash

