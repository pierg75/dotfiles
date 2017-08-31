" Some basic configs
set mouse=a
set paste
set termguicolors

" Indentation settings
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Spelling
set spelllang=en,it
set spell

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
" Neomake (syntastic like)
Plug 'neomake/neomake'
" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
" Deoplete plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tweekmonster/deoplete-clang2'
Plug 'zchee/deoplete-jedi'
" Colorscheme
Plug 'baskerville/bubblegum'
" Colorscheme
Plug 'mhartington/oceanic-next'
" Colorscheme
Plug 'MaxSt/FlatColor'
" Colorscheme
Plug 'ChrisKempson/Tomorrow-Theme'
" Drawit
Plug 'vim-scripts/DrawIt'
" Gutentags
Plug 'ludovicchabant/vim-gutentags'
" tagbar
Plug 'majutsushi/tagbar'
" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" The silver search
Plug 'ggreer/the_silver_searcher'
" ack.vim
Plug 'mileszs/ack.vim'
" Chromatica
Plug 'arakashic/chromatica.nvim'
" iron.vim
Plug 'hkupty/iron.nvim'


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
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'gruvbox'
let g:airline_theme= 'oceanicnext'

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Cscope settings
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
" Cscope mappings
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one
nmap <C-Space><C-Space>s
		\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
		\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
		\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
		\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
		\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
		\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
		\:vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>a
		\:vert scs find a <C-R>=expand("<cword>")<CR><CR>

" Deoplete config
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	  let g:deoplete#omni#input_patterns = {}
  endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
	autocmd!
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
augroup end

" Colorscheme
autocmd BufEnter * colorscheme OceanicNext
autocmd BufEnter *.py colorscheme onedark

" Gutentags
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_options_file = '' 
let g:gutentags_options_file = '' 
let g:gutentags_define_advanced_commands = 1

" tagbar
nmap <F8> :TagbarToggle<CR>

"ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Chromatica
let g:chromatica#libclang_path='/usr/lib64/'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1
