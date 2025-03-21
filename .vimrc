" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plugins.
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ngmy/vim-rubocop'

" My Plugins, maked by takkii.
Plug 'takkii/overlap'
Plug 'takkii/kindness'
Plug 'takkii/graze'
Plug 'takkii/vim-com'
Plug 'takkii/dict'

" appearance
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'dense-analysis/ale'
Plug 'mrkn/mrkn256.vim'
Plug 'neomake/neomake'
Plug 'cohama/lexima.vim'
Plug 'kristijanhusak/defx-icons'

" Initialize plugin system
call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \   'auto_complete_delay': 0,
      \   'smart_case': v:true,
      \   'max_list': 30,
      \ })

inoremap <expr><tab> pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

