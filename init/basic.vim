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

set nowrap
map L 10zl
map H 10zh

let g:airline_theme='luna'

filetype on
filetype plugin on
filetype indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

nmap ghh :GitGutterLineHighlightsToggle<CR>
nmap ghp <Plug>(GitGutterPreviewHunk)
highlight! link SignColumn LineNr
highlight GitGutterAdd cterm=bold ctermfg=2
highlight GitGutterDelete cterm=bold ctermfg=1
highlight GitGutterChange cterm=bold ctermfg=5

highlight TabLineFill ctermfg=White ctermbg=White
highlight TabLine ctermfg=White ctermbg=DarkGray

map <F3> :NERDTreeToggle<CR>

nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>
nmap <C-j> :tabm -1<CR>
nmap <C-k> :tabm +1<CR>
nmap <C-o> :BTags<CR>
nmap <C-n> :nohl <CR>
nmap <C-p> :Files<CR>
nmap gd :Tags <C-R>=expand("<cword>")<CR><CR>
nmap gs :call fzf#vim#ag(expand("<cword>"), '--literal --word-regexp', fzf#vim#with_preview())<CR>
vmap gs y :call fzf#vim#ag('<C-R>"', '--literal', fzf#vim#with_preview())<CR>
nmap go yi" :call fzf#vim#files('', fzf#vim#with_preview({'options': ['-q', '<C-R>"']}))<CR>

nmap y/ /<C-R>"<CR>
vnoremap / y :/<C-R>"<CR>
vnoremap ? y :?<C-R>"<CR>

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

autocmd BufWritePost * if g:asyncrun_status != 'running' | AsyncRun [ ! -e .tmptags ] && [ -e tags ] && ctags -R -o .tmptags && mv .tmptags tags
autocmd VimLeave * :! rm -f .tmptags
let g:airline#extensions#whitespace#checks = ['indent', 'mixed-indent-file', 'conflicts']
nnoremap <C-]> <C-w><C-]><C-w>L

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

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

let g:apc_enable_ft = {'c':1, 'cpp':1, 'lua':1, 'python':1}
set completeopt=menu,menuone,noselect
set shortmess+=c

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \    exe "normal! g`\"" |
    \ endif

