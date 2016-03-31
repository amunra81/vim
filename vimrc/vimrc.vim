" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
set t_Co=256
call plug#begin('~/.vim/plugged')
 " javascript
 Plug 'pangloss/vim-javascript'
 Plug 'nathanaelkane/vim-indent-guides'
 Plug 'jelera/vim-javascript-syntax'
 Plug 'Raimondi/delimitMate'
 Plug 'marijnh/tern_for_vim'
 Plug 'mxw/vim-jsx'
 Plug 'helino/vim-json'
 
 " Ag shearch
 Plug 'rking/ag.vim'
 Plug 'Chun-Yang/vim-action-ag'

 Plug 'eparreno/vim-l9'
 Plug 'Valloric/YouCompleteMe'
 Plug 'chrisbra/csv.vim'
 Plug 'vim-scripts/dbext.vim'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-scripts/FuzzyFinder'
 Plug 'eagletmt/ghcmod-vim'
 Plug 'airblade/vim-gitgutter'
 "Plug 'Twinside/vim-haskellConceal'
 "Plug 'lukerandall/haskellmode-vim'
 Plug 'tpope/vim-jdaddy'
 Plug 'eagletmt/neco-ghc'
 Plug 'scrooloose/nerdcommenter'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'vim-scripts/paredit.vim'
 Plug 'tpope/vim-projectionist'
 Plug 'edkolev/promptline.vim'
 Plug 'ervandew/screen'
 Plug 'tpope/vim-sensible'
 Plug 'vim-scripts/SQLComplete.vim'
 Plug 'scrooloose/syntastic'
 Plug 'vim-scripts/taglist.vim'
 Plug 'bling/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'tpope/vim-classpath'
 Plug 'guns/vim-clojure-highlight'
 Plug 'guns/vim-clojure-static'
 Plug 'tpope/vim-fireplace'
 Plug 'Twinside/vim-haskellFold'
 Plug 'tpope/vim-leiningen'
 Plug 'vim-scripts/vim-niji'
 Plug 'tpope/vim-surround'
 Plug 'Twinside/vim-syntax-haskell-cabal'
 Plug 'dag/vim2hs'
 Plug 'Shougo/vimproc.vim'
 Plug 'Shougo/vimshell.vim'
 Plug 'vim-scripts/bufexplorer.zip'
 Plug 'pbrisbin/vim-syntax-shakespeare'
 Plug 'diepm/vim-rest-console'
 Plug 'Twinside/vim-hoogle'
 Plug 'majutsushi/tagbar'
 "COLORS
 Plug 'zefei/cake16'
 Plug 'flazz/vim-colorschemes'
 Plug 'sjl/gundo.vim'
 Plug 'kien/ctrlp.vim'
 Plug 'tpope/vim-vinegar'
 Plug 'junegunn/vim-easy-align'
 " shortcut gaip=
call plug#end()

set nocompatible

"let g:NERDTreeDirArrows=0

syntax enable
colorscheme apprentice
"cd $HOME/projects

au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs
au BufRead,BufNewFile *.cljc set filetype=clojure
au VimEnter *.hs setlocal completefunc=CompleteHaddock

map <F2> :cd %:p:h<CR>
map ç :HLint<CR>
map <C-Tab> <C-w><C-w>
nnoremap <C-s> :w<cr>
map <C-F2> :!git add -A && git commit -am "C-F2" && git push origin master<CR>
map <C-F3> :!git add -A && git commit -am "C-F2"<CR>
set hlsearch
noremap ÷ :let @/ = ""<cr>

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
au Bufenter *.cljc nnoremap E :Eval<CR>
" K iti arata arata documentatia functie de sub cursor, iar [d codul sursa
" -----------------
"   -- HASKELL --
" -----------------
" Configure browser for haskell_doc.vim
"let g:haddock_browser = "open"
"let g:haddock_browser_callformat = "%s %s"
"let g:haddock_docdir = "/Users/horus/Library/Haskell/Current/share/"
"let g:paredit_mode = 1

"au Bufenter *.hs compiler ghc
"au Bufenter *.hs map <F6> :!ghc --make -o ~/Sites/%:t:r.cgi %<CR>
au Bufenter *.hs nnoremap <A-.> :GhcModType<CR>
au Bufenter *.hs nnoremap <A-,> :GhcModTypeClear<CR>
au Bufenter *.hs nnoremap <A-x> :w<CR>:GhcModCheck<CR>
au Bufenter *.hs nnoremap <A-z> :w<CR>:make<CR>
"au Bufenter *.hs setlocal completefunc=CompleteHaddock

 
" CONFIGURATION for neco-ghc
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" -----------------
"   -- C/C++ --
" -----------------
"au Bufenter *.c map <A-z> \rc
"au Bufenter *.cpp map <A-z> \rc

" ----------------------
"   -- MOVING LINES --
" ----------------------
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+1<CR>==

inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi

vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv

" -------------------
"   -- NEO COMPL --
" -------------------
"source $HOME/.vim/neocomplsettings.vim
"let g:necoghc_enable_detailed_browse = 1

" disable the arrow keys
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>
nnoremap ,m :NERDTreeToggle<cr>
nnoremap ,n :NERDTreeFind<cr>

"nnoremap ∆ ddp
"nnoremap ˚ ddkkp

"inoremap <esc> <nop>
inoremap jk <Esc>
inoremap jj <Esc>

" adding maps for vimrc/gvimrc files
nnoremap <leader>rc :split $HOME/.vim/vimrc/vimrc.vim<cr>  
nnoremap <leader>rcu :split $HOME/.vim/vimrc/vimrc.unix.vim<cr>  
nnoremap <leader>rcl :split $HOME/.vim/vimrc/vimrc.linux.vim<cr>  
nnoremap <leader>rcw :split $HOME/.vim/vimrc/vimrc.win.vim<cr>  
nnoremap <leader>rco :split $HOME/.vim/vimrc/vimrc.osx.vim<cr>  

nnoremap <leader>grc :split $HOME/.vim/vimrc/gvimrc.vim<cr>  
nnoremap <leader>grcu :split $HOME/.vim/vimrc/gvimrc.unix.vim<cr>  
nnoremap <leader>grcl :split $HOME/.vim/vimrc/gvimrc.linux.vim<cr>  
nnoremap <leader>grcw :split $HOME/.vim/vimrc/gvimrc.win.vim<cr>  
nnoremap <leader>grco :split $HOME/.vim/vimrc/gvimrc.osx.vim<cr>  

" new line and enter in the normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <S-CR> O<esc>
nnoremap <A-CR> o<esc>


nnoremap <S-Space> i<space><esc>l
nnoremap <S-Tab> i<tab><esc>l
inoremap <C-x> <esc>lxi

" Vimscript file settings ---------------------- {{{
augroup maps
    au!
    nnoremap <leader>/ :/\c
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vimscript  ---------------------- {{{
noremap <F9> :exec 'source '.bufname('%')<cr>
" }}}

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0

let g:haskell_conceal              = 0
let g:necoghc_enable_detailed_browse = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" scroll of 
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
set cursorline

"gundu
nnoremap <F5> :GundoToggle<CR>
"
"EASY ALIGN
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"
"AG SEARCH
"
" use * to search current word in normal mode
"nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
"vmap * <Plug>AgActionVisual
