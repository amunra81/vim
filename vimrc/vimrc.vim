" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
set encoding=utf-8
set noswapfile

"set shellcmdflag=-ic
augroup Python
    let g:python_host_prog = '/Users/horus/.pyenv/shims/python'
    let g:python3_host_prog = '/Users/horus/.pyenv/shims/python3'
augroup END

set t_Co=256
let t_8f = "[38:2:%lu:%lu:%lum"
let t_8b = "[48:2:%lu:%lu:%lum"

call plug#begin('~/.vim/plugged')
 "Plug 'FredKSchott/CoVim'
 Plug 'ekalinin/Dockerfile.vim'
 "Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
 " TMUX
 "Plug 'christoomey/vim-tmux-navigator'
 " FSHARP
 Plug 'kongo2002/fsharp-vim'
 
 " CODE VALIDATION & COMPLETIONS ***********************************
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'w0rp/ale'
 Plug 'ervandew/supertab'
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'junegunn/fzf'

 if has('nvim')
  "Plug 'amunra81/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
 else
  Plug 'amunra81/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
 endif
 "Plug 'nathanaelkane/vim-indent-guides'
 "Plug 'Shougo/neosnippet'
 "Plug 'Shougo/neosnippet-snippets'
 "Plug 'Shougo/denite.nvim'
 ""****************************************************************

 " JAVASCRIPT *****************************************************
 Plug 'maxmellon/vim-jsx-pretty'

 Plug 'amunra81/vim-flow'
 Plug 'pangloss/vim-javascript'
 "Plug 'wokalski/autocomplete-flow'
 " ****************************************************************

 " TYPESCRIPT *****************************************************
 "Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
 Plug 'leafgarland/typescript-vim'
 " ****************************************************************

 " AG SHEARCH *****************************************************
 Plug 'rking/ag.vim'
 Plug 'Chun-Yang/vim-action-ag'
 " ****************************************************************

 " AG SHEARCH *****************************************************
 Plug 'eparreno/vim-l9'
 " ****************************************************************

 " CSV ************************************************************
 Plug 'chrisbra/csv.vim'
 " ****************************************************************

 " CSV ************************************************************
 Plug 'makerj/vim-pdf'
 " ****************************************************************

 " GIT & DIFF *****************************************************
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'sjl/gundo.vim'
 " ****************************************************************

 " TEXT MANIPULATION  *********************************************
 Plug 'scrooloose/nerdcommenter'
 Plug 'godlygeek/tabular'
 Plug 'junegunn/vim-easy-align'
 Plug 'bkad/CamelCaseMotion'
 Plug 'Raimondi/delimitMate'  " it's adding closing quotes,
                              " parens, brackets
 " ****************************************************************

 " NAVIGATION *****************************************************
 Plug 'scrooloose/nerdtree'
 Plug 'kien/ctrlp.vim'
 Plug 'vim-scripts/taglist.vim'
 " ****************************************************************

 " AIRLINE ********************************************************
 Plug 'bling/vim-airline'
 Plug 'ntpeters/vim-airline-colornum'
 Plug 'vim-airline/vim-airline-themes'
 " ****************************************************************

 " CLOJURE ********************************************************
 Plug 'vim-scripts/paredit.vim'
 Plug 'tpope/vim-classpath'
 Plug 'guns/vim-clojure-highlight'
 Plug 'guns/vim-clojure-static'
 Plug 'tpope/vim-fireplace'
 Plug 'tpope/vim-leiningen'
 Plug 'vim-scripts/vim-niji'
 Plug 'tpope/vim-surround'
 "*****************************************************************

 " HASKELL ********************************************************
 Plug 'Twinside/vim-syntax-haskell-cabal'
 Plug 'amunra81/vim-hdevtools'
 Plug 'neovimhaskell/haskell-vim'
 Plug 'itchyny/vim-haskell-indent'
 Plug 'Twinside/vim-hoogle'
 "Plug 'pbrisbin/vim-syntax-shakespeare'
 "*****************************************************************
 " CSHARP *********************************************************
 Plug 'OmniSharp/omnisharp-vim'
 "*****************************************************************

 " JSON ***********************************************************
 Plug 'diepm/vim-rest-console'
 Plug 'tpope/vim-jdaddy'
 "*****************************************************************

 " COLORS ********************************************************
 Plug 'skielbasa/vim-material-monokai'
 Plug 'zefei/cake16'
 Plug 'flazz/vim-colorschemes'
 Plug 'joshdick/onedark.vim'
 Plug 'xolox/vim-misc'
 Plug 'xolox/vim-colorscheme-switcher'
 "**************************************************************

call plug#end()

" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 0
let g:OmniSharp_typeLookupInPreview = 1

let g:fsharp_xbuild_path = "/Library/Frameworks/Mono.framework/Versions/Current/Commands/msbuild"


let g:SuperTabDefaultCompletionType = "<c-n>"

nnoremap <leader>] :call LanguageClient#textDocument_definition()<CR>
"\ 'javascript': ['flow-language-server', '--stdio'],
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml','package.json']
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['flow', 'lsp'],
    \ }
"\ 'typescript': ['node','/Users/horus/.nvm/versions/node/v10.13.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio'],
"\ 'typescript.tsx': ['node','/Users/horus/.nvm/versions/node/v10.13.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio'],
"\ 'typescript.ts': ['node','/Users/horus/.nvm/versions/node/v10.13.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio'],
"\ 'fsharp': ['dotnet', '/Users/horus/.nvm/versions/node/v10.13.0/lib/node_modules/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp2.0/FSharpLanguageServer.dll'],
"call LanguageClient#setDiagnosticsList('Disabled')
let g:LanguageClient_diagnosticsEnable=0

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
"\"signText": "❗",
"\"signText": "❕",
"let g:LanguageClient_diagnosticsSignsMax=4
let g:LanguageClient_diagnosticsDisplay= {
            \1: {
            \"name": "Error",
            \"texthl": "ALEError",
            \"signText": "•",
            \"signTexthl": "ALEErrorSign",
            \},
            \2: {
            \"name": "Warning",
            \"texthl": "ALEWarning",
            \"signText": "❕",
            \"signTexthl": "ALEWarningSign",
            \},
            \3: {
            \"name": "Information",
            \"texthl": "ALEInfo",
            \"signText": "ℹ",
            \ "signTexthl": "ALEInfoSign",
            \},
            \4: {
            \ "name": "Hint",
            \ "texthl": "ALEInfo",
            \ "signText": "➤",
            \ "signTexthl": "ALEInfoSign",
            \},
            \}


let g:LanguageClient_hoverPreview = 'Never'
" Pass a dictionary to set multiple options
call deoplete#custom#option({
\ 'auto_complete_delay': 10,
\ 'smart_case': v:true,
\ })

" deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" neosnippet

"let g:neosnippet#enable_completed_snippet = 1

"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
nnoremap   <Up>     <NOP>
nnoremap   <Down>   <NOP>
nnoremap   <Left>   <NOP>
nnoremap   <Right>  <NOP>
nnoremap   - <NOP>
nnoremap ,m :NERDTreeToggle<cr>
nnoremap ,n :NERDTreeFind<cr>
let g:NERDTreeWinSize=33

" DEFAULTS
syntax on
filetype plugin indent on


set backspace=indent,eol,start
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

"set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
"set completeopt+=longest

set t_Co=256

set cmdheight=1
"mine
"set relativenumber
set ruler


" -end-- DEFAULTS ---
"colorscheme apprentice
"colorscheme cabin
"colorscheme Monokai
"colorscheme molokai
"colorscheme tropikos
"colorscheme alduin
"colorscheme obsidian

let g:onedark_termcolors=256

"colorscheme oxeded
"colorscheme phoenix
"colorscheme py-darcula
"colorscheme alduid

"colorscheme Revolution
"colorscheme rootwater
"colorscheme sandydune
"colorscheme seti
"colorscheme sexy-railcasts
"colorscheme sky
"colorscheme space-vim-dark
"colorscheme predawn
"colorscheme spacemacs-theme

colorscheme onedark
"colorscheme dracula
"colorscheme deep-space


"let g:airline_theme='molokai'
"let g:airline_theme='zenburn'
"let g:airline_theme='lucius'
"let g:airline_theme='onedark'
let g:airline_theme='base16_embers'
"let g:airline_theme='base16_twilight'

"colorscheme alduin
"let g:airline_theme='kalisi'

"au BufRead,BufNewFile *.fs set filetype=fs
"au BufRead,BufNewFile *.fsx set filetype=fs

au BufRead,BufNewFile *.cljc set filetype=clojure
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.tsx set filetype=typescript
au BufRead,BufNewFile *.js.flow set filetype=javascript

"au VimEnter *.hs setlocal completefunc=CompleteHaddock
"au VimEnter *.js call deoplete#custom#option('auto_complete', v:false)
"au VimLeave *.js call deoplete#custom#option('auto_complete', v:true)

autocmd FileType javascript setlocal omnifunc=echo
command JSONFormat :%!python -m json.tool


map <F2> :cd %:p:h<CR>
map ç :HLint<CR>
map <C-Tab> <C-w><C-w>
nnoremap <C-s> :w<cr>
nnoremap S <NOP>
nnoremap SS :w<cr>

nnoremap ß :w<cr>
map <C-F2> :!git add -A && git commit -am "C-F2" && git push origin master<CR>
map <C-F3> :!git add -A && git commit -am "C-F2"<CR>
set hlsearch
noremap ÷ :let @/ = ""<cr>

"supress - , ugly effect



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

"let g:haskell_conceal              = 0
"let g:necoghc_enable_detailed_browse = 1
"let g:necoghc_use_stack = 1

" CONFIGURATION for neco-ghc
" Disable haskell-vim omnifunc
"let g:haskellmode_completion_ghc = 0
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"let g:ycm_semantic_triggers = {'haskell' : ['.']}
"let g:necoghc_enable_detailed_browse = 1

" CONF ghc-mod
"hi ghcmodType ctermbg=gray
"let g:ghcmod_type_highlight = 'ghcmodType'
" -----------------
"   -- C/C++ --
" -----------------
"au Bufenter *.c map <A-z> \rc
" ----------------------
"   -- MOVING LINES --
" ----------------------
"au Bufenter *.cpp map <A-z> \rc
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
nnoremap `/ /\c
nnoremap `1 /\c
nnoremap <leader>/ /\c
nnoremap <leader>:/ /\c
nnoremap `;/ :/\c
nnoremap `;1 :/\c

nnoremap `j <C-w>j
nnoremap `k <C-w>k
nnoremap `h <C-w>h
nnoremap `l <C-w>l
nnoremap `` <C-w>w
nnoremap `- <C-w>_
nnoremap `= <C-w>=


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

nnoremap ZA :suspend<CR>
nnoremap ZQ :q<CR>
nnoremap ZS :mks! ~/.local/.vim-sessions/rooster.vim<CR>
nnoremap ZX :source ~/.local/.vim-sessions/rooster.vim<CR>

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
\  'haskell': ['hdevtools','hlint'],
\  'cs': ['OmniSharp'],
\  'javascript': ['eslint','flow'],
\  'typescript': [ 'tslint', 'tsserver'],
\}
let g:ale_fixers = {
\  'typescript': ['tslint'],
\  'javascript': ['eslint'],
\  'haskell': ['hlint','stylish-haskell'],
\}
"\  'haskell': ['hie','hlint'],
"\  'haskell': ['hdevtools','hlint'],
"
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_flow_use_global = 1
let g:ale_set_highlights = 1

let g:my_ale_hdevtools_normal       = '-g-Wall -g-fno-warn-orphans -g-fno-warn-missing-signatures'
let g:my_ale_hdevtools_defer_errors = '-g-Wall -g-fno-warn-orphans -g-fno-warn-missing-signatures -g-fdefer-type-errors'

let g:my_hdevtools_normal           = ''
let g:my_hdevtools_defer_errors     = '-g-fdefer-type-errors'

let g:ale_haskell_hdevtools_options = g:my_ale_hdevtools_normal
let g:hdevtools_options             = g:my_hdevtools_normal
let g:hdevtools_stack = 1

let g:haskell_defer_errors = 0
function ToggleHdevtoolsDefferErrors()
    if (g:haskell_defer_errors)
        let g:ale_haskell_hdevtools_options = g:my_ale_hdevtools_normal
        let g:hdevtools_options             = g:my_hdevtools_normal
        let g:haskell_defer_errors          = 0
        echo "Hdevtools set to not defer type errors"
    else
        let g:ale_haskell_hdevtools_options = g:my_ale_hdevtools_defer_errors
        let g:hdevtools_options             = g:my_hdevtools_defer_errors
        let g:haskell_defer_errors          = 1
        echo "Hdevtools set to defer type errors"
    endif 
endfunction

function EchoAle()
        echo g:ale_haskell_hdevtools_options 
endfunction
function EchoHdev()
        echo g:hdevtools_options             
endfunction


nnoremap <Leader>de :call ToggleHdevtoolsDefferErrors()<CR>

let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
"let g:ale_sign_error = '💉' " could use emoji
"let g:ale_sign_error = '💥' " could use emoji
"let g:ale_sign_error = '🔥' " could use emoji
"let g:ale_sign_error = '🔴' " could use emoji
"let g:ale_sign_error = '🚫' " could use emoji
"if (has("nvimx"))
   "let g:ale_sign_error =  '✖'
   "let g:ale_sign_warning = '!'
"else
   "let g:ale_sign_error =  '❗'
   """let g:ale_sign_warning = '❔'
   "let g:ale_sign_warning = '❕'
    "let g:ale_sign_error = '✖'
    "let g:ale_sign_warning = '✖'
    "hi link ALEErrorSign    Error
    "hi link ALEWarningSign  Warning
    let g:ale_sign_error = "◉"
    let g:ale_sign_warning = "◉"
    highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#d7424d
    "guifg=#C30500
    "highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#F1CE01
    highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#FFAF00
    "guifg=#D19A66 
"endif
let g:gitgutter_enabled = 0
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
"let g:airline_theme='one'

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
"if (empty($TMUX) || has("nvim"))
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
"endif

"augroup vim_debugger
 "if has('nvim')
    "set verbose=14
    "set verbosefile=~/vim.log
 "endif
"augroup END

augroup haskell
    let g:haskell_indent_disable = 1
augroup END
augroup ctrlp
    let g:ctrlp_root_markers = ['.ctrlp']
    nnoremap <c-b> :CtrlPBuffer<CR>
augroup END

augroup camelcase
    call camelcasemotion#CreateMotionMappings('<leader>')

    map <silent> ,w <Plug>CamelCaseMotion_w
    map <silent> ,b <Plug>CamelCaseMotion_b
    map <silent> ,e <Plug>CamelCaseMotion_e
    map <silent> ,ge <Plug>CamelCaseMotion_ge
augroup END


augroup quickfix
   autocmd!
   autocmd FileType qf setlocal wrap
augroup END

augroup javascript
   au Bufenter *.js set colorcolumn=91
   au BufLeave *.js set colorcolumn=0
augroup END
augroup haskell
    function ClearHaskell()
        execute 'LanguageClientStop'
        execute 'ALEDisable'
        execute 'ALEStopAllLSPs'

        sleep 2000m
        execute 'LanguageClientStart'
        sleep 1000m
        execute 'ALEEnable'
    endfunction
    "function HaskellLeave()
        "let g:LanguageClient_diagnosticsEnable=0
    "endfunction

   "au VimEnter *.hs call HaskellEnter()
   "au VimLeave *.hs call HaskellLeave()

   au Bufenter *.hs set colorcolumn=91
   au Bufenter *.hs set fo+=t
   au Bufenter *.hs set tw=80
   au BufLeave *.hs set colorcolumn=0
   au BufLeave *.hs set fo-=t
   nnoremap <leader>ic 90i-<esc>a<CR><space>\|<space>
   nnoremap <leader>it i//<esc>88a-<esc>a<CR><CR><esc>88a-<esc>ka<space>
   ""//<space><esc>a<CR>//<esc>88i-<esc>
augroup END
"augroup window_movment
    "nnoremap <C-h> <C-w>h
    "nnoremap <C-j> <C-w>j
    "nnoremap <C-k> <C-w>k
    "nnoremap <C-l> <C-w>l
"augroup END
augroup coc
    "" TextEdit might fail if hidden is not set.
    "set hidden

    "" Some servers have issues with backup files, see #649.
    "set nobackup
    "set nowritebackup

    "" Give more space for displaying messages.
    "set cmdheight=2

    "" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    "" delays and poor user experience.
    "set updatetime=300

    "" Don't pass messages to |ins-completion-menu|.
    "set shortmess+=c

    "" Always show the signcolumn, otherwise it would shift the text each time
    "" diagnostics appear/become resolved.
    "set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    "inoremap <silent><expr> <TAB>
          "\ pumvisible() ? "\<C-n>" :
          "\ <SID>check_back_space() ? "\<TAB>" :
          "\ coc#refresh()
    "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    "function! s:check_back_space() abort
      "let col = col('.') - 1
      "return !col || getline('.')[col - 1]  =~# '\s'
    "endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    "nmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    "" Mappings using CoCList:
    "" Show all diagnostics.
    "nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    "" Manage extensions.
    "nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    "" Show commands.
    "nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    "" Find symbol of current document.
    "nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    "" Search workspace symbols.
    "nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    "" Do default action for next item.
    "nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    "" Do default action for previous item.
    "nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    "" Resume latest coc list.
    "nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
augroup END
