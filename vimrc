""" Show relative line numbers
set relativenumber

""" But, toggle between relative and absolute via <C-t>
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-t> :call NumberToggle()<cr>

""" Mappings for multiple-cursors plugin
""" Note - I always wan't to map the above 
""" function to <C-n>, however, it makes
""" more sense here. I use it more often
""" anyways.

" Default mappings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

""" Tab and space settings
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set backspace=2

""" Highlight Searches and highlight while searching 
set hlsearch
set incsearch
set ignorecase!

""" Be able to clear highlights
""" <Ctrl-l> in order to do so
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

set autoindent

" ColorScheme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Powerline Font for vim-airline
let g:airline_powerline_fonts = 1

" Syntax highlighting for jsx
let g:jsx_ext_required = 0

" Syntax highlighting for Riot (.tag files)
au BufRead,BufNewFile *.tag :set filetype=html

" Set line width for Markdown files
" ggvGgq to select and resize file
au BufRead,BufNewFile *.md setlocal textwidth=160

" Syntax highlighting for Handlebars
au BufRead,BufNewFile *.handlebars :set filetype=html

" Syntax highlighting for EJS
au BufRead,BufNewFile *.ejs :set filetype=html

" Powerline font for vim-airline
let g:airline_powerline_fonts = 1

" Syntax highlighting for jsx
let g:jsx_ext_required = 0

" Syntax highlighting for Riot (.tag files)
au BufRead,BufNewFile *.tag :set filetype=html

" Enable mouse to keep myself sane
set mouse=a

" Turn off compatibility of old vi stuff
set nocompatible

" Use filetype plugins
filetype plugin indent on

" Use pathogen to manage runtimepath
execute pathogen#infect()

" Map NERDTree to ctrl + o
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore = ['\.pyc$']
