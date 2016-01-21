" Use Vim settings, rather then Vi settings.
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/wincent/command-t'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/nathanaelkane/vim-indent-guides.git'
Plugin 'git://github.com/mileszs/ack.vim.git'
Plugin 'git@github.com:kchmck/vim-coffee-script.git'
Plugin 'git@github.com:t9md/vim-ruby-xmpfilter.git'
Plugin 'https://github.com/Chiel92/vim-autoformat.git'
Plugin 'git@github.com:tpope/vim-rails.git'

" Snippets
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/garbas/vim-snipmate'
Plugin 'https://github.com/honza/vim-snippets'

call vundle#end()            " required

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

autocmd VimEnter * :IndentGuidesEnable

" iTerm 256 colors
set t_Co=256
set background=dark 
colorscheme ir_black
syntax on             " Syntax highlighting

let mapleader = "["

" CommandT
map <Leader>t :CommandT<CR>
map <Leader>rt :CommandTFlush<CR>

" In some terminals such as xterm the Escape key misbehaves, so Command-T
" doesn't set up a mapping for it.
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  
  " fix up/down arrow sequences in console version
  let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif

" NERDTree mappings
map <Leader>n :NERDTreeToggle<CR> " toggling for project tree window
map <Leader>f :NERDTreeFind<CR> " find current file in nerd tree

" Show file path in status line
set statusline+=%F
set laststatus=2

command Fixrubyhash :%s/:\([^ ]*\)\(\s*\)=>/\1:/g

" Indent lines with only whitespace
:inoremap <CR> <CR>x<BS>

let g:NERDTreeWinSize = 50

au BufNewFile,BufRead *.jst set filetype=html

" tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Dont create swp and backups
set noswapfile
set nobackup

set number

filetype plugin indent on

set autoindent

set history=50		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set cursorline    " highlight the line that the cursor is on

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

set nobackup
set nowritebackup
set noswapfile

set wildignore+=*.png,*.jpg,*.jpeg,*.sp*,*.gif,tmp/*,*.keep,public/**,log/*

let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <Leader>r <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <Leader>rr <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <Leader>rr <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <Leader>rr <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
autocmd FileType ruby nmap <buffer> <Leader>x <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <Leader>x <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <Leader>x <Plug>(seeing_is_believing-run)

" Key mappings for inline running of ruby code
" nmap <buffer> <Leader>ee <Plug>(xmpfilter-run)
" xmap <buffer> <Leader>ee <Plug>(xmpfilter-run)
" imap <buffer> <Leader>ee <Plug>(xmpfilter-run)
" 
" nmap <buffer> <Leader>e <Plug>(xmpfilter-mark)
" xmap <buffer> <Leader>e <Plug>(xmpfilter-mark)
" imap <buffer> <Leader>e <Plug>(xmpfilter-mark)

" disable vim auto adding comment character at the beginning of line
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:CommandTMaxFiles=500000

" Make navigating vim windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
