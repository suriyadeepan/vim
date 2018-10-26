" Does this fix characters inserted by arrow keys? 
"  Nope! TODO fix this
set nocompatible

" Line numbers
set number
set numberwidth=5

" Key Mapping 
"  Select word with <space>
"   :noremap <space> viw
"  <ctrl+d> : delete line
noremap <c-d> dd  
"  Cut and paste line below next line
noremap - ddp
"  Move line upward
noremap _ :m -2<cr>

" Upper Case in Visual mode (select text)
vnoremap \ U
" Delete line in Insert mode
"  why won't this ":imap <c-d> dd" work?
"  ":imap <c-d> <esc>dd" will put you in Normal mode
inoremap <c-d> <esc>ddi
" convert current word to UPPER case in Visual mode
inoremap <c-u> <esc>lviwUi
" <cntl+u> in normal Mode to UPPER case word
nnoremap <c-u> viwU

" set Leader
let mapleader = " "
" set Local Leader
let maplocalleader = ";"
" set local Leader
"  delete line using leader
nnoremap <leader>d dd

" Make it easier to (make it easier to (edit text))
"  mapping to open .vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" switch between windows
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j

" save file..
nnoremap s <nop>
nnoremap <leader>s :update<cr>
"  save all files
nnoremap <leader>a :wa<cr>
"  quit all files
nnoremap <leader>qq :qa!<cr>
"  quit file
nnoremap <leader>q :q<cr>
"  vsplit
nnoremap <leader>v :execute "rightbelow vsplit " . bufname('#')<cr>
"  delete rest of the line
nnoremap <leader>d d$
"  next file
nnoremap <leader>n :bn<cr>
"  copy line to clipboard
nnoremap <leader>Y "+Y
"  copy whole file to clipboard
nnoremap <leader>yy vggG"+y
"   (in visual mode) copy to clipboard
vnoremap <leader>y "+y
"  paste from clipboard
nnoremap <leader>p "+p
"  center last line on file
nnoremap <leader>z Gzz
"  TODO how to store a line number; perform an operation; 
"          then jump back to original line

" list buffers
"  TODO figure out a convenient alternative
nnoremap <leader>ls :ls<cr>

" set tab to 2 spaces
syntax on
" set shiftwidth=2
" set tabstop=2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" set autoindent
" filetype plugin on
" filetype on
filetype indent on

" Quote a string
"  TODO analyze
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" TODO vim-surround

" End of line mapping
nnoremap $ <nop>
nnoremap L $
"  Start of line mapping
nnoremap 0 <nop>
"  TODO this doesn't work; fix it
nnoremap H 0w

" <ESC> mapping
inoremap jk <esc>
vnoremap jk <esc>

" Force learning new bindings by disabling older bindings
inoremap <esc> <nop>
"  disable arrow keys
nnoremap <Up> <NOP>
inoremap <Up> <NOP> 
nnoremap <Down> <NOP> 
nnoremap <Left> <NOP> 
nnoremap <Right> <NOP> 
"  disable old leader
nnoremap , <Nop>

" built-in autocomplete
"  TODO supertab plugin
"  TODO autocomplete with dot
" :inoremap <leader><tab> <c-n>
inoremap jl <c-n>

" restore default behaviour of <backspace>
set backspace=2

" autocmd + buffer-local abbreviation
" :autocmd FileType python :iabbrev <buffer> iff if:<left>

" Group autocmd's
augroup auto_python
  autocmd!
  autocmd FileType python :iabbrev <buffer> iff if:<left>
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType python nnoremap <leader>e <esc>:w<cr>:!clear;python3 %<cr>
  " multiline comment in visual mode
augroup END

augroup auto_bash
  autocmd!
  autocmd FileType sh,bash nnoremap <leader>e <esc>:w<cr>:!clear;bash %<cr>
  autocmd FileType sh,bash nnoremap <buffer> <localleader>c I#<esc>
augroup END

" Operator Pending Mappings
"  operate inside parantheses
onoremap p i(
"  operate on text until return
onoremap f /return<cr>
"  inside next paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
"  inside last paranthesis
" onoremap il( :<c-u>normal! F)vi(<cr>
" TODO figure out what the hell is happening here?
onoremap il( ?(<cr> :<c-u>normal! vi(<cr>

"  Markdown heading
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" Highlight keywords
:match Todo /NOTE/
" stop highlighting; it's so annoying 
nnoremap <leader>no :noh<cr> 

" Search options
set hlsearch  " hightlight matches
set incsearch " live search

" Status Line
set statusline=%f\ -\ FileType:\ %y
set statusline+=%=    " switch to right side
set statusline+=%l/%L " current_line / total_lines

" Scrolling
"  TODO get this to work properly
nnoremap <leader>zz 20jzz
