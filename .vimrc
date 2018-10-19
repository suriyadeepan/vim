" basic config
color 1989
" --------

" Friendly cat face
echo ">^.^<"
" TODO fetch dynamically from file/web
" --------

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
noremap _ :m -2<CR>

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

" save file.
nnoremap s <nop>
nnoremap <leader>s :w<cr>
"  save all files
nnoremap <leader>a :wa<cr>
"  quit all files
nnoremap <leader>qq :qa<cr>
"  quit file
nnoremap <leader>q :q<cr>
"  vsplit
nnoremap <leader>v :vsplit<cr>
"  delete rest of the line
nnoremap <leader>d d$
"  next file
nnoremap <leader>n :bn<cr>
"  copy to clipboard
nnoremap <leader>Y "+Y
"   (in visual mode) copy to clipboard
vnoremap <leader>y "+y
"  paste from clipboard
nnoremap <leader>p "+p
"  center last line on file
nnoremap <leader>z Gzz
"  TODO : how to store a line number; perform an operation; 
"          then jump back to original line

" set tab to 2 spaces
syntax on
" set shiftwidth=2
" set tabstop=2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" set autoindent
" filetype plugin on
" filetype on
filetype indent on

" execute python script
"  TODO : analyze
nnoremap <leader>sp <Esc>:w<CR>:!clear;python3 %<CR>

" Quote a string
"  TODO : analyze
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" TODO : vim-surround

" End of line mapping
nnoremap $ <nop>
nnoremap L $
"  Start of line mapping
nnoremap 0 <nop>
nnoremap H 0

" <ESC> mapping
inoremap jk <esc>
vnoremap jk <esc>

" Force learning new bindings by disabling older bindings
inoremap <esc> <nop>
"  disable arrow keys
nnoremap <Up> <nop> 
inoremap <Up> <nop> 
nnoremap <Down> <nop> 
nnoremap <Left> <nop> 
nnoremap <Right> <nop> 
"  disable old leader
nnoremap , <nop>

" built-in autocomplete
"  TODO : supertab plugin
"  TODO : autocomplete with dot
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
augroup END

" TODO : when opening multiple files, open 2 files with a vsplit

"  asciidoc autocmd
augroup auto_adoc
  autocmd!
  autocmd BufNewFile,BufRead *.adoc :vsplit template.adoc | Nread https://gist.githubusercontent.com/suriyadeepan/cef70efe02bae33935a6a78825aa8af2/raw/868a373aab278f569220eb4a1824ced1a6304b4d/template.adoc
augroup END

"  pull .gitignore from web
augroup auto_gitignore
  autocmd!
  autocmd BufNewFile *.gitignore :Nread https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore | write
augroup END

"  vimrc autocmd
augroup auto_vimrc
  autocmd!
  autocmd FileType vim :iabbrev <buffer> aug augroup auto_<name><cr>autocmd!<cr>autocmd <FileType/BufNewFile,BufRead> * :echom <command> \| <command><cr>augroup END
augroup END

"  create requirements.txt using `pip freeze`
augroup auto_requirements
  autocmd!
  autocmd BufNewFile requirements.txt :0read !pip freeze
augroup END
