" Settings
let g:python3_host_prog=$HOME . '/scoop/apps/python311/current/python.exe'

" neomake
let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']

autocmd FileType python setlocal omnifunc=jedi#completions
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"LightLine
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let b:ale_linters = {
      \   'javascript': ['eslint', 'eslint-plugin-vue'],
      \   'python': ['pyflakes', 'pep8'],
      \   'ruby': ['rubocop'],
      \   'tex': ['textlint'],
      \   'markdown': ['textlint'],
      \   'css': ['stylelint'],
      \}
let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" Defx
autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      " Define mappings
      nnoremap <silent><buffer><expr> <CR>
      \ defx#do_action('open')
      nnoremap <silent><buffer><expr> c
      \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
      \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
      \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> l
      \ defx#do_action('open')
      nnoremap <silent><buffer><expr> E
      \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> P
      \ defx#do_action('open', 'pedit')
      nnoremap <silent><buffer><expr> o
      \ defx#do_action('open_or_close_tree')
      nnoremap <silent><buffer><expr> K
      \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N
      \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> M
      \ defx#do_action('new_multiple_files')
      nnoremap <silent><buffer><expr> C
      \ defx#do_action('toggle_columns',
      \ 'mark:indent:icon:filename:type:size:time')
      nnoremap <silent><buffer><expr> S
      \ defx#do_action('toggle_sort', 'time')
      nnoremap <silent><buffer><expr> d
      \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> !
      \ defx#do_action('execute_command')
      nnoremap <silent><buffer><expr> x
      \ defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> yy
      \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
      \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> ;
      \ defx#do_action('repeat')
      nnoremap <silent><buffer><expr> h
      \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> ~
      \ defx#do_action('cd')
      nnoremap <silent><buffer><expr> q
      \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> <Space>
      \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
      \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
      \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
      \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> <C-l>
      \ defx#do_action('redraw')
      nnoremap <silent><buffer><expr> <C-g>
      \ defx#do_action('print')
      nnoremap <silent><buffer><expr> cd
      \ defx#do_action('change_vim_cwd')
    endfunction

" Denite
nnoremap <silent> <space>fr :<C-u>Denite file_mru -split="floating"<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent> <space>
  \ fr :<C-u>Denite file_mru -split="floating"<CR>
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  inoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction

" vim-com
if filereadable(expand('~/.vim/plugged/vim-com/plugins/refac.vim'))
  source ~/.vim/plugged/vim-com/plugins/refac.vim
endif

" Settings
source $VIMRUNTIME\delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME\menu.vim

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

set guioptions-=T
set lines=42
set columns=135
set encoding=utf-8

set fileencodings=utf-8,cp932
set background=dark
colorscheme mrkn256
set splitbelow
set nobackup
set noundofile
set noswapfile
syntax enable
set number
set wildmenu
set wildmode=list:full
set laststatus=2
set guifont=HackGen_Console_NF:h11:cANSI:qDRAFT
set backspace=indent,eol,start
source $VIMRUNTIME/mswin.vim

" $HOME
cd ~
