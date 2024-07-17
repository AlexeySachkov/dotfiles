" Configuration of lightline.vim plugin

" TODO: udpate colors (wombat from airline looks better than wombat from
" lightline)
" FIXME: modified component is displayed for terminal buffer regardless of the
" component_visible_condition
" FIXME: component visible condition for 'guest' component doesn't work

let g:lightline = {
\   'colorscheme': 'wombat',
\   'tabline': {
\     'right': []
\   },
\   'active': {
\     'left': [
\       ['mode', 'paste', 'guest'], ['hunks'], ['relativepath'],
\       ['readonly', 'modified']
\     ],
\     'right': [
\       ['lineinfo'], ['fileinfo'], ['filetype']
\     ]
\   },
\   'inactive': {
\     'left': [
\      ['relativepath'], ['readonly', 'modified']
\     ],
\     'right': [
\       ['lineinfo'], ['fileinfo'], ['filetype']
\     ]
\   },
\   'component': {
\     'guest': '%{g:m_guest_mode_scrolling_enabled?"GUEST":""}',
\     'lineinfo': '%{printf("%03d:%02d/%03d",line("."),col("."),line("$"))}',
\     'relativepath': '%{expand("%")==""?"[No Name]":expand("%")}',
\     'fileinfo': '%{(&fenc!=#""?&fenc:&enc)."[".&ff."]"}',
\     'modified': '%m'
\   },
\   'component_visible_condition': {
\     'guest': 'g:m_guest_mode_scrolling_enabled',
\     'modified': '&modifiable&&&modified',
\     'hunks': '%{mode()!=#"t"}'
\   },
\   'component_function': {
\     'hunks': 'LLGitGutterHunks'
\   }
\ }

function! LLGitGutterHunks()
  let l:hunk_symbols = ['+', '~', '-']
  let hunks = GitGutterGetHunkSummary()
  let string = ''
  for i in [0, 1, 2]
    if hunks[i] > 0
      let string .= printf("%s%s ", l:hunk_symbols[i], hunks[i])
    endif
  endfor

  return string
endfunction
