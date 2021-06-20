# vim-wintabs-powerline
Powerline fonts renderers for [wintabs](https://github.com/zefei/vim-wintabs).

# Screenshots

![image](https://raw.githubusercontent.com/zefei/vim-wintabs-powerline/master/screenshots/screenshot1.png)

# Installation

Use your favorite package manager to install:

[pathogen](https://github.com/tpope/vim-pathogen)

    git clone https://github.com/zefei/vim-wintabs ~/.vim/bundle/vim-wintabs
    git clone https://github.com/zefei/vim-wintabs-powerline ~/.vim/bundle/vim-wintabs-powerline

[vundle](https://github.com/vundlevim/vundle.vim)

    plugin 'zefei/vim-wintabs'
    plugin 'zefei/vim-wintabs-powerline'

[vim-plug](https://github.com/junegunn/vim-plug)

    plug 'zefei/vim-wintabs'
    plug 'zefei/vim-wintabs-powerline'

# Configuration

- `let g:wintabs_powerline_arrow_left = " \u25c0 "`

  Left pointing arrow, used as previous buffers indicator.

- `let g:wintabs_powerline_arrow_right = " \u25b6 "`

  Right pointing arrow, used as next buffers indicator.

- `let g:wintabs_powerline_sep_buffer_transition, "\ue0b0"`

  Separator between inactive and active buffers.

- `let g:wintabs_powerline_sep_buffer = "\ue0b1"`

  Separator between inactive buffers.

- `let g:wintabs_powerline_sep_tab_transition = "\ue0b2"`

  Separator between inactive and active vimtabs.

- `let g:wintabs_powerline_sep_tab = "\ue0b3"`

  Separator between inactive vimtabs.

- `highlight link WintabsEmpty TabLineFill`

  Highlight group for background.

- `highlight link WintabsActive TabLineSel`

  Highlight group for active buffer/tab.

- `highlight link WintabsInactive TabLine`

  Highlight group for inactive buffer/tab.

- `highlight link WintabsArrow TabLine`

  Highlight group for arrows.

- `highlight link WintabsActiveNC TabLine`

  Highlight group for active buffer/tab in not-current windows.

- `highlight link WintabsInactiveNC TabLine`

  Highlight group for inactive buffer/tab in not-current windows.

# License

MIT License.
