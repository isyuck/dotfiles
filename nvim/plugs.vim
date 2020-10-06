call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'supercollider/scvim'

Plug 'fholgado/minibufexpl.vim'

Plug 'tidalcycles/vim-tidal'

" Plug 'mhinz/vim-startify'

Plug 'Yggdroot/indentLine'

" Plug 'beyondmarc/glsl.vim'

Plug 'tikhomirov/vim-glsl'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/goyo.vim'

" Plug 'chrisbra/Colorizer'

Plug 'chriskempson/base16-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/limelight.vim'

" Plug 'rakr/vim-one'

Plug 'honza/vim-snippets'

call plug#end()
