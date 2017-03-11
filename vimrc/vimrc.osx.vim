source $HOME/.vim/vimrc/vimrc.unix.vim

map µ :NERDTreeToggle<cr>
" * Haskell bindings
au Bufenter *.hs nnoremap ≥ :GhcModType<CR>
au Bufenter *.hs nnoremap ≤ :GhcModTypeClear<CR>
au Bufenter *.hs nnoremap … :HdevtoolsType<CR>
au Bufenter *.hs nnoremap ¬ :HdevtoolsClear<CR>
au Bufenter *.hs nnoremap æ :HdevtoolsInfo<CR>
au Bufenter *.hs map ≈ :w<CR>:GhcModCheckAsync<CR>
au Bufenter *.hs map Ω :w<CR>:make<CR>

au Bufenter *.c map Ω \rc
au Bufenter *.cpp map Ω \rc
