--          _/_
--        -'a\\
--          ||
--          |J
--          2_\\
--         /:::\\
--        |;ooo;|
--        /Oo@ o\\
--       '/o oOo\\`
--       /@ O o @\\
--      '/.o,()o,\\`
--      /().O O  o\\
--     / @ , @. () \\
--    /,o O' o O o, \\
-- _-'. 'o _o _O_o-o.`-_
-- `"""---......---"""`
--  K Y O T O    N V I M
-- https://github.com/samrath2007/kyoto.nvim

require("kyotorc")

require("core.settings")
require("core.globals")
require("core.plugins")

require("core.lsp")
local base16 = require("base16")
base16(base16.themes(_G.kyoto.theme), true)
