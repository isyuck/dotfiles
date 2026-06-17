source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/plugs.vim
source $HOME/.config/nvim/sets.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/colo.vim

lua << EOF
require('orgmode').setup({
  org_agenda_files = '~/org/**/*',
  org_default_notes_file = '~/org/inbox.org',
})
EOF
