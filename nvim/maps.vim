" remap ctrl+w+(hjkl) for split navigation to ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" quick exit
nnoremap ZQ  :q!<CR>

let g:AutoPairsShortcutJump = '<S-Tab>'

" auto comment with cc
noremap <silent> \cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" auto uncomment with cc
noremap <silent> \cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" align selection in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" align for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" yank line to xsel
nmap <leader>cp :.w !xsel -b<CR>

" open new file through fzf
nmap <leader>e :Files<CR>

" go to buffer through fzf
nmap <leader>b :Buffers<CR>

" go to line through fzf
nmap <leader>/ :Lines<CR>

" new empty buffer
nmap <leader>t :enew<CR>

" next buffer
nmap <leader>l :bnext<CR>

" previous buffer
nmap <leader>h :bprevious<CR>

" close current buffer; move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

" make cpp from vim
nmap <leader>m :make!<CR>

" run cpp from vim
nmap <leader>r :!make RunRelease<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
