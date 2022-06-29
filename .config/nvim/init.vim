call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'townk/vim-autoclose'
Plug 'dylanaraps/wal.vim'

call plug#end()


set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nu
"highlight ColorColumn ctermbg=white

"if (has("termguicolors"))
	set termguicolors
"endif
"syntax enable
"colorscheme tender
colorscheme one
"colorscheme wal
"set background=dark

let g:airline_theme='one'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
