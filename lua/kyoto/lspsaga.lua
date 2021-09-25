local function set_border()
  local default_border = _G.kyoto.interface.border_style
  if default_border == "rounded" then return "round" else return default_border end
end

require "lspsaga".init_lsp_saga {
  border_style = set_border()
}
