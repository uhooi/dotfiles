# ターミナルの起動時に.bashrcを読み込むようにする
# 参考：http://blog.ruedap.com/2010/09/13/mac-bash-bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# プロンプトの表示を変更する
# 値をダブルコーテーションで括るとGit情報が表示されないため、シングルコーテーションで括る
# 参考：https://jaxx2104.info/mac-terminal-prompt-linux-like/
# 　　：http://qiita.com/iwazer/items/5f57a80b8aac0f4e9839
# 　　：http://qiita.com/griffin3104/items/0d610ad1a57fa6ad6a09
# 　　：http://do-zan.com/mac-terminal-change-prompting/
# 　　：http://qiita.com/hidai@github/items/1704bf2926ab8b157a4f
# 　　：https://teratail.com/questions/11904
#export PS1="\h:\W \u\$ " # 初期値
#export PS1="[\u@\h \w]\$ " # 色なし1行
#export PS1="\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\n\[\e[0;90m\]\$\[\e[0;0m\] " # カラフル2行
export PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\[\e[0;36m\]$(__git_ps1 " (%s)")\n\[\e[0;90m\]\$\[\e[0;0m\] ' # Git情報付きカラフル2行

# CentOS7.3にデフォルトである記述
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# coreutils
# 「g」抜きでコマンドを使用できるようにする
# 参考：http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
# Mac
if [ "$(uname)" == 'Darwin' ]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
fi

# pyenv-virtualenv
# 参考：https://github.com/pyenv/pyenv#installation
# 　　：http://qiita.com/hedgehoCrow/items/0733c63c690450b14dcf
# 　　：http://qiita.com/niwak2/items/5490607be32202ce1314
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# jEnv
# 参考：http://www.jenv.be
export JENV_ROOT="$HOME/.jenv"
if [ -d "${JENV_ROOT}" ]; then
  export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
fi

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
if [ -d "${SDKMAN_DIR}" ]; then
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Android SDK Tools
if [ -d "/usr/local/opt/android-sdk/tools/bin" ]; then
  export PATH=$PATH:/usr/local/opt/android-sdk/tools/bin
fi

# nodebrew
# 参考：https://qiita.com/taketakekaho/items/dd08cf01b4fe86b2e218
export NODEBREW_DIR="${HOME}/.nodebrew"
if [ -d "${NODEBREW_DIR}" ]; then
  export PATH=$NODEBREW_DIR/current/bin:$PATH
fi

# Maven
# 参考：https://qiita.com/yhayashi30/items/dd0e47aea01d65c8a1b4
export MAVEN_HOME="/usr/local/opt/maven@3.6"
if [ -d "${MAVEN_HOME}" ]; then
  export PATH="${MAVEN_HOME}/bin:$PATH"
fi

# OpenSSL
# Mac標準のLibreSSLでなくHomebrewでインストールしたOpenSSLを参照するようにする
# ∵Dangerでエラーが発生するため
# 参考：https://qiita.com/moroi/items/53d60d1d6885795a0f6f
export OPENSSL_HOME="/usr/local/opt/openssl"
if [ -d "${OPENSSL_HOME}" ]; then
  export PATH="${OPENSSL_HOME}/bin:$PATH"
fi

# Mint
# 参考：https://qiita.com/uhooi/items/6a41a623b13f6ef4ddf0
if which mint >/dev/null; then
  export MINT_PATH="${HOME}/.mint/lib"
  export MINT_LINK_PATH="${HOME}/.mint/bin"
fi

