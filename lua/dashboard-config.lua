local vim = vim
local g = vim.g

if g.kyoto_dashboard == 0 then
  return
end

vim.cmd "packadd dashboard-nvim"

g.dashboard_default_executive = "telescope"

local custom_header = {
  "            _/_",
  "          -'a\\",
  "            ||",
  "            |J",
  "            2_\\",
  "           /:::\\",
  "          |;ooo;|",
  "          /Oo@ o\\",
  "         '/o oOo\\`",
  "         /@ O o @\\",
  "        '/.o,()o,\\`",
  "        /().O O  o\\",
  "       / @ , @. () \\",
  "      /,o O' o O o, \\",
  "   _-'. 'o _o _O_o-o.`-_",
  '   `"""---......---"""`',
  "    K Y O T O    N V I M     "
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = {"  Find File                  SPC f f"},
    command = "Telescope find_files"
  },
  b = {
    description = {"  Recents                    SPC f o"},
    command = "Telescope oldfiles"
  },
  e = {
    description = {"洛 New Buffer                 SPC g g"},
    command = "enew"
  },
  f = {
    description = {"  Edit Configuration         SPC d c"},
    command = "e ~/.config/nvim/lua/kyotorc.lua"
  }
}

g.dashboard_custom_footer = {"KYOTO.NVIM"}
