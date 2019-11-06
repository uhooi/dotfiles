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
del %USERPROFILE%\.config\nvim\init.vim
del %USERPROFILE%\.gvimrc
del %USERPROFILE%\.ideavimrc
rmdir %USERPROFILE%\.vim\config
rmdir %USERPROFILE%\.vim\snippets
del %USERPROFILE%\.sqliterc
del %USERPROFILE%\.xpdfrc
del %USERPROFILE%\.gitignore
del %USERPROFILE%\.svnignore
del %USERPROFILE%\.hyper.js


endlocal
exit

