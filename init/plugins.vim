call plug#begin()

Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'mg979/vim-visual-multi'
Plug 'skywind3000/vim-auto-popmenu'

call plug#end()

" nerdtree settings

map <F3> :NERDTreeToggle<CR>

" fzf settings

nmap <C-p> :Files<CR>
nmap <C-o> :BTags<CR>
nmap gd :Tags <C-R>=expand("<cword>")<CR><CR>
nmap gs :call fzf#vim#ag(expand("<cword>"), '--literal --word-regexp', fzf#vim#with_preview())<CR>
vmap gs y :call fzf#vim#ag('<C-R>"', '--literal', fzf#vim#with_preview())<CR>
nmap go yi" :call fzf#vim#files('', fzf#vim#with_preview({'options': ['-q', '<C-R>"']}))<CR>

" auto-popmenu settings

let g:apc_enable_ft = {'c':1, 'cpp':1, 'lua':1, 'python':1}
set completeopt=menu,menuone,noselect
set shortmess+=c

" visual-multi settings

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

" gitgutter settings

nmap ghh :GitGutterLineHighlightsToggle<CR>
nmap ghp <Plug>(GitGutterPreviewHunk)
highlight! link SignColumn LineNr
highlight GitGutterAdd cterm=bold ctermfg=2
highlight GitGutterDelete cterm=bold ctermfg=1
highlight GitGutterChange cterm=bold ctermfg=5

" airline settings

let g:airline_theme='luna'
let g:airline#extensions#whitespace#checks = ['indent', 'mixed-indent-file', 'conflicts']

" lsp settings

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

