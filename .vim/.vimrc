set nocompatible " be iMproved, required

" At least let yourself know what mode you're in
set showmode

colorscheme desert

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в
" режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" опуститься в режиме редактирования
set scrolloff=7

syntax on

set expandtab
set smarttab
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4

set ruler
set number
set colorcolumn=80
set wrap

set showmatch
set hlsearch
set incsearch
set smartcase

set splitbelow
set splitright

nnoremap <Tab> <C-W><C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

:set list
:set listchars=tab:>-

execute pathogen#infect()
