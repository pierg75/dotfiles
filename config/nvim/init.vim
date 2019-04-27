" Some basic configs
set mouse=a
set paste
set modeline
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set nojoinspaces    
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Indentation settings
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

set modeline
" Spelling
set spelllang=en,it
set spell

" Themes
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
" There seems to be a issue with setting colors from plugins.
" As workaround; do 
" # mkdir ~/.config/nvim/colors; cp ~/.local/share/nvim/plugged/oceanic-next/colors/OceanicNext.vim ~/.config/nvim/colors/
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
" Nerdtree
Plug 'scrooloose/nerdtree'
" Nerdtree plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
" tagbar
Plug 'majutsushi/tagbar'
" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ACK
Plug 'mileszs/ack.vim'
" Neomake
Plug 'neomake/neomake'
" Chromatica
Plug 'arakashic/chromatica.nvim'
" coc
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Racer
Plug 'racer-rust/vim-racer'
" Rust
Plug 'rust-lang/rust.vim'
" Cargo
Plug 'timonv/vim-cargo'
" Vim-racer
Plug 'racer-rust/vim-racer'


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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" let g:airline_theme='badcat'
"let g:airline_theme='oceanicnext'
let g:airline_theme='lucius'

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

" tagbar
nmap <F8> :TagbarToggle<CR>

" FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>f :Files<cr>

"ACK
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>t :Files<cr>
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>

" Neomake config
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif


" Chromatica
" On newer Fedora you need to make a link for clang lib:
" ln -s /usr/lib64/libclang.so.7 /usr/lib64/libclang.so
let g:chromatica#libclang_path='/usr/lib64/'
let g:chromatica#enable_at_startup=1

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-racer
set hidden
let g:racer_cmd = "/home/plambri/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

