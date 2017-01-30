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
rmdir %USERPROFILE%\.vim\config
del %USERPROFILE%\.gemrc
del %USERPROFILE%\.sqliterc
del %USERPROFILE%\.gitignore
del %USERPROFILE%\.svnignore


endlocal
exit

