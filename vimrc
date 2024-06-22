" ===== Vundle Installation ==========
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on
" ===== End Vundle Installation ==========

" ===== Custom Commands =========
" Switch working directory to the parent of the file
command! Lcdw lcd %:p:h
command! Cdw cd %:p:h

" ===== Tab stops ==========
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set smarttab
" ===== end Tab stops ==========

" ===== General settings =======
set number
set bg=dark
set belloff=all
" ===== end General settings =======


" ===== Automatic Session =======
function! CheckedLoadSession()
    if @% == ""
        " No filename for the current buffer
        call LoadSessionIfExists()
"    elseif filereadable(@%) == 0
"        " File doesn't exist yet
"        startinsert
"    elseif line('$') == 1 && col('$') == 1
"        " File is empty
"        startinsert
    endif
endfunction

function! LoadSessionIfExists()
    let fname = expand('~/Session.vim')
    if filereadable(fname) == 1
        execute 'source '.fnameescape(fname)
    endif
endfunction

autocmd! VimLeave * mksession! ~/Session.vim
autocmd! VimEnter * call CheckedLoadSession()
