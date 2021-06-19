" Vim Color File
" Name:         plastic.vim
" Description:  VSCode Plastic theme vim/neovim port
" Author:       Florian Rand
" Repository:   https://github.com/flrnd/plastic.vim/
" License:      The MIT License (MIT)

" Init {{{
scriptencoding utf-8

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'plastic'

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" .  a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" .  a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
endif
endfun
"}}}

" colors definition {{{

let s:red = {'gui': '#e06c75', 'cterm256': '204'}
let s:green = { 'gui': '#98c379', 'cterm256': '114'}
let s:yellow = { 'gui': '#e5c07b', 'cterm256': '180'}
let s:whisky = { 'gui': '#d19a66', 'cterm256': '173' }
let s:blue = { 'gui': '#61afef', 'cterm256': '39'}
let s:purple = { 'gui': '#af98e6', 'cterm256': '170'}
let s:aqua = { 'gui': '#56b6c2', 'cterm256': '38'}
let s:white = { 'gui': '#d7d7d7', 'cterm256': '145'}
let s:black = { 'gui': '#181a1f', 'cterm256': '234'}
let s:visual_black = { 'gui': 'NONE', 'cterm256': 'NONE'}
let s:background = {'gui': '#21252b', 'cterm256': '235'}
let s:foreground = {'gui': '#a9b2c3', 'cterm256': '235'}
let s:grey = { 'gui': '#abb2bf', 'cterm256': '59' }
let s:punctuation = { 'gui': '#7c8696', 'cterm256': '238' }
let s:none = {'gui': 'NONE', 'cterm256': 'NONE'}

" }}}

"--------------------
" Syntax Definitions
"--------------------
" <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:white, s:background, 'none', {})

" UI {{{
call <sid>hi('Cursor', s:none, s:none, 'inverse', {})
hi link lCursor Cursor
hi link CursorIM Cursor
call <sid>hi('CursorLine', s:white, s:none, 'bold', {})
call <sid>hi('EndOfBuffer', s:whisky, s:none, 'none', {})
call <sid>hi('Conceal', s:blue, s:none, 'none', {})
call <sid>hi('CursorColumn', s:none, s:blue, 'none', {})
call <sid>hi('ColorColumn', s:none, s:punctuation, 'none', {})
call <sid>hi('FoldColumn', s:punctuation, s:background, 'none', {})
call <sid>hi('SignColumn', s:none, s:background, 'none', {})
call <sid>hi('VertSplit', s:grey, s:background, 'none', {})
call <sid>hi('LineNr', s:punctuation, s:background, 'none', {})
call <sid>hi('CursorLineNr', s:punctuation, s:background, 'none', {})

call <sid>hi('DiffAdd', s:black, s:green, 'none', {})
call <sid>hi('DiffChange', s:black, s:purple, 'none', {})
call <sid>hi('DiffDelete', s:black, s:red, 'none', {})
call <sid>hi('DiffText', s:black, s:aqua, 'none', {})

call <sid>hi('ErrorMsg', s:red, s:background, 'bold', {})
call <sid>hi('ModeMsg', s:yellow, s:none, 'bold', {})
call <sid>hi('MoreMsg', s:aqua, s:none, 'bold', {})
call <sid>hi('WarningMsg', s:whisky, s:none, 'italic', {})
call <sid>hi('Noise', s:punctuation, s:none, 'none', {})
call <sid>hi('NonText', s:whisky, s:none, 'none', {})
call <sid>hi('Folded', s:grey, s:none, 'none', {})
call <sid>hi('IncSearch', s:yellow, s:black, 'none', {})
call <sid>hi('Search', s:yellow, s:background, 'reverse', {})

call <sid>hi('Pmenu', s:none, s:black, 'none', {})
call <sid>hi('PmenuSel', s:black, s:white, 'none', {})

call <sid>hi('Question', s:white, s:background, 'bold', {})
call <sid>hi('MatchParen', s:blue, s:none, 'bold', {})
call <sid>hi('Directory', s:white, s:background, 'bold', {})
call <sid>hi('QuickFixLine', s:black, s:yellow, 'none', {})

call <sid>hi('SpecialKey', s:purple, s:none, 'none', {})
call <sid>hi('SpellBad', s:red, s:none, 'undercurl', s:red)
call <sid>hi('SpellCap', s:none, s:none, 'undercurl', {})
call <sid>hi('SpellLocal', s:none, s:none, 'undercurl', {})
call <sid>hi('SpellRare', s:none, s:none, 'undercurl', {})

call <sid>hi('StatusLine', s:white, s:background, 'none', {})
call <sid>hi('StatusLineNC', s:white, s:background, 'none', {})
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC

call <sid>hi('TabLine', s:white, s:black, 'none', {})
hi link TabLineFill TabLine
call <sid>hi('TabLineSel', s:whisky, s:black, 'none', {})

call <sid>hi('Title', s:white, s:none, 'none', {})
call <sid>hi('Visual', s:black, s:white, 'none', {})
hi link VisualNOS Visual
call <sid>hi('TabLine', s:white, s:black, 'none', {})
call <sid>hi('WildMenu', s:black, s:white, 'bold', {})
"}}}

"----------------------------------------------------
" Syntax groups and naming convenions
" http://vimdoc.sourceforge.net/htmldoc/syntax.html
"----------------------------------------------------
" {{{
call <sid>hi('Comment', s:grey, s:none, 'italic', {})

call <sid>hi('Constant', s:aqua, s:none, 'none', {})
call <sid>hi('String', s:green, s:none, 'none', {})
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number

call <sid>hi('Identifier', s:white, s:none, 'none', {})
call <sid>hi('Function', s:whisky, s:none, 'none', {})

call <sid>hi('Statement', s:whisky, s:none, 'none', {})
hi link Conditional Statement

call <sid>hi('PreProc', s:aqua, s:none, 'none', {})

call <sid>hi('Type', s:blue, s:none, 'none', {})

call <sid>hi('Special', s:aqua, s:none, 'none', {})

call <sid>hi('Underlined', s:blue, s:none, 'underline', {})

call <sid>hi('Ignore', s:none, s:none, 'none', {})

call <sid>hi('Error', s:red, s:black, 'undercurl', {})

call <sid>hi('Todo', s:aqua, s:none, 'italic', {})

"}}}

"--------------------------
" Language specific syntax
"--------------------------

" HTML {{{
call <sid>hi('htmlTag', s:punctuation, s:none, 'none', {})
hi link htmlEndTag htmlTag
call <sid>hi('htmlTagName', s:blue, s:none, 'none', {})
call <sid>hi('htmlArg', s:whisky, s:none, 'none', {})
call <sid>hi('htmlTitle', s:white, s:none, 'none', {})
"}}}

" XML {{{
call <sid>hi('xmlRegion', s:white, s:none, 'none', {})
hi link xmlTag xmlRegion
call <sid>hi('xmlTagName', s:yellow, s:none, 'none', {})
call <sid>hi('xmlEndTag', s:punctuation, s:none, 'none', {})
" }}}

" Css {{{
call <sid>hi('cssAttrComma', s:punctuation, s:none, 'none', {})
call <sid>hi('cssAttributeSelector', s:green, s:none, 'none', {})
call <sid>hi('cssBraces', s:punctuation, s:none, 'none', {})
call <sid>hi('cssClassName', s:aqua, s:none, 'none', {})
call <sid>hi('cssDefinition', s:purple, s:none, 'none', {})
call <sid>hi('cssFontAttr', s:whisky, s:none, 'none', {})
call <sid>hi('cssFontDescriptor', s:purple, s:none, 'none', {})
call <sid>hi('cssFunctionName', s:blue, s:none, 'none', {})
call <sid>hi('cssIdentifier', s:blue, s:none, 'none', {})
call <sid>hi('cssImportant', s:purple, s:none, 'none', {})
call <sid>hi('cssInclude', s:white, s:none, 'none', {})
call <sid>hi('cssIncludeKeyword', s:red, s:none, 'none', {})
call <sid>hi('cssMediaType', s:aqua, s:none, 'none', {})
call <sid>hi('cssProp', s:white, s:none, 'none', {})
call <sid>hi('cssPseudoClassId', s:whisky, s:none, 'none', {})
call <sid>hi('cssTagName', s:whisky, s:none, 'none', {})
call <sid>hi('cssSelectorOp', s:purple, s:none, 'none', {})
call <sid>hi('cssSelectorOp2', s:purple, s:none, 'none', {})
"}}}

" Javascript {{{
call <sid>hi('jsImport', s:red, s:none, 'none', {})
hi link jsExport jsImport
hi link jsFrom jsImport
hi link jsExportDefault jsExport
hi link jsArrowFunction jsImport
call <sid>hi('jsStorageClass', s:blue, s:none, 'none', {})
call <sid>hi('jsClassKeyword', s:blue, s:none, 'none', {})
call <sid>hi('jsExtendsKeyword', s:blue, s:none, 'none', {})
call <sid>hi('jsThis', s:yellow, s:none, 'none', {})
"}}}

" JSX {{{
" https://github.com/MaxMEllon/vim-jsx-pretty
call <sid>hi('jsxTagName', s:yellow, s:none, 'none', {})
call <sid>hi('jsxPunct', s:punctuation, s:none, 'none', {})
call <sid>hi('jsClosePunct', s:punctuation, s:none, 'none', {})
call <sid>hi('jsxAttrib', s:whisky, s:none, 'none', {})
call <sid>hi('jsxComponentName', s:blue, s:none, 'none', {})
hi link jsxCloseString jsClosePunct
hi link jsxBraces jsxPunct
"}}}

" Golang {{{
call <sid>hi('goDirective', s:aqua, s:none, 'none', {})
call <sid>hi('goConstants', s:white, s:none, 'none', {})
call <sid>hi('goDeclaration', s:red, s:none, 'none', {})
call <sid>hi('goDeclType', s:whisky, s:none, 'none', {})
call <sid>hi('goBuiltins', s:whisky, s:none, 'none', {})
call <sid>hi('goFunctionCall', s:whisky, s:none, 'none', {})
call <sid>hi('goVarAssign', s:white, s:none, 'none', {})
hi link goVarDefs goVarAssign
"}}}

" Markdown {{{
call <sid>hi('markdownCode', s:green, s:none, 'none', {})
hi link markdownCodeBlock markdownCode
hi link markdownCodeDelimiter markdownCode
call <sid>hi('markdownHeadingDelimiter', s:whisky, s:none, 'none', {})
call <sid>hi('markdownRule', s:punctuation, s:none, 'none', {})
call <sid>hi('markdownHeadingRule', s:punctuation, s:none, 'none', {})
call <sid>hi('markdownH1', s:whisky, s:none, 'none', {})
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
call <sid>hi('markdownIdDelimiter', s:purple, s:none, 'none', {})
call <sid>hi('markdownId', s:purple, s:none, 'none', {})
call <sid>hi('markdownBlockquote', s:aqua, s:none, 'none', {})
call <sid>hi('markdowItalic', s:none, s:none, 'italic', {})
call <sid>hi('markdownBold', s:none, s:none, 'bold', {})
call <sid>hi('markdownListMarker', s:blue, s:none, 'none', {})
call <sid>hi('markdownOrderedListMarker', s:blue, s:none, 'none', {})
call <sid>hi('markdownIdDeclaration', s:blue, s:none, 'none', {})
call <sid>hi('markdownLinkText', s:blue, s:none, 'none', {})
call <sid>hi('markdownLinkDelimiter', s:white, s:none, 'none', {})
call <sid>hi('markdownUrl', s:purple, s:none, 'none', {})

"}}}

" NERDTree {{{
call <sid>hi('NERDTreeDir', s:blue, s:none, 'none', {})
call <sid>hi('NERDTreeDirSlash', s:whisky, s:none, 'none', {})
call <sid>hi('NERDTreeFile', s:aqua, s:none, 'none', {})
call <sid>hi('NERDTreeExecFile', s:green, s:none, 'none', {})
call <sid>hi('NERDTreeOpenable', s:whisky, s:none, 'none', {})
call <sid>hi('NERDTreeClosable', s:red, s:none, 'none', {})
call <sid>hi('NERDTreeCWD', s:blue, s:none, 'bold', {})
call <sid>hi('NERDTreeUp', s:punctuation, s:none, 'none', {})
" }}}

" Typescript {{{
call <sid>hi('typescriptImport', s:red, s:none, 'none', {})
call <sid>hi('typescriptBraces', s:punctuation, s:none, 'none', {})
call <sid>hi('typescriptVariable', s:blue, s:none, 'none', {})
hi link typescriptParens               typescriptBraces
hi link typescriptEndColons            typescriptBraces
hi link typescriptAmbientDeclaration   typescriptImport
hi link typescriptExport               typescriptImport
hi link typescriptModule               typescriptImport
hi link typescriptTry                  typescriptImport
hi link typescriptExceptions           typescriptImport
hi link typescriptCastKeyword          typescriptImport
hi link typescriptDefault              typescriptImport
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
