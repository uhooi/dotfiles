# ターミナルの起動時に `.bashrc` を読み込むようにする
# ref: http://blog.ruedap.com/2010/09/13/mac-bash-bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Exports {{{
# プロンプトの表示を変更する
# 値をダブルコーテーションで括るとGit情報が表示されないため、シングルコーテーションで括る
# ref: https://jaxx2104.info/mac-terminal-prompt-linux-like/
#    : http://qiita.com/iwazer/items/5f57a80b8aac0f4e9839
#    : http://qiita.com/griffin3104/items/0d610ad1a57fa6ad6a09
#    : http://do-zan.com/mac-terminal-change-prompting/
#    : http://qiita.com/hidai@github/items/1704bf2926ab8b157a4f
#    : https://teratail.com/questions/11904
#export PS1="\h:\W \u\$ " # 初期値
#export PS1="[\u@\h \w]\$ " # 色なし1行
#export PS1="\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\n\[\e[0;90m\]\$\[\e[0;0m\] " # カラフル2行
export PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\[\e[0;36m\]$(__git_ps1 " (%s)")\n\[\e[0;90m\]\$\[\e[0;0m\] ' # Git情報付きカラフル2行

# coreutils
# 「g」抜きでコマンドを使用できるようにする
# ref: http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
if [ "$(uname)" == 'Darwin' ]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
fi

# pyenv-virtualenv
# ref: https://github.com/pyenv/pyenv#installation
#    : http://qiita.com/hedgehoCrow/items/0733c63c690450b14dcf
#    : http://qiita.com/niwak2/items/5490607be32202ce1314
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# jEnv
# ref: http://www.jenv.be
export JENV_ROOT="$HOME/.jenv"
if [ -d "${JENV_ROOT}" ]; then
  export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
fi

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nodebrew
# ref: https://qiita.com/taketakekaho/items/dd08cf01b4fe86b2e218
export NODEBREW_DIR="${HOME}/.nodebrew"
if [ -d "${NODEBREW_DIR}" ]; then
  export PATH=${NODEBREW_DIR}/current/bin:$PATH
fi

# Maven
# ref: https://qiita.com/yhayashi30/items/dd0e47aea01d65c8a1b4
export MAVEN_HOME="/usr/local/opt/maven@3.6"
if [ -d "${MAVEN_HOME}" ]; then
  export PATH="${MAVEN_HOME}/bin:$PATH"
fi

# Androidアプリ開発
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
if [ -d "${JAVA_HOME}" ]; then
  export PATH="${JAVA_HOME}/bin:$PATH"
fi

export ANDROID_HOME=${HOME}/Library/Android/sdk
if [ -d "${ANDROID_HOME}" ]; then
  export PATH="${ANDROID_HOME}/bin:$PATH"
fi

# Platform-Tools( `adb` コマンドなど)
# ref: https://qiita.com/uhooi/items/a3dcc15f7e15ae11d1d6
export ANDROID_TOOL_PATH=${ANDROID_HOME}/platform-tools
if [ -d "${ANDROID_TOOL_PATH}" ]; then
  export PATH="${ANDROID_TOOL_PATH}:$PATH"
fi

# Homebrew
# ref: https://qiita.com/aiorange19/items/5ffaefc85f912f60c2fa
if [ "$(uname -m)" = "arm64" ]; then
  export HOMEBREW_HOME=/opt/homebrew
else
  export HOMEBREW_HOME=/usr/local
fi
if [ -d "${HOMEBREW_HOME}" ]; then
  export PATH="${HOMEBREW_HOME}/bin:$PATH"
fi

# diff-highlight
# ref: https://udomomo.hatenablog.com/entry/2019/12/01/181404
#    : https://github.com/git/git/tree/master/contrib/diff-highlight
export DIFF_HIGHLIGHT_HOME=${HOMEBREW_HOME}/share/git-core/contrib/diff-highlight
if [ -d "${DIFF_HIGHLIGHT_HOME}" ]; then
  export PATH="${DIFF_HIGHLIGHT_HOME}:$PATH"
fi

# OpenSSL
# Mac標準のLibreSSLでなくHomebrewでインストールしたOpenSSLを参照するようにする
# ∵Dangerでエラーが発生するため
# ref: https://qiita.com/moroi/items/53d60d1d6885795a0f6f
export OPENSSL_HOME="${HOMEBREW_HOME}/bin/opt/openssl"
if [ -d "${OPENSSL_HOME}" ]; then
  export PATH="${OPENSSL_HOME}/bin:$PATH"
fi

# Flutter
# ref: https://docs.flutter.dev/get-started/install/macos
export FLUTTER_HOME="${HOME}/development/flutter"
if [ -d "${FLUTTER_HOME}" ]; then
  export PATH="${FLUTTER_HOME}/bin:$PATH"
fi

# Neovim
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
  export PATH="${NEOVIM_HOME}/bin:$PATH"
fi
# }}}
