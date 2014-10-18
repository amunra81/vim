source $HOME/.vim/vimrc/vimrc.unix.vim

map µ :NERDTreeToggle<cr>
" * Haskell bindings
au Bufenter *.hs nnoremap ≥ :GhcModType<CR>
au Bufenter *.hs nnoremap ≤ :GhcModTypeClear<CR>
au Bufenter *.hs map ≈ :w<CR>:GhcModCheck<CR>
au Bufenter *.hs map Ω :w<CR>:make<CR>

au Bufenter *.c map Ω \rc
au Bufenter *.cpp map Ω \rc


