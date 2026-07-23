@echo off
setlocal
cd /d %~dp0

rem ----------------------------------------------------------------
rem Remove symbolic links for dotfiles
rem Arguments: none
rem Returns: none
rem Notes: none
rem ----------------------------------------------------------------

rem Remove symbolic links for dotfiles
del %USERPROFILE%\.vimrc
del %USERPROFILE%\.gvimrc
del %USERPROFILE%\.ideavimrc
rmdir %USERPROFILE%\.vim\config
rmdir %USERPROFILE%\.vim\snippets
rmdir %USERPROFILE%\.config\nvim
rmdir %APPDATA%\efm-langserver
rmdir %USERPROFILE%\.config\ranger
del %USERPROFILE%\.sqliterc
del %USERPROFILE%\.xpdfrc
del %USERPROFILE%\.gitignore
del %USERPROFILE%\.svnignore
del %USERPROFILE%\.gitconfig

endlocal
exit

