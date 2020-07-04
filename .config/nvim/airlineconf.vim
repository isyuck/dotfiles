" airline theming
let g:airline_theme='base16_default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" remove unicode symbols from airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep           = ''
let g:airline_left_sep           = ''
let g:airline_right_sep          = ''
let g:airline_right_sep          = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.paste      = ''
let g:airline_symbols.paste      = ''
let g:airline_symbols.paste      = ''
let g:airline_symbols.whitespace = ''
