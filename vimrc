"------------------------------------------------------------------------------"
"----------------------------------Mappings------------------------------------"
"------------------------------------------------------------------------------"
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

" Mappings for multiple-cursors plugin
" Note - I always wan't to map the above
" function to <C-n>, however, it makes
" more sense here. I use it more often
" anyways.
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Some temporary mappings for moving 10 lines
" map <C-j> 10j " This messes up navigation in vim :help
" map <C-k> 10k " This messes up navigation in vim :help

" Map NERDTree to ctrl + o
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" Ignore node_modules, DS_Store, git and .pyc files while fuzzy searching via <C-p>
" Second wildignore prevents <C-p> from searching the heck out of vendor
" files in a laravel/php environment
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*.pyc
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,coverage/*,vendor



"------------------------------------------------------------------------------"
"----------------------------------Visuals------------------------------------"
"------------------------------------------------------------------------------"
" Show relative line numbers
set relativenumber 

" Syntax highlighting for Riot (.tag files)
au BufRead,BufNewFile *.tag :set filetype=html

" Set line width for Markdown files
" ggvGgq to select and resize file
au BufRead,BufNewFile *.md setlocal textwidth=160

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
colorscheme onedark
let g:solarized_termcolors=256

" Custom colors for highlights and other terminal locations
hi IncSearch guibg=LightBlue ctermbg=LightBlue term=underline
hi Search guibg=LightBlue ctermbg=LightBlue term=underline
hi LineNr ctermbg=bg

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Syntax highlighting for jsx
let g:jsx_ext_required = 0

" Default tab and space settings
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set backspace=2



"------------------------------------------------------------------------------"
"----------------------------------Helpers-------------------------------------"
"------------------------------------------------------------------------------"
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

