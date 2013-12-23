" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
set nocompatible
call pathogen#infect() 

let g:NERDTreeDirArrows=0

syntax enable
colorscheme slate
cd $HOME/projects

au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs
au VimEnter *.* setlocal completefunc=CompleteHaddock

map <F2> :cd %:p:h<CR>
map <C-Tab> <C-w><C-w>
nnoremap <C-s> :w<cr>
map <C-F2> :!git add -A && git commit -am "C-F2" && git push origin master<CR>

set relativenumber
set ruler

" tabspaces
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs

filetype plugin indent on
"
" This is standard pathogen and vim setup
"set nocompatible

" ---------------------
"   -- VIM CLOJURE --
" ---------------------
" Let's remember some things, like where the .vim folder is.
"
nnoremap d{ ldi}vhp
nnoremap d} hdi}vhp

nnoremap d( ldi)vhp
nnoremap d) hdi)vhp

nnoremap d[ ldi]vhp
nnoremap d] hdi]vhp

au Bufenter *.clj nnoremap E :Eval<CR>
"au Bufenter *.clj nnoremap E :%Eval<CR>
" K iti arata arata documentatia functie de sub cursor, iar [d codul sursa
" -----------------
"   -- HASKELL --
" -----------------
" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
" let g:haddock_docdir = "/Library/Haskell/ghc-7.4.2/doc"
let g:paredit_mode = 1

au Bufenter *.hs compiler ghc
au Bufenter *.hs map <F6> :!ghc --make -o ~/Sites/%:t:r.cgi %<CR>
au Bufenter *.hs nnoremap <A-.> :GhcModType<CR>
au Bufenter *.hs nnoremap <A-,> :GhcModTypeClear<CR>
au Bufenter *.hs map <A-x> :w<CR>:GhcModCheck<CR>
au Bufenter *.hs map <A-z> :w<CR>:make<CR>
au Bufenter *.hs setlocal concealcursor=vinc
"au Bufenter *.hs setlocal completefunc=CompleteHaddock


" ----------------------
"   -- MOVING LINES --
" ----------------------
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" -------------------
"   -- NEO COMPL --
" -------------------
"source $HOME/.vim/neocomplsettings.vim
"let g:necoghc_enable_detailed_browse = 1

" disable the arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>
nnoremap <A-n> :NERDTreeToggle<cr>
