" dpp.vim
" ref: https://github.com/Shougo/dpp.vim

" Set dpp base path (required)
const s:dpp_base = '~/.cache/dpp/'

" Set dpp source path (required)
const s:dpp_src = s:dpp_base .. 'repos/github.com/Shougo/dpp.vim'
const s:denops_src = s:dpp_base .. 'repos/github.com/denops/denops.vim'

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
