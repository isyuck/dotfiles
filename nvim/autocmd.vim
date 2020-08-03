" run goyo on startup
autocmd VimEnter * Goyo 
" exit vim when exiting goyo
autocmd! User GoyoLeave q

" auto comment filetypes and comment types
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType tidal,hs         let b:comment_leader = '-- '

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
