
" function to enable/disable arrow buttons
function! GuestModeScrollingToggle()
  if g:m_guest_mode_scrolling_enabled
    noremap <Left> <Nop>
    noremap <Right> <Nop>
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    inoremap <Left> <Nop>
    inoremap <Right> <Nop>
    inoremap <Up> <Nop>
    inoremap <Down> <Nop>
    let g:m_guest_mode_scrolling_enabled = 0
  else
    nunmap <Left>
    nunmap <Right>
    nunmap <Up>
    nunmap <Down>
    iunmap <Left>
    iunmap <Right>
    iunmap <Up>
    iunmap <Down>
    let g:m_guest_mode_scrolling_enabled = 1
  endif
endfunction

function! EchoGuestModeState()
  if g:m_guest_mode_scrolling_enabled
    echo "guest mode enabled"
  else
    echo "guest mode disabled"
  endif
endfunction

nnoremap <F4> :call GuestModeScrollingToggle()<CR> :call EchoGuestModeState()<CR>
imap <F4> <C-O><F4>
let g:m_guest_mode_scrolling_enabled = 1
call GuestModeScrollingToggle()

" paste mode toggle
nnoremap <F12> :set paste! paste?<CR>
imap <F12> <C-O><F12>
set pastetoggle=<F12>

" NERDTree
:map <F2> :NERDTreeToggle<CR>
