@echo off
setlocal
cd /d %~dp0

rem ----------------------------------------------------------------
rem Create symbolic links for dotfiles
rem Arguments: none
rem Returns: none
rem Notes: none
rem ----------------------------------------------------------------

rem Create symbolic links for dotfiles
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

endlocal
exit

