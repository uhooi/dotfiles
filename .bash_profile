# ターミナルの起動時に `.bashrc` を読み込むようにする
# ref: http://blog.ruedap.com/2010/09/13/mac-bash-bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Exports {{{

# プロンプトの表示を変更する
# ref: https://qiita.com/iwazer/items/5f57a80b8aac0f4e9839
#    : http://do-zan.com/mac-terminal-change-prompting/
#    : https://qiita.com/hidai@github/items/1704bf2926ab8b157a4f
#    : https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60
#    : https://www.mm2d.net/main/prog/c/console-02.html
#    : https://teratail.com/questions/11904
export PS1='\[\e[0;92m\]\[\e[0;30;102m\] \D{%m/%d %H:%M}\[\e[0;92m\] \[\e[0;94m\]\[\e[0;30;104m\]󰎙 $(mise tool node --active) 󰌠 $(mise tool python --active) 󰴭 $(mise tool ruby --active) 󱘗 $(mise tool rust --active) 󰟓 $(mise tool go --active)\[\e[0;94m\] \[\e[0;93m\]\[\e[0;30;103m\] \w\[\e[0;93m\] \[\e[0;91m\]\[\e[0;30;101m\]$(__git_ps1 " %s")\[\e[0;91m\]\n\[\e[0;91m\]❯\[\e[0;92m\]❯\[\e[0;94m\]❯ \[\e[0;90m\]\$\[\e[0;0m\] '

# virtualenvのプロンプトを非表示にする
# ref: https://blog.shibayu36.org/entry/2017/04/01/145758
export VIRTUAL_ENV_DISABLE_PROMPT=1

# jEnv
# ref: http://www.jenv.be
JENV_ROOT="$HOME/.jenv"
if [ -d "${JENV_ROOT}" ]; then
  export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
fi

# Maven
# ref: https://qiita.com/yhayashi30/items/dd0e47aea01d65c8a1b4
MAVEN_HOME="/usr/local/opt/maven@3.6"
if [ -d "${MAVEN_HOME}" ]; then
  export PATH="${MAVEN_HOME}/bin:$PATH"
fi

# Androidアプリ開発
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
if [ -d "${JAVA_HOME}" ]; then
  export PATH="${JAVA_HOME}/bin:$PATH"
fi

ANDROID_HOME=${HOME}/Library/Android/sdk
if [ -d "${ANDROID_HOME}" ]; then
  export PATH="${ANDROID_HOME}/bin:$PATH"
fi

# Platform-Tools( `adb` コマンドなど)
# ref: https://qiita.com/uhooi/items/a3dcc15f7e15ae11d1d6
ANDROID_TOOL_PATH=${ANDROID_HOME}/platform-tools
if [ -d "${ANDROID_TOOL_PATH}" ]; then
  export PATH="${ANDROID_TOOL_PATH}:$PATH"
fi

# Homebrew
# ref: https://qiita.com/aiorange19/items/5ffaefc85f912f60c2fa
if [ "$(uname -m)" = 'arm64' ]; then
  HOMEBREW_HOME=/opt/homebrew
else
  HOMEBREW_HOME=/usr/local
fi
if [ -d "${HOMEBREW_HOME}" ]; then
  export PATH="${HOMEBREW_HOME}/bin:$PATH"
fi

# coreutils
# 「g」抜きでコマンドを使用できるようにする
# ref: http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
LIBEXEC_HOME=${HOMEBREW_HOME}/opt/coreutils/libexec
if [ -d "${LIBEXEC_HOME}" ]; then
  export PATH="${LIBEXEC_HOME}/gnubin:${PATH}"
  export MANPATH="${LIBEXEC_HOME}/gnuman:${MANPATH}"
fi

# diff-highlight
# ref: https://udomomo.hatenablog.com/entry/2019/12/01/181404
#    : https://github.com/git/git/tree/master/contrib/diff-highlight
DIFF_HIGHLIGHT_HOME=${HOMEBREW_HOME}/share/git-core/contrib/diff-highlight
if [ -d "${DIFF_HIGHLIGHT_HOME}" ]; then
  export PATH="${DIFF_HIGHLIGHT_HOME}:$PATH"
fi

# OpenSSL
# Mac標準のLibreSSLでなくHomebrewでインストールしたOpenSSLを参照するようにする
# ∵Dangerでエラーが発生するため
# ref: https://qiita.com/moroi/items/53d60d1d6885795a0f6f
OPENSSL_HOME="${HOMEBREW_HOME}/bin/opt/openssl"
if [ -d "${OPENSSL_HOME}" ]; then
  export PATH="${OPENSSL_HOME}/bin:$PATH"
fi

# Flutter
# ref: https://docs.flutter.dev/get-started/install/macos
FLUTTER_HOME="${HOME}/development/flutter"
if [ -d "${FLUTTER_HOME}" ]; then
  export PATH="${FLUTTER_HOME}/bin:$PATH"
fi

# Vim
export VIM_HOME=$HOME/.local/vim
if [ -d "${VIM_HOME}" ]; then
  export PATH="${VIM_HOME}/bin:$PATH"
fi

# ncurses
export PATH="${HOMEBREW_HOME}/opt/ncurses/bin:$PATH"

# Neovim
# ref: https://qiita.com/uhooi/items/95ffbfc1270df79f1fbd
NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
  export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

# WezTerm
# ref: https://wezfurlong.org/wezterm/install/macos.html#installing-on-macos
WEZTERM_HOME=/Applications/WezTerm.app/Contents/MacOS
if [ -d "${WEZTERM_HOME}" ]; then
  export PATH="${WEZTERM_HOME}:$PATH"
fi

# Pkl
PKL_HOME=$HOME/.local/pkl
if [ -d "${PKL_HOME}" ]; then
  export PATH="${PKL_HOME}/bin:$PATH"
fi

# CodeLLDB
CODELLDB_HOME=$HOME/codelldb-darwin-arm64/extension/adapter
if [ -d "${CODELLDB_HOME}" ]; then
  export PATH="${CODELLDB_HOME}:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Man
# ManをNeovimで開く
export MANPAGER='nvim +Man!'

# }}}

# Shell Integration
# ref: https://iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Cargo
. "$HOME/.cargo/env"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then
  . "$HOME/google-cloud-sdk/path.bash.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.bash.inc"
fi

# mise
# ref: https://mise.jdx.dev/getting-started.html#activate-mise
if [ -d "$HOME/.config/mise" ]; then
  eval "$(mise activate bash)"
  eval "$(mise completion bash --include-bash-completion-lib)" # FIXME: Many errors
fi
