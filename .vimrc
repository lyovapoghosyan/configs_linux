colorscheme ron
syntax enable
set hlsearch 
colorscheme default

set expandtab tabstop=4 shiftwidth=4 autoindent
set colorcolumn=80
set splitright
set number

cmap W w
cmap Q q

autocmd Filetype    python
                \   set ts=4 sw=4 |
                \   setlocal expandtab

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

command! -nargs=1 Count :%s/<args>//gn
