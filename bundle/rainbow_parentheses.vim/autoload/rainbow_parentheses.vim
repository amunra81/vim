"==============================================================================
"  Description: Rainbow colors for parentheses, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"               2011-10-12: Use less code.  Leave room for deeper levels.
"==============================================================================

let s:pairs = [
	\ ['brown',       'orange1'],
	\ ['cyan',        'yellow1'],
	\ ['darkgray',    'greenyellow'],
	\ ['darkgreen',   'green1'],
	\ ['darkcyan',    'springgreen1'],
	\ ['darkred',     'cyan1'],
	\ ['darkmagenta', 'slateblue1'],
	\ ['brown',       'springgreen1'],
	\ ['gray',        'cyan1'],
	\ ['black',       'green1'],
	\ ['darkmagenta', 'orangered3'],
	\ ['cyan',        'yellow3'],
	\ ['darkgreen',   'greenyellow'],
	\ ['darkcyan',    'orange1'],
	\ ['darkred',     'cyan1'],
	\ ['red',         'yellow1'],
	\ ]
	"				\ '1': 'ctermfg=yellow      guifg=orange1',
	"				\ '2': 'ctermfg=green       guifg=yellow1',
	"				\ '3': 'ctermfg=cyan        guifg=greenyellow',
	"				\ '4': 'ctermfg=magenta     guifg=green1',
	"				\ '5': 'ctermfg=red         guifg=springgreen1',
	"				\ '6': 'ctermfg=yellow      guifg=cyan1',
	"				\ '7': 'ctermfg=green       guifg=slateblue1',
	"				\ '8': 'ctermfg=cyan        guifg=magenta1',
	"				\ '9': 'ctermfg=magenta     guifg=purple1'
	"				\ }
" 					\ '1': 'ctermfg=darkyellow  guifg=orangered3',
"					\ '2': 'ctermfg=darkgreen   guifg=orange2',
"					\ '3': 'ctermfg=blue        guifg=yellow3',
"					\ '4': 'ctermfg=darkmagenta guifg=olivedrab4',
"					\ '5': 'ctermfg=red         guifg=green4',
"					\ '6': 'ctermfg=darkyellow  guifg=paleturquoise3',
"					\ '7': 'ctermfg=darkgreen   guifg=deepskyblue4',
"					\ '8': 'ctermfg=blue        guifg=darkslateblue',
"					\ '9': 'ctermfg=darkmagenta guifg=darkviolet'
					\ }
let s:pairs = exists('g:rbpt_colorpairs') ? g:rbpt_colorpairs : s:pairs
let s:max = exists('g:rbpt_max') ? g:rbpt_max : max([len(s:pairs), 16])
let s:loadtgl = exists('g:rbpt_loadcmd_toggle') ? g:rbpt_loadcmd_toggle : 0
let s:types = [['(',')'],['\[','\]'],['{','}'],['<','>']]

func! s:extend()
	if s:max > len(s:pairs)
		cal extend(s:pairs, s:pairs)
		cal s:extend()
	elseif s:max < len(s:pairs)
		cal remove(s:pairs, s:max, -1)
	endif
endfunc
cal s:extend()

func! rainbow_parentheses#activate()
	let [id, s:active] = [1, 1]
	for [ctermfg, guifg] in s:pairs
		exe 'hi default level'.id.'c ctermfg='.ctermfg.' guifg='.guifg
		let id += 1
	endfor
endfunc

func! rainbow_parentheses#clear()
	for each in range(1, s:max)
		exe 'hi clear level'.each.'c'
	endfor
	let s:active = 0
endfunc

func! rainbow_parentheses#toggle()
	if !exists('s:active')
		cal rainbow_parentheses#load(0)
	endif
	let afunc = exists('s:active') && s:active ? 'clear' : 'activate'
	cal call('rainbow_parentheses#'.afunc, [])
endfunc

func! rainbow_parentheses#toggleall()
	if !exists('s:active')
		cal rainbow_parentheses#load(0)
		cal rainbow_parentheses#load(1)
		cal rainbow_parentheses#load(2)
	endif
	if exists('s:active') && s:active
		cal rainbow_parentheses#clear()
	else
		cal rainbow_parentheses#activate()
	endif
endfunc

func! s:cluster()
	let levels = join(map(range(1, s:max), '"level".v:val'), ',')
	exe 'sy cluster rainbow_parentheses contains=@TOP'.levels.',NoInParens'
endfunc
cal s:cluster()

func! rainbow_parentheses#load(...)
	let [level, grp, type] = ['', '', s:types[a:1]]
	let alllvls = map(range(1, s:max), '"level".v:val')
	if !exists('b:loaded')
		let b:loaded = [0,0,0,0]
	endif
	let b:loaded[a:1] = s:loadtgl && b:loaded[a:1] ? 0 : 1
	for each in range(1, s:max)
		let region = 'level'. each .(b:loaded[a:1] ? '' : 'none')
		let grp = b:loaded[a:1] ? 'level'.each.'c' : 'Normal'
		let cmd = 'sy region %s matchgroup=%s start=/%s/ end=/%s/ contains=TOP,%s,NoInParens'
		exe printf(cmd, region, grp, type[0], type[1], join(alllvls, ','))
		cal remove(alllvls, 0)
	endfor
endfunc

" vim:ts=2:sw=2:sts=2
