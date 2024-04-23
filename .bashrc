# ref: https://qiita.com/magicant/items/d3bb7ea1192e63fba850

# Variables {{{
if [ "$(uname -m)" = 'arm64' ]; then
  readonly HOMEBREW_ETC_PATH='/opt/homebrew/etc'
else
  readonly HOMEBREW_ETC_PATH='/usr/local/etc'
fi
# }}}

# Aliases {{{
alias ls='eza --icons'
alias eza='eza --icons'

alias rm='trash-put'

alias g='git'

alias ga='git add "$(git status --short | peco | cut --characters 4-)"'
alias gr='git reset HEAD "$(git status --short | peco | cut --characters 4-)"'

# ref: https://tokizuoh.hatenablog.com/entry/2022/09/10/104017
#    : https://qiita.com/IzumiSy/items/b44b384468d8f2f9dc71
shopt -s autocd
alias cdg='`ghq list -p | peco`'

alias goodbye-derived-data='/bin/rm -rf ~/Library/Developer/Xcode/DerivedData/'
# }}}

# Git {{{
# ターミナルのプロンプトにGitの情報を表示できるようにする
# ref: http://qiita.com/varmil/items/9b0aeafa85975474e9b6
#    : http://mawatari.jp/archives/git-completion-bash
#    : http://qiita.com/UmedaTakefumi/items/fe02d17264de6c78443d
#    : https://oki2a24.com/2019/04/11/customise-git-ps1-to-a-nearly-satisfactory-state/
if [ "$(uname)" == 'Darwin' ]; then
  source ${HOMEBREW_ETC_PATH}/bash_completion.d/git-prompt.sh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  source /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh
fi

# 表示するGit情報に以下のマークを追加する
# * : addされていない変更がある
# + : addされているがcommitされていない変更がある
GIT_PS1_SHOWDIRTYSTATE=true

# $ : スタッシュがある
GIT_PS1_SHOWSTASHSTATE=true

# % : トラックされていないファイルがある
GIT_PS1_SHOWUNTRACKEDFILES=true

# HEADとアップストリームとの違いを表示する
# < : アップストリームより遅れている
# > : アップストリームより進んでいる
# <>: 乖離している
# = : 差がない
GIT_PS1_SHOWUPSTREAM="auto"

# ブランチ名と上記の状態記号の区切り文字を設定する
GIT_PS1_STATESEPARATOR=" "

# 状態に色を付ける
# GIT_PS1_SHOWCOLORHINTS=true

# カレントディレクトリがGitで無視されている場合に何も表示しない
# GIT_PS1_HIDE_IF_PWD_IGNORED=true

# ターミナルでGitのタブ補完を有効にする
# ref: http://qiita.com/koyopro/items/3fce94537df2be6247a3
if [ "$(uname)" == 'Darwin' ]; then
  source ${HOMEBREW_ETC_PATH}/bash_completion.d/git-completion.bash
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  source /usr/share/doc/git-1.8.3.1/contrib/completion/git-completion.bash
fi

# `git` に `g` のエイリアスを貼っていても補完が効くようにする
# ref: https://twitter.com/396f91/status/1271299342318497792?s=20
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
# }}}

# Others {{{
# bash-comletion
# makeコマンドの補完などを有効にする
# ref: https://qiita.com/notakaos/items/d44a4c2b72625746de25
if [ "$(uname)" == 'Darwin' ]; then
  source ${HOMEBREW_ETC_PATH}/bash_completion
fi

# Swift Package Manager
# 補完を有効にする
# ref: https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md#bash
source ~/.swift-package-complete.bash

# direnv
# ref: https://github.com/direnv/direnv/blob/357825f4ddcc8d7ef62a6276b60d9aa36449ac96/docs/hook.md#bash
eval "$(direnv hook bash)"
# }}}

# Cargo
. "$HOME/.cargo/env"
