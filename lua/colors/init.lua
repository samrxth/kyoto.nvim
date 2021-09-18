local M = {}
local g = vim.g

-- set the global theme, used at various places like theme switcher, highlights
local theme = g.kyotorc_ui.theme

local base16 = require("base16")
-- first load the base16 theme
base16(base16.themes(theme), true)

-- returns a table of colors for givem or current theme
M.get = function(theme_opt)
  if theme_opt then
    return require("hl_themes." .. theme_opt)
  end
  return require("hl_themes." .. theme)
end

return M
