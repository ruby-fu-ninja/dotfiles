filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

autocmd VimEnter * :IndentGuidesEnable

set background=dark 
colorscheme ir_black
syntax on             " Syntax highlighting

let mapleader = "["

map <Leader>t :CommandT<CR>
map <Leader>rt :CommandTFlush<CR>
map <Leader>n :NERDTreeToggle<CR> " toggling for project tree window

let g:NERDTreeWinSize = 50

au BufNewFile,BufRead *.jst set filetype=html

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P 


set tabstop=2
set shiftwidth=2
set number

set smartindent
set cindent
set smartindent
set autoindent
set expandtab

