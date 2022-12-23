let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

LoadScript init/basic.vim
LoadScript init/plugins.vim
