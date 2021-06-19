" =============================================================================
" Filename: autoload/lightline/colorscheme/plastic.vim
" Author: Florian Rand
" License: MIT License
" =============================================================================
let s:foreground = [ '#a9b2c3', 235 ]
let s:background = [ '#21252b', 235 ]
let s:yellow = [ '#e5c07b', 180 ]
let s:purple = [ '#af98e6', 170 ]
let s:red = [ '#e06c75', 204 ]
let s:blue = [ '#61afef', 39 ]
let s:green = [ '#98c379', 114 ]
let s:grey = [ '#abb2bf', 59 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:foreground, s:background ], [ s:green, s:background ] ]
let s:p.normal.right = [ [ s:purple, s:background ], [ s:green, s:background ] ]
let s:p.inactive.right = [ [ s:grey, s:background ], [ s:grey, s:background ] ]
let s:p.inactive.left =  [ [ s:grey, s:background ], [ s:grey, s:background ] ]
let s:p.insert.left = [ [ s:background, s:green ], [ s:green, s:background ] ]
let s:p.replace.left = [ [ s:red, s:background ], [ s:red, s:background ] ]
let s:p.visual.left = [ [ s:background, s:purple ], [ s:purple, s:background ] ]
let s:p.normal.middle = [ [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:grey, s:background ] ]
let s:p.tabline.left = [ [ s:blue, s:grey ] ]
let s:p.tabline.tabsel = [ [ s:foreground, s:background ] ]
let s:p.tabline.middle = [ [ s:foreground, s:background ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:background, s:red ] ]
let s:p.normal.warning = [ [ s:background, s:yellow ] ]

let g:lightline#colorscheme#plastic#palette = lightline#colorscheme#flatten(s:p)

