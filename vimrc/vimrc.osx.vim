source $HOME/.vim/vimrc/vimrc.unix.vim

map µ :NERDTreeToggle<cr>
" * Haskell bindings
"au Bufenter *.hs nnoremap ≥ :GhcModType<CR>
"au Bufenter *.hs nnoremap ≤ :GhcModTypeClear<CR>
au Bufenter *.hs nnoremap … :HdevtoolsType<CR>
au Bufenter *.hs nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.hs nnoremap <leader>it :HdevtoolsInsertType<CR>
au Bufenter *.hs nnoremap ¬ :HdevtoolsClear<CR>
au Bufenter *.hs nnoremap æ :HdevtoolsInfo<CR>
au Bufenter *.hs map ≈ :w<CR>:GhcModCheckAsync<CR>
au Bufenter *.hs map Ω :w<CR>:make<CR>

au Bufenter *.c map Ω \rc
au Bufenter *.cpp map Ω \rc

au Bufenter *.js nnoremap ≈ :FlowMake<CR>
au Bufenter *.js nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.js nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
"au Bufenter *.js nnoremap ≥ :FlowType<CR>
"au Bufenter *.js nnoremap <C-]> :FlowJumpToDef<CR>

"au Bufenter *.ts nnoremap ≥ : echo tsuquyomi#hint()<CR>
"au Bufenter *.ts nnoremap ≥ :TSType<CR>
"au Bufenter *.tsx nnoremap ≥ :TSType<CR>
"au Bufenter *.ts nnoremap <C-]> :TSDef<CR>
"au Bufenter *.tsx nnoremap <C-]> :TSDef<CR>
au Bufenter *.ts nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.ts nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
au Bufenter *.tsx nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.tsx nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
