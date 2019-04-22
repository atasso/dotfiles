call plug#begin('~/.local/share/nvim/plugged')
  Plug 'vim-vdebug/vdebug'
  Plug 'kaicataldo/material.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'nelsyeung/twig.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'idanarye/vim-merginal'
  Plug 'honza/vim-snippets'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'StanAngeloff/php.vim'
  Plug 'rayburgemeestre/phpfolding.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/defx.nvim',  { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-git'
  Plug 'Shougo/neoyank.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()
filetype on
set hidden

set foldmethod=syntax

set clipboard+=unnamedplus
"Impostazioni per il tema
set background=dark
colorscheme material
set guifont=FuraCode\ NF
let g:material_terminal_italics = 1
if (has("termguicolors"))
  set termguicolors
endif

set splitright

let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


"Impostazioni per denite
let s:denite_options = {'default' : {
      \ 'auto_resize': 1,
      \ 'prompt': 'λ:',
      \ 'direction': 'rightbelow',
      \ 'winminheight': '2',
      \ 'highlight_mode_insert': 'Visual',
      \ 'highlight_mode_normal': 'Visual',
      \ 'prompt_highlight': 'Function',
      \ 'highlight_matched_char': 'Function',
      \ 'highlight_matched_range': 'Normal'
      \ }}
nnoremap [denite] <Nop>
nmap ò [denite]
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', 'd', '<denite:do_action:delete>', 'noremap')
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '*~', '*.o', '*.exe', '*.bak',
      \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
      \ '.hg/', '.git/', '.bzr/', '.svn/',
      \ 'node_modules/', 'bower_components/', 'tmp/', 'log/', 'vendor/',
      \ '.idea/', 'dist/',
      \ 'tags', 'tags-*'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
nnoremap [denite]f :Denite file/rec -split=floating -winrow=0<CR>
nnoremap [denite]l :Denite line -split=floating -winrow=1<CR>
nnoremap [denite]b :Denite buffer -split=floating -mode=normal -winrow=0<CR>
nnoremap [denite]y :Denite neoyank -split=floating -winrow=0<CR>
nnoremap [denite]r :Denite -resume -split=floating -winrow=0<CR>
noremap [denite]s :Denite grep -no-empty -mode=Normal<CR>




tnoremap <Esc> <C-\><C-n>

set t_Co=256
"Impostazioni per coc
"" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
 " Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
"set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocAction('doHover')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Visualizza i numeri di riga
set number
set relativenumber
set ruler
set cursorline
syntax on
set showmode
set noswapfile
set fillchars=""
" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status bar
set laststatus=2

"Nasconde la barra dei menu e gli scrollbar
set guioptions=aAc

set scrolloff=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


"Rimappo il leader sullo spazio
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"Rimappo il tasto esc sulla jj
imap jj <Esc>

"rimappo i tasti per scrollare in su e in giù
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>
nnoremap è <C-o>
nnoremap é <C-i>

"Mappo la riceca sulla virgola
nnoremap , /
nnoremap ,<Leader> :nohl<CR>

"Sposta il cursore alla finestra precedente
noremap <silent> <tab> :wincmd w<cr>
"Sposta il cursore alla finestra successiva
noremap <silent> <S-tab> :wincmd W<cr>

nnoremap <CR> :
nnoremap à ;

nnoremap <Leader>to :tabnew <cr>
nnoremap <Leader>tc :tabclose <cr>
nnoremap <Leader>tp :tabprev <cr>
nnoremap <Leader>tn :tabnext <cr>

nnoremap <Leader>q :bp\|bd #<CR>
nnoremap <Leader>g :G<CR>
nnoremap <Leader>m :MerginalToggle<CR>


" Vdebug
let g:vdebug_keymap = {
\    "run" : "<Leader>1",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>b",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\}

let g:loaded_netrwPlugin = 1 " Disable netrw.vim

" autocmd FileType defx call s:defx_my_settings()

augroup defxConfig
  autocmd!
  autocmd FileType defx call s:defx_my_settings()
augroup END


	function! s:defx_my_settings() abort
	  " Define mappings

  " Open commands
  " nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  " Preview current file
  " nnoremap <silent><buffer><expr> s defx#do_action('open', 'pedit')

  " File manipulation
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> <Del> defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  nnoremap <silent><buffer><expr> dd defx#do_action('move')
  nnoremap <silent><buffer><expr> pp defx#do_action('paste')

  "Navigation
  nnoremap <silent><buffer><expr> - defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])

  " Miscellaneous actions
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yp defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw') . ':nohlsearch<cr>:syntax sync fromstart<cr><c-l>'

  nnoremap <silent><buffer><expr><nowait> , defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')

  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	endfunction
  call defx#custom#column('icon', {
	      \ 'directory_icon': '▸',
	      \ 'opened_icon': '▾',
	      \ 'root_icon': ' ',
	      \ })
nnoremap <Leader>f :Defx -columns=indent:git:icon:mark:filename:type -split=vertical -toggle -winwidth=40 -direction=topleft<CR>

augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
augroup END

" load the plugin and indent settings for the detected filetype
filetype plugin indent on




