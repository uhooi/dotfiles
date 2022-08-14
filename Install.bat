@echo off
setlocal
cd /d %~dp0

rem ----------------------------------------------------------------
rem dotfilesのシンボリックリンクを作成する
rem 引数：なし
rem 戻値：なし
rem 備考：
rem ----------------------------------------------------------------

rem dotfilesのシンボリックリンクを作成する
mklink %USERPROFILE%\.vimrc %~dp0\.vimrc
mklink %USERPROFILE%\.gvimrc %~dp0\.gvimrc
mklink %USERPROFILE%\.ideavimrc %~dp0\.ideavimrc
mkdir %USERPROFILE%\.vim
mklink /d %USERPROFILE%\.vim\config %~dp0\.vim\config
mklink /d %USERPROFILE%\.vim\snippets %~dp0\.vim\snippets
mkdir %USERPROFILE%\.config
mklink /d %USERPROFILE%\.config\nvim %~dp0\.config\nvim
mklink /d %APPDATA%\efm-langserver %~dp0\.config\efm-langserver
mklink /d %USERPROFILE%\.config\ranger %~dp0\.config\ranger
mklink %USERPROFILE%\.sqliterc %~dp0\.sqliterc
mklink %USERPROFILE%\.xpdfrc %~dp0\.xpdfrc
mklink %USERPROFILE%\.gitignore %~dp0\.gitignore
mklink %USERPROFILE%\.svnignore %~dp0\.svnignore
mklink %USERPROFILE%\.gitconfig %~dp0\windows.gitconfig
mklink %USERPROFILE%\.hyper.js %~dp0\.hyper.js

endlocal
exit

