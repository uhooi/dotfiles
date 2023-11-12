" dpp.vim

" ref: https://github.com/Shougo/dpp.vim
"   : https://github.com/Shougo/shougo-s-github/blob/78f2690dfa162cceee43a81babe540a7df604b19/vim/rc/dpp.vim

" Setup
" 1. Clone repositories.  
"     ```shell
"     $ ghq get https://github.com/Shougo/dpp.vim.git
"     $ ghq get https://github.com/vim-denops/denops.vim.git
"     $ ghq get https://github.com/Shougo/dpp-ext-installer.git
"     $ ghq get https://github.com/Shougo/dpp-ext-lazy.git
"     $ ghq get https://github.com/Shougo/dpp-ext-toml.git
"     $ ghq get https://github.com/Shougo/dpp-protocol-git.git
"     ```
" 2. Make directories.  
"    ```shell
"    $ mkdir -p ~/.cache/dpp/repos/github.com/Shougo
"    $ mkdir -p ~/.cache/dpp/repos/github.com/vim-denops
"    ```
" 3. Create symbolic links.  
"    ```shell
"    $ ln -fns ~/ghq/github.com/Shougo/dpp.vim/ ~/.cache/dpp/repos/github.com/Shougo/dpp.vim
"    $ ln -fns ~/ghq/github.com/vim-denops/denops.vim/ ~/.cache/dpp/repos/github.com/vim-denops/denops.vim
"    $ ln -fns ~/ghq/github.com/Shougo/dpp-ext-installer/ ~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer
"    $ ln -fns ~/ghq/github.com/Shougo/dpp-ext-lazy/ ~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy
"    $ ln -fns ~/ghq/github.com/Shougo/dpp-ext-toml/ ~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml
"    $ ln -fns ~/ghq/github.com/Shougo/dpp-protocol-git/ ~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git
"    $ ln -fns ~/ghq/github.com/dotfiles/uhooi/.vim/config/dpp/* ~/.cache/dpp/
"    ```

" Set dpp base path (required)
const s:dpp_base = '~/.cache/dpp/'

" Set dpp source path (required)
const s:dpp_src = s:dpp_base .. 'repos/github.com/Shougo/dpp.vim'
const s:denops_src = s:dpp_base .. 'repos/github.com/vim-denops/denops.vim'

" Set dpp extensions and protocols path
const s:dpp_extensions = [
\  s:dpp_base .. 'repos/github.com/Shougo/dpp-ext-installer',
\  s:dpp_base .. 'repos/github.com/Shougo/dpp-ext-lazy',
\  s:dpp_base .. 'repos/github.com/Shougo/dpp-ext-toml',
\]
const s:dpp_protocols = [
\  s:dpp_base .. 'repos/github.com/Shougo/dpp-protocol-git',
\]

" Set dpp runtime path (required)
execute 'set runtimepath^=' .. s:dpp_src
for extension in s:dpp_extensions
  execute 'set runtimepath^=' .. extension
endfor
for protocol in s:dpp_protocols
  execute 'set runtimepath^=' .. protocol
endfor

if dpp#min#load_state(s:dpp_base)
  execute 'set runtimepath^=' .. s:denops_src
  autocmd User DenopsReady
  \  call dpp#make_state(s:dpp_base, s:dpp_base .. 'dpp.ts')
endif
