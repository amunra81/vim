"am scris si eu ceva aici 
"set nu

syntax enable
colorscheme slate

au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs
au Bufenter *.hs compiler ghc
au Bufenter *.hs map <F5> :!ghc --make -o ~/Sites/%:t:r.cgi %<CR>
au Bufenter *.hs map <F9> :w<CR>:make<CR>
au Bufenter *.hs map <F9> :w<CR>:make<CR>
"au Bufenter *.hs setlocal completefunc=CompleteHaddock

map <F2> :cd %:p:h<CR>
map <C-Tab> <C-w><C-w>
set expandtab
set tabstop=4
set shiftwidth=4

filetype plugin indent on
"
" This is standard pathogen and vim setup
"set nocompatible
call pathogen#infect() 
"syntax on
filetype plugin indent on

" ---------------------
"   -- VIM CLOJURE --
" ---------------------
"
" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"

" -----------------
"   -- HASKELL --
" -----------------
" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
" let g:haddock_docdir = "/Library/Haskell/ghc-7.4.2/doc"
let g:paredit_mode = 1
" Paredit

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
source ~/.vim/neocomplsettings.vim
let g:necoghc_enable_detailed_browse = 1
