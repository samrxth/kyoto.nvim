# vim-gitbranch
## Usage
This plugin provides a function which returns the name of the git branch.
```vim
:echo gitbranch#name()
```

You can use this function to integrate with statusline plugins.

For example, in order to show git branch using [lightline.vim](https://github.com/itchyny/lightline.vim), configure as follows.
```vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
```
See the [README.md of lightline](https://github.com/itchyny/lightline.vim) for further details.

## Installation
Install with your favorite plugin manager.

## Author
itchyny (https://github.com/itchyny)

## License
This software is released under the MIT License, see LICENSE.
