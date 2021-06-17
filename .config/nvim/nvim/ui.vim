set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set t_Co=256

lua <<EOF
--require('bufferline').setup {
--  options = {
--    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}}
--  }
--}
local bg = "#2e3440"
local bg2 = "#3b4252"
local bg3 = "#282c34"
local fg = "#CACed6"
local accent = "#81a1c1"
local accent2 = "#BF616A" -- Not saved
local accent3 = "#EBCB8B" -- Not saved
 require('bufferline').setup {
  options = {
    numbers = "none",
    mappings = true,
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    offsets = {
      {
          filetype = "NvimTree",
          text = "Files"
      }
    },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'directory' 
    },
    highlights = {
         fill = {
             guibg = bg
         },
        background = {
            guibg = bg
        },

        -- buffer
        buffer_selected = {
            guifg = fg,
            guibg = bg2,
            gui = "bold"
        },
        separator = {
            guifg = bg3,
            guibg = bg
        },
        separator_selected = {
            guifg = bg3,
            guibg = bg2
        },
        separator_visible = {
            guifg = bg2,
            guibg = bg2
        },
        indicator_selected = {
            guifg = accent,
            guibg = bg2
        },

        -- tabs over right
        tab = {
            guifg = fg,
            guibg = bg
        },
         tab_selected = {
            guifg = accent,
            guibg = bg2
        },
         tab_close = {
            guifg = accent,
            guibg = bg2
        },
        modified_selected = {
            guifg = accent2,
            guibg = bg2
        },
        modified = {
            guifg = accent3,
            guibg = bg
        },
        modified_visible = {
            guifg = accent,
            guibg = bg
        }
    }


}
 --
 --
 --local bar_fg = "#565c64"
 --local activeBuffer_fg = "#c8ccd4"
 --
 --require "bufferline".setup {
 --    options = {
 --        offsets = {{filetype = "NvimTree", text = ""}},
 --        buffer_close_icon = "",
 --        modified_icon = "",
 --        close_icon = " ",
 --        left_trunc_marker = "",
 --        right_trunc_marker = "",
 --        max_name_length = 14,
 --        max_prefix_length = 13,
 --        tab_size = 20,
 --        show_tab_indicators = true,
 --        enforce_regular_tabs = false,
 --        view = "multiwindow",
 --        show_buffer_close_icons = true,
 --        separator_style = "slant",
 --        mappings = "true"
 --    },
 --
 --    -- bar colors!!
 --    highlights = {
 --        fill = {
 --            guifg = bar_fg,
 --            guibg = "#252931"
 --        },
 --        background = {
 --            guifg = bar_fg,
 --            guibg = "#252931"
 --        },
 --
 --        -- buffer
 --        buffer_selected = {
 --            guifg = activeBuffer_fg,
 --            guibg = "#2e3440",
 --            gui = "bold"
 --        },
 --        buffer_visible = {
 --            guifg = "#9298a0",
 --            guibg = "#252931"
 --        },
 --
 --        -- tabs over right
 --        tab = {
 --            guifg = "#9298a0",
 --            guibg = "#30343c"
 --        },
 --         tab_selected = {
 --            guifg = "#30343c",
 --            guibg = "#9298a0"
 --        },
 --         tab_close = {
 --            guifg = "#d47d85",
 --            guibg = "#252931"
 --        },
 --
 --        -- buffer separators
 --        separator = {
 --            guifg = "#252931",
 --            guibg = "#252931"
 --        },
 --        separator_selected = {
 --            guifg = "#1e222a",
 --            guibg = "#1e222a"
 --        },
 --        separator_visible = {
 --            guifg = "#252931",
 --            guibg = "#252931"
 --        },
 --
 --        indicator_selected = {
 --            guifg = "#252931",
 --            guibg = "#252931"
 --        },
 --
 --        -- modified files (but not saved)
 --        modified_selected = {
 --            guifg = "#A3BE8C",
 --            guibg = "#1e222a"
 --        },
 --        modified_visible = {
 --            guifg = "#BF616A",
 --            guibg = "#23272f"
 --        }
 --    }
 --}



EOF
colorscheme base16-nord
au Filetype html,xml,xsl source ~/.config/nvim/closetag.vim
"highlight Normal ctermfg=grey guibg=NONE ctermbg=NONE
highlight Visual cterm=reverse ctermbg=NONE
highlight VertSplit cterm=reverse ctermbg=NONE guifg=#3b4252
"highlight NvimTree guibg=#282c34
highlight! StatusLineNC gui=underline guibg=NONE guifg=#3B465E



