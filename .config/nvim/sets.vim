set noshowmode
set backspace=indent,eol,start
set number
set relativenumber
set signcolumn=no
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set hidden
set smartcase
set cursorline
set nobackup
set fillchars=vert:.
set nowrap
set showcmd
set shell=/bin/zsh
set termguicolors
filetype plugin on
syntax enable


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

" auto comment filetypes and comment types
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType tidal            let b:comment_leader = '-- '

" no auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:clang_library_path='/lib/llvm-7/lib/libclang.so.1'

" glsl syntax highlighting
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp'

colorscheme base16-default-dark

" no end of file tildes
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" remove color for splits
hi VertSplit ctermbg=NONE guibg=NONE
