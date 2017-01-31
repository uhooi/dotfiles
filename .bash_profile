# プロンプトの表示を変更する
# 参考：https://jaxx2104.info/mac-terminal-prompt-linux-like/
# 　　：http://qiita.com/iwazer/items/5f57a80b8aac0f4e9839
# 　　：http://qiita.com/griffin3104/items/0d610ad1a57fa6ad6a09
# 　　：http://do-zan.com/mac-terminal-change-prompting/
#export PS1="\h:\W \u\$ " # 初期値
#export PS1="[\u@\h \w]\$ " # 色なし1行
export PS1="\[\e[0;32m\]\u@\h \w\[\e[0;0m\]\n\$ " # 緑複数行

# coreutils
# 参考：http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

# pyenv-virtualenv
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

