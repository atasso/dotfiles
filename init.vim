call plug#begin('~/.local/share/nvim/plugged')
  Plug 'vim-vdebug/vdebug'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/neosnippet.vim'
  Plug 'kaicataldo/material.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'nelsyeung/twig.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Shougo/denite.nvim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()
filetype on
set hidden

set clipboard+=unnamedplus

"Impostazioni per neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"Impostazioni per il tema
set background=dark
colorscheme material
let g:material_terminal_italics = 1
if (has("termguicolors"))
  set termguicolors
endif

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
nnoremap [denite]f :Denite file_rec -highlight-matched-char=Normal<CR>
nnoremap [denite]l :Denite line -highlight-matched-char=Normal<CR>
nnoremap [denite]b :Denite buffer -mode=normal -highlight-matched-char=Normal<CR>
nnoremap [denite]y :Denite history/yank -highlight-matched-char=Normal<CR>
nnoremap [denite]r :Denite -resume -highlight-matched-char=Normal<CR>
noremap [denite]s :Denite grep -highlight-matched-char=Normal<CR>

set t_Co=256
"Impostazioni per coc
"" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
 set updatetime=300
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
autocmd CursorHold * silent call CocActionAsync('highlight')

"Visualizza i numeri di riga
set number
set relativenumber
set ruler
set cursorline
syntax on
set showmode
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

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
nnoremap <Leader>f :NERDTreeToggle .<cr>

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




