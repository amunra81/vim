" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
set encoding=utf-8
set noswapfile
set t_Co=256
let t_8f = "[38:2:%lu:%lu:%lum"
let t_8b = "[48:2:%lu:%lu:%lum"

call plug#begin('~/.vim/plugged')
 "" javascript
 Plug 'skielbasa/vim-material-monokai'
 Plug 'nathanaelkane/vim-indent-guides'
 Plug 'Raimondi/delimitMate'
 "Plug 'flowtype/vim-flow'
 Plug 'amunra81/vim-flow'
 Plug 'pangloss/vim-javascript'  
 "Plug 'jelera/vim-javascript-syntax'
 Plug 'maxmellon/vim-jsx-pretty'
 "Plug 'mxw/vim-jsx'
 "
 "Plug 'helino/vim-json'
 
 " Ag shearch ************************
 Plug 'rking/ag.vim'
 Plug 'Chun-Yang/vim-action-ag'
 "************************************

 Plug 'eparreno/vim-l9'

 Plug 'Valloric/YouCompleteMe'



 Plug 'chrisbra/csv.vim'
 "Plug 'vim-scripts/dbext.vim'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-fugitive'
 "Plug 'vim-scripts/FuzzyFinder'
 Plug 'godlygeek/tabular' 
 Plug 'bkad/CamelCaseMotion'

 " HASKELL
 "Plug 'eagletmt/ghcmod-vim'
 "Plug 'eagletmt/neco-ghc'
 "Plug 'Twinside/vim-haskellFold'
 "Plug 'parsonsmatt/intero-neovim'

 Plug 'Twinside/vim-syntax-haskell-cabal'
 Plug 'amunra81/vim-hdevtools'

 Plug 'airblade/vim-gitgutter'
 "Plug 'Twinside/vim-haskellConceal'
 "Plug 'lukerandall/haskellmode-vim'
 Plug 'tpope/vim-jdaddy'
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
 Plug 'w0rp/ale'

 Plug 'vim-scripts/taglist.vim'

 Plug 'bling/vim-airline'
 Plug 'ntpeters/vim-airline-colornum'
 Plug 'vim-airline/vim-airline-themes'

 Plug 'tpope/vim-classpath'
 Plug 'guns/vim-clojure-highlight'
 Plug 'guns/vim-clojure-static'
 Plug 'tpope/vim-fireplace'
 Plug 'tpope/vim-leiningen'
 Plug 'vim-scripts/vim-niji'
 Plug 'tpope/vim-surround'
 Plug 'dag/vim2hs'
 Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 Plug 'Shougo/vimshell.vim'
 Plug 'vim-scripts/bufexplorer.zip'
 Plug 'pbrisbin/vim-syntax-shakespeare'
 Plug 'diepm/vim-rest-console'
 Plug 'Twinside/vim-hoogle'
 Plug 'majutsushi/tagbar'
 "COLORS
 Plug 'zefei/cake16'
 Plug 'flazz/vim-colorschemes'
 Plug 'rakr/vim-one'
 Plug 'sjl/gundo.vim'
 Plug 'kien/ctrlp.vim'
 Plug 'tpope/vim-vinegar'
 Plug 'junegunn/vim-easy-align'
 Plug 'xolox/vim-misc'
 Plug 'xolox/vim-colorscheme-switcher'
 Plug 'tpope/vim-obsession'
call plug#end()

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
nnoremap   <Up>     <NOP>
nnoremap   <Down>   <NOP>
nnoremap   <Left>   <NOP>
nnoremap   <Right>  <NOP>
nnoremap    - <NOP>
nnoremap ,m :NERDTreeToggle<cr>
nnoremap ,n :NERDTreeFind<cr>
let g:NERDTreeWinSize=33

" DEFAULTS
syntax on
filetype plugin indent on


set nocompatible
set number
set nowrap
set showmode
set tw=90
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set mouse=a
set history=1000

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1
"mine
set relativenumber
set ruler

let g:ctrlp_root_markers = ['.ctrlp']

" -end-- DEFAULTS ---
"colorscheme predawn
"colorscheme apprentice
"colorscheme cabin
"colorscheme Monokai
"colorscheme molokai
"colorscheme tropikos
"colorscheme alduin
"colorscheme obsidian
colorscheme onedark

au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs
au BufRead,BufNewFile *.cljc set filetype=clojure
au VimEnter *.hs setlocal completefunc=CompleteHaddock

map <F2> :cd %:p:h<CR>
map ç :HLint<CR>
map <C-Tab> <C-w><C-w>
nnoremap <C-s> :w<cr>
nnoremap ß :w<cr>
map <C-F2> :!git add -A && git commit -am "C-F2" && git push origin master<CR>
map <C-F3> :!git add -A && git commit -am "C-F2"<CR>
set hlsearch
noremap ÷ :let @/ = ""<cr>

"supress - , ugly effect
nnoremap - <Nop>

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

"source $HOME/.vim/vimrc/custom/intero_vim.vim
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a: :Tabularize /:<CR>
vmap a- :Tabularize /-><CR>
vmap a< :Tabularize /<-<CR>

au Bufenter *.hs nnoremap <A-.> :HdevtoolsType<CR>
au Bufenter *.hs nnoremap <A-,> :HdevtoolsClear<CR>
au Bufenter *.hs nnoremap <A-'> :HdevtoolsInfo<CR>
au Bufenter *.hs nnoremap <A-z> :w<CR>:make<CR>
"au Bufenter *.hs setlocal completefunc=CompleteHaddock

let g:haskell_conceal              = 0
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

" CONFIGURATION for neco-ghc
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

" CONF ghc-mod
hi ghcmodType ctermbg=gray
let g:ghcmod_type_highlight = 'ghcmodType'
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

inoremap jk <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

"search
nnoremap <leader>/ /\c
nnoremap <leader>:/ :/\c

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

nnoremap <leader>o ha<CR><Esc>k$

nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a

nnoremap <space> i<space><esc>l
nnoremap <S-space> i<space><esc>l
nnoremap <tab> i<tab><esc>l

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0

let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:jsx_ext_required = 0
"
"vim-javascript
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=0

"Flow
let g:flow#autoclose = 1
let g:flow#enable = 0
let g:flow#omnifunc = 1
"let g:flow#showquickfix = 0

"Ale
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint','flow'],
\  'haskell': ['hdevtools','hlint']
\}
"\  'haskell': ['stack-ghc-mod','hdevtools','hlint']
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_flow_use_global = 1
let g:ale_set_highlights = 1
let g:ale_haskell_hdevtools_options = '-g-Wall -g-fno-warn-orphans -g-fno-warn-missing-signatures'
"let g:ale_haskell_hdevtools_options = ''
"let g:hdevtools_options = '-g-w -g-fdefer-type-errors'
let g:hdevtools_options = '-g-Wall -g-fno-warn-orphans -g-fno-warn-missing-signatures'

let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
"let g:ale_sign_error = '💉' " could use emoji
"let g:ale_sign_error = '💥' " could use emoji
"let g:ale_sign_error = '🔥' " could use emoji
"let g:ale_sign_error = '🔴' " could use emoji
"let g:ale_sign_error = '🚫' " could use emoji
if (has("nvimx"))
   "let g:ale_sign_error =  '✖'
   "let g:ale_sign_warning = '!'
else 
   "let g:ale_sign_error =  '❗'
   ""let g:ale_sign_warning = '❔'
   "let g:ale_sign_warning = '❕'
endif
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" scrollof 
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
set cursorline

"
"EASY ALIGN
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>en :cn<CR>
nnoremap <leader>ep :cp<CR>
"
"AG SEARCH
"
" use * to search current word in normal mode
nmap <leader>* <Plug>AgActionWord
" use * to search selected text in visual mode
vmap <leader>* <Plug>AgActionVisual

if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
   "set clipboard=unnamed
else
   let &t_SI = "\<Esc>]50;CursorShape=0\x7"
   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd InsertLeave * highlight CursorLine ctermfg=none
autocmd InsertEnter * highlight CursorLine ctermfg=208    

"let g:airline_theme='kalisi'
"let g:airline_theme='molokai'
let g:airline_theme='one'

if exists('$TMUX')
 "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
 "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
 "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
 "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) || has("nvim"))
 if (has("nvim"))
 "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 endif
 "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
 "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  "< https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
 if (has("termguicolors"))
   set termguicolors
 endif
endif

call camelcasemotion#CreateMotionMappings('<leader>')

map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,b <Plug>CamelCaseMotion_b
map <silent> ,e <Plug>CamelCaseMotion_e<Paste>
map <silent> ,ge <Plug>CamelCaseMotion_e<Paste>
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

augroup quickfix
   autocmd!
   autocmd FileType qf setlocal wrap
augroup END

augroup javascript
   au Bufenter *.js set colorcolumn=91
   au BufLeave *.js set colorcolumn=0
augroup END
augroup haskell
   au Bufenter *.hs set colorcolumn=91
   au Bufenter *.hs set fo+=t
   au Bufenter *.hs set tw=90
   au BufLeave *.hs set colorcolumn=0
   au BufLeave *.hs set fo-=t
   nnoremap <leader>ic 90i-<esc>a<CR><space>\|<space>
augroup END
