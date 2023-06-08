# CentOS7.3にデフォルトである記述
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# エイリアス
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls --color=auto'
fi
alias g='git'
alias cdg='cd $(ghq list -p | peco)'

# 定数
# M1 Mac
if [ "$(uname -m)" = "arm64" ]; then
  readonly HOMEBREW_ETC_PATH="/opt/homebrew/etc"
# Intel Mac
else
  readonly HOMEBREW_ETC_PATH="/usr/local/etc"
fi

# Git
# ターミナルのプロンプトにGitの情報を表示できるようにする
# 参考：http://qiita.com/varmil/items/9b0aeafa85975474e9b6
# 　　：http://mawatari.jp/archives/git-completion-bash
# 　　：http://qiita.com/UmedaTakefumi/items/fe02d17264de6c78443d
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  source ${HOMEBREW_ETC_PATH}/bash_completion.d/git-prompt.sh
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
  source ${HOMEBREW_ETC_PATH}/bash_completion.d/git-completion.bash
# Linux
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  source /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash
fi

# `git` に `g` のエイリアスを貼っていても補完が効くようにする
# 参考：https://twitter.com/396f91/status/1271299342318497792?s=20
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g

# bash-comletion
# makeコマンドの補完などを有効にする
# 参考：https://qiita.com/notakaos/items/d44a4c2b72625746de25
if [ "$(uname)" == 'Darwin' ]; then
  source ${HOMEBREW_ETC_PATH}/bash_completion
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

# direnv
# 参考：https://github.com/direnv/direnv/blob/357825f4ddcc8d7ef62a6276b60d9aa36449ac96/docs/hook.md#bash
eval "$(direnv hook bash)"

