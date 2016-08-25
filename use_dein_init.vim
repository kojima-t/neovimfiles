set nobackup
set showmatch
set list
set listchars=tab:->,trail:_
set expandtab
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set clipboard+=unnamedplus
set wrap
" font
set guifont=Osaka－等幅\ 12
set linespace=0

" Git commit message
set spelllang=en,cjk
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit startinsert

" tex {{{
augroup filetype
    autocmd!
    " tex file (I always use latex)
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile *.cls set filetype=tex
augroup END
    " disable the conceal function
let g:tex_conceal=''
autocmd FileType tex setlocal runtimepath+=/home/hikaru/.config/nvim/ftplugin
" }}}

" markdown {{{
au BufRead,BufNewFile *.md set filetype=markdown
" }}}

" ruby {{{
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" }}}

"

"dein settings {{{
if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

"if dein#load_state(s:dein_dir)
call dein#begin(s:dein_dir)

let s:toml = s:dein_dir . '/dein.toml'
let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'
call dein#load_toml(s:toml, { 'lazy' : 0 })
call dein#load_toml(s:lazy_toml, { 'lazy' : 1 })

call dein#end()
call dein#save_state()
"endif

if dein#check_install(['vimproc'])
    call dein#install(['vimproc'])
endif

if dein#check_install()
    call dein#install()
endif

" }}}

syntax on
