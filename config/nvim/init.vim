" Some basic configs
set mouse=v
set paste
set termguicolors
" Indentation settings
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
" Nerdtree
Plug 'scrooloose/nerdtree'
" Onedark theme
Plug 'joshdick/onedark.vim'
" Vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" NERD_tree config
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '\nvim.init$',]
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Airline config
let g:airline_theme='durant'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

