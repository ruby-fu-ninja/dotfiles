filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

autocmd VimEnter * :IndentGuidesEnable

set background=dark 
colorscheme ir_black 
syntax on             " Syntax highlighting

let g:NERDTreeWinSize = 50 " width of project tree column

map <F5> :NERDTreeToggle<CR> " toggling for project tree window

au BufNewFile,BufRead *.jst set filetype=html

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P 

call pathogen#runtime_append_all_bundles() 

set tabstop=2
set shiftwidth=2
set number

set smartindent
set cindent
set smartindent
set autoindent
set expandtab

