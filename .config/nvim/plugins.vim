let g:nvim_tree_update_cwd = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:deoplete#enable_at_startup = 1
let g:dashboard_default_executive ='telescope'
let g:tagbar_winsize = 8
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_width = 25
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:battery#update_tabline = 1    " For tabline.
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_bold = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open:
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']
let g:indentLine_setConceal = 1
let g:one_allow_italics = 1
let g:vimwiki_list = [{'path':'~/Documents/vimwiki'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter1-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter2-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter3-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/EcoNotes'},
            \ {'path': '~/Desktop/Comp-Sci/Notes/Chapter1'},
            \ {'path': '~/Desktop/German/DSD/'},
            \ {'path': '~/Desktop/1M1B/vimwiki'},
            \ {'path': '~/Desktop/Biology/Notes/PPT'},
            \ {'path': '~/Desktop/Physics/Notes'},
            \]

lua << EOF
local vim = vim
local gl = require('galaxyline')
local utils = require('utils')
local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista' }

-- Colors
local colors = {
  bg = '#282a36',
  fg = '#f8f8f2',
  section_bg = '#282a36',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

-- Local helper functions
local buffer_not_empty = function()
  return not utils.is_buffer_empty()
end

local in_git_repo = function ()
  local vcs = require('galaxyline.provider_vcs')
  local branch_name = vcs.get_git_branch()

  return branch_name ~= nil
end

local checkwidth = function()
  return utils.has_width_gt(40) and in_git_repo()
end

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

-- Left side
gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = { colors.cyan, colors.section_bg }
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return alias_mode..' '
    end,
    highlight = { colors.bg, colors.bg },
    separator = "  ",
    separator_highlight = {colors.bg, colors.section_bg},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}
gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}
gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = in_git_repo,
    highlight = {colors.red,colors.bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = function()
      local vcs = require('galaxyline.provider_vcs')
      local branch_name = vcs.get_git_branch()
      if (string.len(branch_name) > 28) then
        return string.sub(branch_name, 1, 25).."..."
      end
      return branch_name .. " "
    end,
    condition = in_git_repo,
    highlight = {colors.fg,colors.bg},
  }
}
gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.green, colors.bg },
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.orange, colors.bg },
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.red,colors.bg },
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return ' ' end,
    condition = buffer_not_empty,
    highlight = {colors.section_bg,colors.bg}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.section_bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.section_bg,colors.section_bg},
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange,colors.section_bg},
  }
}
gls.left[14] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.section_bg,colors.section_bg},
  }
}
gls.left[15] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

-- Right side
gls.right[1]= {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.fg,colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg,colors.bg },
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' | ',
    separator_highlight = { colors.bg, colors.section_bg },
  },
}
-- gls.right[3] = {
--   Heart = {
--     provider = function() return ' ' end,
--     highlight = { colors.red, colors.section_bg },
--     separator = ' | ',
--     separator_highlight = { colors.bg, colors.section_bg },
--   }
-- }

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = { colors.yellow, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
local g = vim.g
g.startify_lists = {
  { type = 'dir', header = { "   Current Directory "..vim.fn.getcwd()..":" } },
  { type = 'bookmarks', header = { '   Bookmarks' } }
}

g.startify_bookmarks = {
  { i = '~/.config/nvim/init.vim'},
  { m = '~/.config/nvim/maps.vim'},
  { p = '~/.config/nvim/plugins.vim'},
  { c = '~/.config/nvim/coc-conf.vim'},
  { s = '~/.config/nvim/set.vim'},
  { a = '~/.config/nvim/au.vim'},
  { u = '~/.config/nvim/ui.vim'},
  { f = '~/.config/fish/config.fish'},
}
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_position = "bottom",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {
                mirror = false,
                preview_width = 0.5
            },
            vertical = {
                mirror = false
            }
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {"node_modules", "public", "fonts"},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = "true"
    }
}
EOF
