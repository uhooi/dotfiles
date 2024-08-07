@echo off
setlocal
cd /d %~dp0

rem ----------------------------------------------------------------
rem dotfilesのシンボリックリンクを削除する
rem 引数：なし
rem 戻値：なし
rem 備考：
rem ----------------------------------------------------------------

rem dotfilesのシンボリックリンクを削除する
del %USERPROFILE%\.vimrc
del %USERPROFILE%\.gvimrc
del %USERPROFILE%\.ideavimrc
del %USERPROFILE%\.vim\config
del %USERPROFILE%\.vim\snippets
del %USERPROFILE%\.config\nvim
del %APPDATA%\efm-langserver
del %USERPROFILE%\.config\ranger
del %USERPROFILE%\.sqliterc
del %USERPROFILE%\.xpdfrc
del %USERPROFILE%\.gitignore
del %USERPROFILE%\.svnignore
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.hyper.js

endlocal
exit

