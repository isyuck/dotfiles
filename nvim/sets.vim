set noshowmode
set backspace=indent,eol,start
set number
set relativenumber
set signcolumn=no
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hidden
set smartcase
set nobackup
set fillchars=vert:.
set nowrap
set showcmd
set shell=/bin/zsh
set termguicolors
set title
set titlestring=%f\ %m
filetype plugin on
syntax enable

" auto resize vim with terminal resize
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

let g:startify_custom_header = map(split(system('nvim -v | head -n1 | tr "[:upper:]" "[:lower:]"'), ''), '"   ". v:val') + ['','']

let g:startify_enable_special = 1
let g:startify_change_to_dir  = 1
let g:startify_relative_path  = 1
let g:startify_files_number   = 10

let g:startify_commands = [
    \ {'f': ['<edit file from current dir>', 'Files']},
    \ {'n': ['<new note>', 'e ~/notes/newnote | startinsert | set norelativenumber | set nonumber']},
    \ ]

let g:startify_list_order = [
    \ ['recent'], 'files',
    \ ['sessions'], 'sessions',
    \ ['bookmarks'], 'bookmarks',
    \ ['commands'], 'commands',
    \ ]

let g:goyo_width = 100
let g:goyo_linenr = 1

" tidalvim without tmux
let g:tidal_target = "terminal"

" no netrw banner
let g:netrw_banner = 0
" open files in previous window
let g:netrw_browse_split = 4
" % of window that netrw takes up
let g:netrw_winsize = 25
let g:netrw_altv = 1
" line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" change ycm error colors to be visible
" needs better colors...
highlight YcmWarningLine guibg=#222222
highlight YcmWarningSection guibg=#222222


" no auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:clang_library_path='/lib/llvm-7/lib/libclang.so.1'

" glsl syntax highlighting
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp'

