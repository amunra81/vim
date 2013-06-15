"=============================================================================
" What Is This: Add some conceal operator for your haskell files
" File:         haskell.vim (conceal enhancement)
" Author:       Vincent Berthoux <twinside@gmail.com>
" Last Change:  2010 oct. 16
" Version:      1.1
" Require:
"   set nocompatible
"     somewhere on your .vimrc
"
"   Vim 7.3 or Vim compiled with conceal patch
"
" Usage:
"   Drop this file in your
"       ~/.vim/after/syntax folder (Linux/MacOSX/BSD...)
"       ~/vimfiles/after/syntax folder (Windows)
"
"   For this script to work, you have to set the encoding
"   to utf-8 :set enc=utf-8
"
" Additional:
"     * if you want to avoid the loading, add the following
"       line in your .vimrc :
"        let g:no_haskell_conceal = 1
"  Changelog:
"   - 1.2: Fixing conceal level to be local (thx Erlend Hamberg)
"   - 1.1: Better handling of non utf-8 systems, and avoid some
"           concealing operations on windows on some fonts
"
if exists('g:no_haskell_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

" vim: set fenc=utf-8:
syntax match hsNiceOperator "\\" conceal cchar=λ
syntax match hsNiceOperator "<-" conceal cchar=←
syntax match hsNiceOperator "->" conceal cchar=→
syntax match hsNiceOperator "\<sum\>" conceal cchar=∑
syntax match hsNiceOperator "\<product\>" conceal cchar=∏ 
syntax match hsNiceOperator "\<sqrt\>" conceal cchar=√ 
syntax match hsNiceOperator "\<pi\>" conceal cchar=π
syntax match hsNiceOperator "==" conceal cchar=≡
syntax match hsNiceOperator "\/=" conceal cchar=≠
syntax match hsNiceOperator ">>" conceal cchar=»
syntax match hsNiceOperator ">>>" conceal cchar=⇶

sy match hs_DeclareFunction /^[a-z_(]\S*\(\s\|\n\)*::/me=e-2 contains=hs_FunctionName,hs_OpFunctionName

let s:extraConceal = 1
" Some windows font don't support some of the characters,
" so if they are the main font, we don't load them :)
if has("win32")
    let s:incompleteFont = [ 'Consolas'
                        \ , 'Lucida Console'
                        \ , 'Courier New'
                        \ ]
    let s:mainfont = substitute( &guifont, '^\([^:,]\+\).*', '\1', '')
    for s:fontName in s:incompleteFont
        if s:mainfont ==? s:fontName
            let s:extraConceal = 0
            break
        endif
    endfor
endif

if s:extraConceal
    syntax match hsNiceOperator "<=" conceal cchar=≲
    syntax match hsNiceOperator ">=" conceal cchar=≳
    syntax match hsNiceOperator "=>" conceal cchar=⇒
    syntax match hsNiceOperator "\:\:" conceal cchar=∷
    syntax match hsniceoperator "++" conceal cchar=⧺
    syntax match hsNiceOperator "\<forall\>" conceal cchar=∀
        
    " Only replace the dot, avoid taking spaces around.
    syntax match hsNiceOperator /\s\.\s/ms=s+1,me=e-1 conceal cchar=∘
    " syntax match hsNiceOperator "\.\." conceal cchar=‥
endif



hi link hsNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
setlocal concealcursor=vinc

" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @hamlet syntax/hamlet.vim
unlet b:current_syntax

syn include @cassius syntax/cassius.vim
unlet b:current_syntax

syn include @lucius syntax/lucius.vim
unlet b:current_syntax

syn include @julius syntax/julius.vim
unlet b:current_syntax


syn region hmBlock   matchgroup=quasiQuote start=/\[\$\?[iws]\?hamlet|/ end=/|\]/ contains=@hamlet
syn region hmBlock   matchgroup=quasiQuote start=/\[\$\?xs\?hamlet|/    end=/|\]/ contains=@hamlet
syn region csBlock   matchgroup=quasiQuote start=/\[\$\?cassius|/       end=/|\]/ contains=@cassius
syn region lcBlock   matchgroup=quasiQuote start=/\[\$\?lucius|/        end=/|\]/ contains=@lucius
syn region jsBlock   matchgroup=quasiQuote start=/\[\$\?julius|/        end=/|\]/ contains=@julius

" simple text
syn region txtBlock  matchgroup=quasiQuote start=/\[\$\?[sl]t|/ end=/|\]/ contains=txtInterp
syn region txtInterp matchgroup=txtInterpDelim start="#{"  end="}" contains=txtOp,txtString,txtNum

syn match txtOp      contained /\(\$\|\.\)/
syn match txtString  contained /"[^"]*"/
syn match txtNum     contained /\<[0-9]*\>/

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink quasiQuote     Boolean
HiLink txtBlock       String
HiLink txtInterp      Normal
HiLink txtInterpDelim Delimiter
HiLink txtOp          Operator
HiLink txtString      String
HiLink txtNum         Number

delcommand HiLink

" restore current syntax value
let b:current_syntax = old_syntax
