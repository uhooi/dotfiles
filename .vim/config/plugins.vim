" dpp.vim

" ref: https://github.com/Shougo/dpp.vim
"    : https://github.com/Shougo/shougo-s-github/blob/78f2690dfa162cceee43a81babe540a7df604b19/vim/rc/dpp.vim

" Set dpp base path (required)
const s:dpp_base = expand('~/.cache/dpp/')
if !isdirectory(s:dpp_base)
  call mkdir(s:dpp_base, 'p')
endif

" Copy my dpp config files
const s:dpp_config_file = s:dpp_base .. 'dpp.ts'
if !filereadable(s:dpp_config_file)
  execute '!cp -f ./dpp/* ' .. s:dpp_base
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

" Clone repository and set plugin runtime path
for plugin in s:dpp_plugins
  let dir = s:dpp_base .. 'repos/' .. plugin
  if !isdirectory(dir)
    execute '!git clone https://' .. plugin dir
  endif
  execute 'set runtimepath^=' .. dir
endfor

if dpp#min#load_state(s:dpp_base)
  " Clone repository and set denops runtime path
  const s:denops_dir = s:dpp_base .. 'repos/' .. s:denops_src
  if !isdirectory(s:denops_dir)
    execute '!git clone https://' .. s:denops_src s:denops_dir
  endif
  execute 'set runtimepath^=' .. s:denops_dir

  autocmd User DenopsReady
  \  : echohl WarningMsg
  \  | echomsg 'dpp load_state() is failed'
  \  | echohl NONE
  \  | call dpp#make_state(s:dpp_base, s:dpp_config_file)
endif

autocmd User Dpp:makeStatePost
\  : echohl WarningMsg
\  | echomsg 'dpp make_state() is done'
\  | echohl NONE
