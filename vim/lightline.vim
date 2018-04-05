" Configuration of lightline.vim plugin

" TODO: udpate colors (wombat from airline looks better than wombat from
" lightline)

let g:lightline = {
\   'colorscheme': 'wombat',
\   'tabline': {
\     'right': []
\   },
\   'active': {
\     'left': [
\       ['mode', 'paste', 'guest'], ['readonly', 'modified'], ['relativepath']
\     ],
\     'right': [
\       ['lineinfo'], ['fileinfo'], ['hunks']
\     ]
\   },
\   'inactive': {
\     'left': [
\       ['filename']
\     ],
\     'right': [
\       ['lineinfo'], ['fileinfo']
\     ]
\   },
\   'component': {
\     'mode': '%{&filetype==#"nerdtree"?"":lightline#mode()}',
\     'paste': '%{&filetype==#"nerdtree"?"":&paste?"PASTE":""}',
\     'guest': '%{&filetype==#"nerdtree"?"":g:m_guest_mode_scrolling_enabled?"GUEST":""}',
\     'modified': '%{&filetype==#"nerdtree"?"":&modified?"+":""}',
\     'lineinfo': '%{&filetype==#"nerdtree"?"":printf("%3d:%-2d/%-3d",line("."),col("."),line("$"))}',
\     'filename': '%{&filetype==#"nerdtree"?"NERDTree":expand("%:t")==""?"[No Name]":expand("%:t")}',
\     'relativepath': '%{&filetype==#"nerdtree"?"NERDTree":expand("%")==""?"[No Name]":expand("%")}',
\     'fileinfo': '%{&filetype==#"nerdtree"?"":(&fenc!=#""?&fenc:&enc)."[".&ff."]"}'
\   },
\   'component_visible_condition': {
\     'mode': '&filetype!=#"nerdtree"',
\     'paste': '&filetype!=#"nerdtree"&&&paste',
\     'guest': '&filetype!=#"nerdtree"&&g:m_guest_mode_scrolling_enabled',
\     'modified': '&filetype!=#"nerdtree"&&&modified'
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
