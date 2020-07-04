call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'supercollider/scvim'

Plug 'tidalcycles/vim-tidal'

Plug 'mhinz/vim-startify'

Plug 'beyondmarc/glsl.vim'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/goyo.vim'

Plug 'chrisbra/Colorizer'

Plug 'chriskempson/base16-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

call plug#end()
