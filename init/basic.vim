syntax on
set nu
set autoindent
set cindent
set expandtab
set smarttab
set smartcase
set hlsearch
set incsearch
set ignorecase
set nocompatible
set lazyredraw
set autoread
set scrolloff=3
set updatetime=100
set backspace=indent,eol,start
set fillchars+=vert:\ "
set ttimeout
set ttimeoutlen=10

" `zc` fold current indent; `zo` unfold current indent; `za` toggle current indent fold.
" `zC` fold current block; `zO` unfold current block; `zA` toggle current block fold.
" `zM` fold the file; `zR` unfold the file.
set foldenable
set fdm=indent
set foldlevel=99

set nowrap
map L 10zl
map H 10zh

filetype on
filetype plugin on
filetype indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

highlight TabLineFill ctermfg=White ctermbg=White
highlight TabLine ctermfg=White ctermbg=DarkGray

nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>
nmap <C-j> :tabm -1<CR>
nmap <C-k> :tabm +1<CR>
nmap <C-n> :nohl <CR>

nmap y/ /<C-R>"<CR>
vnoremap / y :/<C-R>"<CR>
vnoremap ? y :?<C-R>"<CR>
nnoremap <C-]> <C-w><C-]><C-w>L

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

let mapleader = "\<space>"
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 1gt
nmap <leader>t <C-W>T
nmap <leader>o <C-W>o

autocmd BufWritePost *
    \ if g:asyncrun_status != 'running' |
    \     exec "AsyncRun [ ! -e .tmptags ] && [ -e tags ] && ctags -R -o .tmptags && mv .tmptags tags" |
    \ endif

autocmd VimLeave * :! rm -f .tmptags

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \    exe "normal! g`\"" |
    \ endif

