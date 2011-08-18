set background=dark 
colorscheme ir_black 

syntax on             " Syntax highlightinging

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P 

:filetype indent on

let mapleader = "["

map <Leader>t :CommandT<CR>
map <Leader>b :CommandTBuffer<CR>
map <Leader>n :NERDTreeToggle<CR> " toggling for project tree window

let g:NERDTreeWinSize = 50