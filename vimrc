""
" Mappings
"
let mapleader = ','

" Make it easy to edit vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Clear highlights easily
nmap <Leader><space> :nohlsearch<cr>

" Use ctags more efficiently
nmap <Leader>f :tag<space>

" Highlight under cursor but don't jump to next word by default
nnoremap * :keepjumps normal! mi*`i<CR>`

" Jump between splits with <C-motion> instead of <C-W> motion
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" tmp to try out <leader>wtf in a ruby file
" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>"

" Mappings for multiple-cursors plugin
" Note - I always wan't to map the above
" function to <C-n>, however, it makes
" more sense here. I use it more often
" anyways.
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Mappings to format elm code on save
" part of the 'elm-vim' package
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0

" Map NERDTree to ctrl + o
map <C-o> :NERDTreeToggle<CR>
" Reveal file in tree -> leader + |
map <C-\> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Ignore node_modules, DS_Store, git and .pyc files while fuzzy searching via <C-p>
" Second wildignore prevents <C-p> from searching the heck out of vendor
" files in a laravel/php environment
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let NERDTreeRespectWildIgnore=1
set wildignore+=*.pyc
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,coverage/*,vendor,*.swp,*.*.swp
set wildignore+=*.beam

" map ctrl-g to vim-ripgrep for fast searching
map <C-g> :Rg 

""
" Visuals
"
" Show relative line numbers but current line show number
set number
set relativenumber

" Syntax highlighting for Riot (.tag files)
au BufRead,BufNewFile *.tag :set filetype=html

" Set line width for Markdown files
" ggvGgq to select and resize file
au BufRead,BufNewFile *.md setlocal textwidth=120

" Set line width for txt files
au BufRead,BufNewFile *.txt setlocal textwidth=120

" Syntax highlighting for Handlebars
au BufRead,BufNewFile *.handlebars :set filetype=html

" Syntax highlighting for EJS
au BufRead,BufNewFile *.ejs :set filetype=html

" Syntax highlighting for Riot (.tag files)
au BufRead,BufNewFile *.tag :set filetype=html

" Enable mouse to keep sanity
set mouse=a

" Turn off compatibility of old vi stuff
set nocompatible

" Use filetype plugins
filetype plugin indent on

" Highlight Searches and highlight while searching
set incsearch
set hlsearch
set ignorecase!

set autoindent

" colorscheme
syntax enable
colorscheme nord " with matching iterm theme
let g:solarized_termcolors=256

""
" emmet-vim
"
let g:user_emmet_leader_key=','

""
" Airline
"
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Default tab and space settings
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set backspace=2

""
" Helpers
"
" Toggle between relative and absolute via <C-t>
function! NumberToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-t> :call NumberToggle()<cr>

" Use pathogen to manage runtimepath
execute pathogen#infect()

