" dpp.vim

" ref: https://github.com/Shougo/dpp.vim
"    : https://github.com/Shougo/shougo-s-github/blob/78f2690dfa162cceee43a81babe540a7df604b19/vim/rc/dpp.vim

" Setup
" 1. Run `cp ./dpp/* ~/.cache/dpp/`

" Set dpp base path (required)
const s:dpp_base = expand('~/.cache/dpp/')
if !isdirectory(s:dpp_base)
  call mkdir(s:dpp_base, 'p')
endif

" Set dpp source path (required)
const s:dpp_src = 'github.com/Shougo/dpp.vim'
if !isdirectory(s:dpp_base .. 'repos/github.com/Shougo')
  call mkdir(s:dpp_base .. 'repos/github.com/Shougo', 'p')
endif

" Set denops source path
const s:denops_src = 'github.com/vim-denops/denops.vim'
if !isdirectory(s:dpp_base .. 'repos/github.com/vim-denops/')
  call mkdir(s:dpp_base .. 'repos/github.com/vim-denops/', 'p')
endif

" Set dpp extensions and protocols path
const s:dpp_plugins = [
\  'github.com/Shougo/dpp-ext-installer',
\  'github.com/Shougo/dpp-ext-lazy',
\  'github.com/Shougo/dpp-ext-toml',
\  'github.com/Shougo/dpp-protocol-git',
\]

" Clone repository and set dpp runtime path (required)
const s:dpp_dir = s:dpp_base .. 'repos/' .. s:dpp_src
if !isdirectory(s:dpp_dir)
  execute '!git clone https://' .. s:dpp_src s:dpp_dir
endif
execute 'set runtimepath^=' .. s:dpp_dir
for plugin in s:dpp_plugins
  let dir = s:dpp_base .. 'repos/' .. plugin
  if !isdirectory(dir)
    execute '!git clone https://' .. plugin dir
  endif
  execute 'set runtimepath^=' .. dir
endfor

if dpp#min#load_state(s:dpp_base)
  const s:denops_dir = s:dpp_base .. 'repos/' .. s:denops_src
  if !isdirectory(s:denops_dir)
    execute '!git clone https://' .. s:denops_src s:denops_dir
  endif
  execute 'set runtimepath^=' .. s:denops_dir
  autocmd User DenopsReady
  \  call dpp#make_state(s:dpp_base, s:dpp_base .. 'dpp.ts')
endif
