" Evita la compatibilità con il vecchio vim
set nocompatible


" Required Vundle setup

call plug#begin('~/.local/share/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ZoomWin'
Plug 'jiangmiao/auto-pairs'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'gcorne/vim-sass-lint'
Plug 'evidens/vim-twig'
Plug 'joonty/vdebug'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
call plug#end()
filetype on


set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set hidden

set t_Co=256

"Visualizza i numeri di riga
set number
set relativenumber
set ruler
set cursorline
syntax on
set showmode
set fillchars=""
hi EndOfBuffer ctermfg=235
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

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Status bar
set laststatus=2

"Nasconde la barra dei menu e gli scrollbar
set guioptions=aAc

set gfn=Liberation_Mono_for_Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1

set scrolloff=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


"Rimappo il leader sullo spazio
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"


"Vimfiler è il filesistem di default
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \})
augroup vfinit
autocmd FileType vimfiler call s:vimfilerinit()
augroup END
  function! s:vimfilerinit()
    set nonumber
    set norelativenumber
  endf

nnoremap <Leader>f :VimFilerExplorer<cr>

"Rimappo il tasto esc sulla jj
imap jj <Esc>
noremap ò <Char-0x60>

"rimappo i tasti per scrollare in su e in giù
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>
nnoremap è <C-o>
nnoremap é <C-i>

" ZoomWin configuration
nnoremap <Leader>z :ZoomWin<CR>

"Mappo la riceca sulla virgola
nnoremap , /
nnoremap ,<Leader> :nohl<CR>

"Mappature per denite
nnoremap [denite] <Nop>
nmap ò [denite]
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', 'd', '<denite:do_action:delete>', 'noremap')
nnoremap [denite]f :Denite file_rec<CR>
nnoremap [denite]l :Denite line<CR>
nnoremap [denite]b :Denite buffer -mode=normal<CR>
nnoremap [denite]y :Denite history/yank <CR>
nnoremap [denite]r :Denite -resume <CR>
noremap [denite]s :Denite grep<CR>


let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" impostazioni per syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_javascript_checkers = ['eslint']

"apro l'albero nella root del progetto nella stessa finestra

"cambio il modo per incollare nel terminale"
nnoremap <silent> <Leader>p :set paste<cr>
autocmd InsertLeave * set nopaste

"Sposta il cursore alla finestra precedente
noremap <silent> <tab> :wincmd w<cr>
"Sposta il cursore alla finestra successiva
noremap <silent> <S-tab> :wincmd W<cr>

nnoremap <CR> :
nnoremap à ;

nnoremap <Leader>tn :tabnew <cr>
nnoremap <Leader>tc :tabclose <cr>

nnoremap <Leader>s :so $MYVIMRC <cr>

"Imposta la modalità a tutto schermo
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif


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

" load the plugin and indent settings for the detected filetype
filetype plugin indent on




