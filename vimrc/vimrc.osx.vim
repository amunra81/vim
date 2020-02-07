source $HOME/.vim/vimrc/vimrc.unix.vim

map µ :NERDTreeToggle<cr>


" shift + alt + > 
noremap ˘ :NextColorScheme<cr>  
noremap ¯ :PrevColorScheme<cr>
noremap ƒ :Prettier<cr>:ALEFix<cr>

" * Haskell bindings
"au Bufenter *.hs nnoremap ≥ :GhcModType<CR>
"au Bufenter *.hs nnoremap ≤ :GhcModTypeClear<CR>
au Bufenter *.hs nnoremap ≥ :HdevtoolsType<CR>
au Bufenter *.hs nnoremap ≤ :HdevtoolsClear<CR>
"au Bufenter *.hs nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.hs nnoremap <leader>it :HdevtoolsInsertType<CR>
au Bufenter *.hs nnoremap æ :HdevtoolsInfo<CR>
au Bufenter *.hs nnoremap K :HoogleInfo<CR>
au Bufenter *.hs map Ω :w<CR>:make<CR>
"au Bufenter *.hs nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>

au Bufenter *.c map Ω \rc
au Bufenter *.cpp map Ω \rc
au Bufenter *.c nnoremap ≈ :make<CR>

au Bufenter *.js nnoremap ≈ :FlowMake<CR>
au Bufenter *.js nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.js nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>

au Bufenter *.cs nnoremap <C-]>  :OmniSharpGotoDefinition<CR>

au Bufenter *.fs nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.fs nnoremap <leader>ir :call LanguageClient#textDocument_references()<CR>
au Bufenter *.fs nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
au Bufenter *.fs map Ω :w<CR>:make<CR>
au Bufenter *.fsx nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.fsx nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>

"nnoremap Ô <C-W><C-J>
"nnoremap  <C-W><C-K>
"nnoremap Ó <C-W><C-L>
"nnoremap Ò <C-W><C-H>

au Bufenter *.ts nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.ts nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
au Bufenter *.tsx nnoremap ≥ :call LanguageClient#textDocument_hover()<CR>
au Bufenter *.tsx nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
