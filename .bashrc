# CentOS7.3にデフォルトである記述
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# エイリアス
# 参考：http://qiita.com/yutat93/items/b5bb9c0366f21bcbea62
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls --color=auto'
fi

# Git
# ターミナルのプロンプトにGitの情報を表示できるようにする
# 参考：http://qiita.com/varmil/items/9b0aeafa85975474e9b6
# 　　：http://mawatari.jp/archives/git-completion-bash
# 　　：http://qiita.com/UmedaTakefumi/items/fe02d17264de6c78443d
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
# Linux
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  source /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh
fi

# 表示するGit情報に以下のマークを追加する
# *：addされていない変更がある
# +：addされているがcommitされていない変更がある
GIT_PS1_SHOWDIRTYSTATE=true

# ターミナルでGitのタブ補完を有効にする
# 参考：http://qiita.com/koyopro/items/3fce94537df2be6247a3
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
# Linux
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  source /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash
fi

# bash-comletion
# makeコマンドの補完などを有効にする
# 参考：https://qiita.com/notakaos/items/d44a4c2b72625746de25
if [ "$(uname)" == 'Darwin' ]; then
  source /usr/local/etc/bash_completion
fi

# .inputrcを読み込む
# 参考：http://kanjuku-tomato.blogspot.jp/2015/04/bashrc.html?m=1
# なくても読み込んだのでコメントアウト
#if [ -f ~/.inputrc ]; then
#  . ~/.inputrc
#fi

# Hyperで日本語を使えるようにする
# 参考：https://qiita.com/vimyum/items/44478a51ef3a6f49804f#日本語を表示する
export LANG=ja_JP.UTF-8

