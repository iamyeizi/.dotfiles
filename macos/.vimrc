set nocompatible
set mouse=a
set tabstop=4
set shiftwidth=4
set ai
"set number
set hlsearch
"set ruler
highlight Comment ctermfg=green
syntax on
set clipboard=unnamed
"set relativenumber
set incsearch

" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the highlighting so it stands out
" hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2
