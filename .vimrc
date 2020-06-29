call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'supercollider/scvim'
Plug 'tidalcycles/vim-tidal'
Plug 'mhinz/vim-startify'
Plug 'beyondmarc/glsl.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'chrisbra/Colorizer'
Plug 'lifepillar/vim-colortemplate'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:airline_theme='base16_default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = ''

" quick comment
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType tidal            let b:comment_leader = '-- '

noremap <silent> \cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> \cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

set noshowmode
set number
set relativenumber
set laststatus=2
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

let g:clang_library_path='/lib/llvm-7/lib/libclang.so.1'
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp'


filetype plugin on

" remove color for splits
hi VertSplit ctermbg=NONE guibg=NONE

" no auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" config for supercollider & vim
let g:scFlash = 1
let g:sclangPipeApp    = "~/.vim/plugged/scvim/bin/start_pipe"
let g:sclangDispatcher = "~/.vim/plugged/scvim/bin/sc_dispatcher"
let g:scSplitDirection = "h"
let g:scSplitSize = 40

" remap ctrl+w+(hjkl) for split navigation to ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open new file through fzf
nmap <leader>y :Files<CR>

" go to buffer through fzf
nmap <leader>u :Buffers<CR>

" go to line through fzf
nmap <leader>i :Lines<CR>

" new empty buffer
nmap <leader>t :enew<CR>

" next buffer
nmap <leader>l :bnext<CR>

" previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" make oF from vim
nmap <leader>e :make!<CR>

" run oF from vim
nmap <leader>r :!make RunRelease<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

syntax enable
set t_Co=256
set termguicolors
colo base16-default-dark

set backspace=indent,eol,start
set completeopt-=preview
fixdel
" no end of file tildes
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" change ycm error colors to be visible
highlight YcmWarningLine guibg=#222222
highlight YcmWarningSection guibg=#222222
